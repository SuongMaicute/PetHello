
// product detail

const bigImg = document.querySelector('.img-big')
const smallImg = document.querySelectorAll('.small-img')
if (smallImg) {
    smallImg.forEach(item => {
        item.addEventListener('mouseover', () => {
            console.log(item.getAttribute('src'))
            bigImg.setAttribute('src', item.getAttribute('src'))
        })
    });
}

// delete confrim 

function showDeleteConfirm() {
    let confirm = document.querySelector(".confirm-delete")
    let bg = document.querySelector(".bg")
    confirm.classList.add('active')
    bg.classList.add('active')
}

function closeDeleteConfirm() {
    let confirm = document.querySelector(".confirm-delete")
    let bg = document.querySelector(".bg")
    confirm.classList.remove('active')
    bg.classList.remove('active')
}

const checkOutDel = document.querySelector('.check-out__delete')
if (checkOutDel) {
    checkOutDel.addEventListener("click", () => {

        showDeleteConfirm()
    })
}


const closeDelete = document.querySelector('.btn-back')

if (closeDelete) {
    closeDelete.addEventListener("click", () => {
        closeDeleteConfirm()
    })
}



const add = document.querySelectorAll('.add')
if (add) {
    add.forEach((item) => {
        item.addEventListener("click", () => {
            const quantityWrap = item.parentNode.parentNode
            const input = quantityWrap.querySelector('input')
            let value = parseInt(input.value) + 1
            if (value <= input.max) {
                input.value = value

            }
        })
    })
}

const minus = document.querySelectorAll('.minus')
if (minus) {
    minus.forEach((item) => {
        item.addEventListener("click", () => {
            const quantityWrap = item.parentNode.parentNode
            const input = quantityWrap.querySelector('input')
            let value = parseInt(input.value) - 1
            if (value > 0) {
                input.value = value
            } else {
                showDeleteConfirm()
            }
        })
    })

}




document.addEventListener("scroll", () => {
    const checkOut = document.querySelector('.check-out')
    if (checkOut) {
        if (window.scrollY < checkOut.offsetTop + checkOut.offsetHeight) {
            checkOut.classList.add('active')
        }
        if (window.scrollY > checkOut.offsetTop + checkOut.offsetHeight) {
            checkOut.classList.remove('active')
        }
    }

});

let closer = document.querySelector('#closer');

closer.onclick = () => {
    closer.style.display = 'none';
    navbar.classList.remove('active');
    cart.classList.remove('active');
    loginForm.classList.remove('active');
}

let navbar = document.querySelector('.navbar');

document.querySelector('#menu-btn').onclick = () => {
    closer.style.display = "block";
    navbar.classList.toggle('active');
}

let cart = document.querySelector('.shopping-cart');

document.querySelector('#cart-btn').onclick = () => {
    closer.style.display = "block";
    cart.classList.toggle('active');
}

let loginForm = document.querySelector('.login-form');

document.querySelector('#login-btn').onclick = () => {
    closer.style.display = "block";
    loginForm.classList.toggle('active');
}

let searchForm = document.querySelector('.header .search-form');

document.querySelector('#search-btn').onclick = () => {
    searchForm.classList.toggle('active');
}

window.onscroll = () => {
    searchForm.classList.remove('active');
}

let slides = document.querySelectorAll('.home .slides-container .slide');
let index = 0;

function next() {
    slides[index].classList.remove('active');
    index = (index + 1) % slides.length;
    slides[index].classList.add('active');
}

function prev() {
    slides[index].classList.remove('active');
    index = (index - 1 + slides.length) % slides.length;
    slides[index].classList.add('active');
}
const sign_in_btn = document.querySelector("#sign-in-btn");
const sign_up_btn = document.querySelector("#sign-up-btn");
const container = document.querySelector(".container");

sign_up_btn.addEventListener("click", () => {
    container.classList.add("sign-up-mode");
});

sign_in_btn.addEventListener("click", () => {
    container.classList.remove("sign-up-mode");
});
/* sort section  */
// Get the select element
const sortSelect = document.getElementById("sort-select");

// Add event listener to the select element
sortSelect.addEventListener("change", function () {
    const sortValue = this.value; // Get the selected value

    // Get the box container element
    const boxContainer = document.querySelector(".box-container");

    // Get all the box elements
    const boxes = boxContainer.querySelectorAll(".box");

    // Convert the NodeList to an array for easier sorting
    const boxesArray = Array.from(boxes);

    // Sort the boxes based on the selected value
    switch (sortValue) {
        case "default":
            // Do nothing (retain the default order)
            break;
        case "price-asc":
            boxesArray.sort((a, b) => {
                const priceA = parseFloat(a.querySelector(".price").textContent.replace("$", ""));
                const priceB = parseFloat(b.querySelector(".price").textContent.replace("$", ""));
                return priceA - priceB;
            });
            break;
        case "price-desc":
            boxesArray.sort((a, b) => {
                const priceA = parseFloat(a.querySelector(".price").textContent.replace("$", ""));
                const priceB = parseFloat(b.querySelector(".price").textContent.replace("$", ""));
                return priceB - priceA;
            });
            break;
        case "name-asc":
            boxesArray.sort((a, b) => {
                const nameA = a.querySelector("h3").textContent.toLowerCase();
                const nameB = b.querySelector("h3").textContent.toLowerCase();
                return nameA.localeCompare(nameB);
            });
            break;
        case "name-desc":
            boxesArray.sort((a, b) => {
                const nameA = a.querySelector("h3").textContent.toLowerCase();
                const nameB = b.querySelector("h3").textContent.toLowerCase();
                return nameB.localeCompare(nameA);
            });
            break;
    }

    // Re-append the sorted boxes to the box container
    boxContainer.innerHTML = "";
    boxesArray.forEach(box => {
        boxContainer.appendChild(box);
    });
});

//nhilty: checkout

var CSC_total_spot2 = "current-total-amount";

//Place 2:
// Specify the checkbox id values, quoted and comma 
//    separated, all one line, within the parenthesis.

var CSC_checkbox_IDs2 = new Array( "wonder-book", "wonder-course", "wonder-video" );

/* End of customization */

function AddCheckedProducts()
{
   var value = 0.0;
   for( var i=0; i<CSC_checkbox_IDs2.length; i++ )
   {
      var d = document.getElementById(CSC_checkbox_IDs2[i]);
      if( d.checked ) { value += parseFloat(d.value); }
   }
   document.getElementById(CSC_total_spot2).innerHTML = value.toFixed(2);
}




