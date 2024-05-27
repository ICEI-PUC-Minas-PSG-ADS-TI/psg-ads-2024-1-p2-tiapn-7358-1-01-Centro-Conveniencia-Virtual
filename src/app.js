const express = require('express');
const mongoose = require('mongoose');
const bcrypt = require('bcryptjs');
const dotenv = require('dotenv');
const path = require('path');

dotenv.config();

const app = express();
const PORT = process.env.PORT || 3000;

// Definição da URI do MongoDB
const MONGODB_URI = 'mongodb+srv://WareyUser:<password>@cluster0.utwneei.mongodb.net/?retryWrites=true&w=majority&appName=Cluster0';

// Conexão com o MongoDB
mongoose.connect(MONGODB_URI, {
    useNewUrlParser: true,
    useUnifiedTopology: true
}).then(() => console.log('Connected to MongoDB'))
  .catch(err => console.log(err));

// Definição do esquema do usuário
const UserSchema = new mongoose.Schema({
    name: String,
    email: { type: String, unique: true },
    password: String
});

const User = mongoose.model('User', UserSchema);

// Configuração do middleware para análise de corpos de requisição
app.use(express.urlencoded({ extended: true }));

// Configuração do middleware para servir arquivos estáticos na pasta 'public'
app.use(express.static(path.join(__dirname, 'public')));

// Rota para lidar com o cadastro de usuários
app.post('/register', async (req, res) => {
    const { name, email, password } = req.body;
    const hashedPassword = await bcrypt.hash(password, 10);
    const newUser = new User({ name, email, password: hashedPassword });
    try {
        await newUser.save();
        // Redirecionamento para a página de login após o cadastro bem-sucedido
        res.redirect('/login.html');
    } catch (err) {
        // Tratamento de erro em caso de falha no cadastro
        res.send('Error: ' + err);
    }
});

// Rota para lidar com o login de usuários
app.post('/login', async (req, res) => {
    const { email, password } = req.body;
    const user = await User.findOne({ email });
    if (user && await bcrypt.compare(password, user.password)) {
        // Se as credenciais estiverem corretas, envia "Login Successful"
        res.send('Login Successful');
    } else {
        // Se as credenciais estiverem incorretas, envia "Invalid email or password"
        res.send('Invalid email or password');
    }
});

// Inicialização do servidor
app.listen(PORT, () => {
    console.log(`Server is running on port ${PORT}`);
});
