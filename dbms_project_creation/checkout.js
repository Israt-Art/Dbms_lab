function confirmOrder() {
    const name = document.getElementById('userName').value.trim();
    const phone = document.getElementById('userPhone').value.trim();
    const address = document.getElementById('userAddress').value.trim();
    const paymentMethodInput = document.querySelector('input[name="payment"]:checked');
    const cart = JSON.parse(localStorage.getItem('userCart')) || [];

    if (cart.length === 0) {
        alert("Your cart is empty! Please add items before checking out.");
        return;
    }

    if (!name || !phone || !address || !paymentMethodInput) {
        alert("Please fill in all delivery details and select a payment method.");
        return;
    }

    const finalTotal = document.getElementById('finalTotal').innerText;

    
    const newOrder = {
        id: "FE-" + Math.floor(1000 + Math.random() * 9000),
        date: new Date().toLocaleDateString('en-GB', {
            day: '2-digit',
            month: 'short',
            year: 'numeric',
            hour: '2-digit',
            minute: '2-digit'
        }),
        items: cart.map(item => item.name).join(", "),
        total: finalTotal,
        method: paymentMethodInput.value === 'mobile' ? 'Mobile Banking' : 'Cash on Delivery',
        status: 'Delivered' 
    };

    
    const history = JSON.parse(localStorage.getItem('orderHistory')) || [];
    history.unshift(newOrder); 
    localStorage.setItem('orderHistory', JSON.stringify(history));

    alert("Order Successful! Your Order ID is " + newOrder.id);
    localStorage.removeItem('userCart'); 
    window.location.href = "wallet.html"; 
}