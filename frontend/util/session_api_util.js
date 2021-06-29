export const signUp =()=>{
    return $.ajax({
    method:"POST",
    url:"/api/users",
    });
};

export const logIn =()=>{
    return $.ajax({
    method:"POST",
    url:"/api/sessions",
    });
};

export const logOut =()=>{
    return $.ajax({
        method:"DELETE",
        url:"/api/session",
    });
};