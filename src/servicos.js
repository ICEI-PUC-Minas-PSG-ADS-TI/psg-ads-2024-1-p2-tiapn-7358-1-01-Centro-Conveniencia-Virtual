document.addEventListener('DOMContentLoaded', function() {
    const stars = document.querySelectorAll('.star');
    const commentBox = document.querySelector('.comment');
    const userNameInput = document.querySelector('.user-name');
    const submitCommentButton = document.querySelector('.submit-comment');
    const commentsContainer = document.getElementById('comments-container');
    let selectedRating = 0;
    let selectedService = ''; // Variável para armazenar o serviço escolhido

    // Função para manipular a avaliação por estrelas
    stars.forEach(star => {
        star.addEventListener('mouseover', function() {
            resetStars();
            highlightStars(this.getAttribute('data-value'));
        });

        star.addEventListener('click', function() {
            selectedRating = this.getAttribute('data-value');
            alert(`Você avaliou com ${selectedRating} estrelas`);
        });

        star.addEventListener('mouseout', function() {
            if (selectedRating === 0) {
                resetStars();
            } else {
                highlightStars(selectedRating);
            }
        });
    });

    function resetStars() {
        stars.forEach(star => star.style.color = 'gold');
    }

    function highlightStars(value) {
        for (let i = 0; i < value; i++) {
            stars[i].style.color = 'orange';
        }
    }

    // Função para salvar comentário e avaliação no localStorage
    function saveComment(userName, comment, rating) {
        const comments = JSON.parse(localStorage.getItem('comments')) || [];
        comments.push({ userName, comment, rating, selectedService }); // Incluindo o serviço escolhido no objeto
        localStorage.setItem('comments', JSON.stringify(comments));
        displayComments();
    }

    // Função para exibir os comentários salvos
    function displayComments() {
        const comments = JSON.parse(localStorage.getItem('comments')) || [];
        commentsContainer.innerHTML = '';
        comments.forEach(comment => {
            const commentElement = document.createElement('div');
            commentElement.classList.add('comment-item');
            commentElement.innerHTML = `
                <p><strong>${comment.userName}</strong> (${comment.rating} estrelas) - Serviço: ${comment.selectedService}:</p>
                <p>${comment.comment}</p>
            `;
            commentsContainer.appendChild(commentElement);
        });
    }

    // Carregar comentários ao iniciar a página
    displayComments();

    // Função para enviar o comentário
    submitCommentButton.addEventListener('click', function() {
        const userName = userNameInput.value.trim();
        const comment = commentBox.value.trim();
        if (userName && comment && selectedRating > 0) {
            saveComment(userName, comment, selectedRating);
            userNameInput.value = '';
            commentBox.value = '';
            selectedRating = 0;
            resetStars();
        } else {
            alert('Por favor, preencha todos os campos e selecione uma avaliação.');
        }
    });

    // Função para o botão de contratar
    const hireButton = document.querySelector('.hire-button');
    hireButton.addEventListener('click', function() {
        const scheduleInput = document.querySelector('.schedule-input').value;
        if (scheduleInput) {
            alert(`Serviço contratado para: ${new Date(scheduleInput).toLocaleString()} - Serviço: ${selectedService}`);
            document.querySelector('.chatbox').style.display = 'flex';
        } else {
            alert('Por favor, selecione um dia e horário.');
        }
    });

    // Funções do chat
    const chatbox = document.getElementById('chatbox');
    const closeChatboxButton = chatbox.querySelector('.close-chatbox');
    const sendMessageButton = document.getElementById('send-message');
    const chatInput = document.getElementById('chat-input');
    const chatboxBody = document.getElementById('chatbox-body');

    // Função para fechar o chat
    closeChatboxButton.addEventListener('click', function() {
        chatbox.style.display = 'none';
    });

    // Função para enviar uma mensagem no chat
    sendMessageButton.addEventListener('click', sendMessage);
    chatInput.addEventListener('keypress', function(e) {
        if (e.key === 'Enter') {
            sendMessage();
        }
    });

    function sendMessage() {
        const messageText = chatInput.value.trim();
        if (messageText !== '') {
            const messageElement = document.createElement('div');
            messageElement.classList.add('message', 'sent');
            messageElement.textContent = messageText;
            chatboxBody.appendChild(messageElement);
            chatInput.value = '';
            chatboxBody.scrollTop = chatboxBody.scrollHeight;
        }
    }

    // Botões "Escolher" para serviços básico e premium
    const choosePlanButtons = document.querySelectorAll('.choose-plan');
    choosePlanButtons.forEach(button => {
        button.addEventListener('click', function() {
            selectedService = this.parentNode.querySelector('h4').textContent; // Obtendo o nome do serviço selecionado
            alert(`Você escolheu o serviço: ${selectedService}`);
        });
    });
});

