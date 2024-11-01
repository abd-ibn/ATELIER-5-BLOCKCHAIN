// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MiniSocial {
    // Structure pour stocker les messages et leurs auteurs
    struct Post {
        string message;
        address author;
    }

    // Tableau dynamique pour stocker les posts
    Post[] public posts;

    // Fonction pour publier un message
    function publishPost(string memory _message) public {
        Post memory newPost = Post({
            message: _message,
            author: msg.sender
        });
        posts.push(newPost);
    }

    // Fonction pour récupérer un post par index
    function getPost(uint index) public view returns (string memory, address) {
        require(index < posts.length, "Index invalide");
        Post memory post = posts[index];
        return (post.message, post.author);
    }

    // Fonction pour récupérer le nombre total de posts
    function getTotalPosts() public view returns (uint) {
        return posts.length;
    }
}
