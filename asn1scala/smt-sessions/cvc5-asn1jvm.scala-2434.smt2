; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!62016 () Bool)

(assert start!62016)

(declare-fun b!277880 () Bool)

(declare-fun e!197797 () Bool)

(declare-fun e!197799 () Bool)

(assert (=> b!277880 (= e!197797 e!197799)))

(declare-fun res!230795 () Bool)

(assert (=> b!277880 (=> (not res!230795) (not e!197799))))

(declare-datatypes ((tuple4!600 0))(
  ( (tuple4!601 (_1!12375 (_ BitVec 32)) (_2!12375 (_ BitVec 32)) (_3!1080 (_ BitVec 32)) (_4!300 (_ BitVec 32))) )
))
(declare-fun lt!415637 () tuple4!600)

(assert (=> b!277880 (= res!230795 (= (_3!1080 lt!415637) (_4!300 lt!415637)))))

(declare-datatypes ((Unit!19419 0))(
  ( (Unit!19420) )
))
(declare-fun lt!415635 () Unit!19419)

(declare-fun e!197796 () Unit!19419)

(assert (=> b!277880 (= lt!415635 e!197796)))

(declare-fun c!12714 () Bool)

(assert (=> b!277880 (= c!12714 (bvslt (_1!12375 lt!415637) (_2!12375 lt!415637)))))

(declare-fun lt!415636 () (_ BitVec 32))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277880 (= lt!415636 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415634 () (_ BitVec 32))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!277880 (= lt!415634 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!600)

(assert (=> b!277880 (= lt!415637 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277881 () Bool)

(assert (=> b!277881 (= e!197799 (not (and (bvsle #b00000000000000000000000000000000 lt!415634) (bvsle lt!415634 lt!415636) (bvsle lt!415636 #b00000000000000000000000000001000))))))

(declare-datatypes ((array!15970 0))(
  ( (array!15971 (arr!7903 (Array (_ BitVec 32) (_ BitVec 8))) (size!6907 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15970)

(declare-fun a2!699 () array!15970)

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277881 (byteRangesEq!0 (select (arr!7903 a1!699) (_3!1080 lt!415637)) (select (arr!7903 a2!699) (_3!1080 lt!415637)) lt!415634 lt!415636)))

(declare-fun b!277882 () Bool)

(declare-fun res!230797 () Bool)

(assert (=> b!277882 (=> (not res!230797) (not e!197797))))

(declare-fun arrayBitRangesEq!0 (array!15970 array!15970 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277882 (= res!230797 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277883 () Bool)

(declare-fun Unit!19421 () Unit!19419)

(assert (=> b!277883 (= e!197796 Unit!19421)))

(declare-fun res!230798 () Bool)

(assert (=> start!62016 (=> (not res!230798) (not e!197797))))

(assert (=> start!62016 (= res!230798 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6907 a1!699) (size!6907 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6907 a1!699))))))))

(assert (=> start!62016 e!197797))

(assert (=> start!62016 true))

(declare-fun array_inv!6631 (array!15970) Bool)

(assert (=> start!62016 (array_inv!6631 a1!699)))

(assert (=> start!62016 (array_inv!6631 a2!699)))

(declare-fun b!277884 () Bool)

(declare-fun res!230796 () Bool)

(assert (=> b!277884 (=> (not res!230796) (not e!197797))))

(assert (=> b!277884 (= res!230796 (bvslt from!822 to!789))))

(declare-fun b!277885 () Bool)

(declare-fun Unit!19422 () Unit!19419)

(assert (=> b!277885 (= e!197796 Unit!19422)))

(declare-fun arrayRangesEq!1193 (array!15970 array!15970 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277885 (arrayRangesEq!1193 a1!699 a2!699 (_1!12375 lt!415637) (_2!12375 lt!415637))))

(declare-fun lt!415638 () Unit!19419)

(declare-fun arrayRangesEqSymmetricLemma!112 (array!15970 array!15970 (_ BitVec 32) (_ BitVec 32)) Unit!19419)

(assert (=> b!277885 (= lt!415638 (arrayRangesEqSymmetricLemma!112 a1!699 a2!699 (_1!12375 lt!415637) (_2!12375 lt!415637)))))

(assert (=> b!277885 (arrayRangesEq!1193 a2!699 a1!699 (_1!12375 lt!415637) (_2!12375 lt!415637))))

(assert (= (and start!62016 res!230798) b!277882))

(assert (= (and b!277882 res!230797) b!277884))

(assert (= (and b!277884 res!230796) b!277880))

(assert (= (and b!277880 c!12714) b!277885))

(assert (= (and b!277880 (not c!12714)) b!277883))

(assert (= (and b!277880 res!230795) b!277881))

(declare-fun m!410983 () Bool)

(assert (=> start!62016 m!410983))

(declare-fun m!410985 () Bool)

(assert (=> start!62016 m!410985))

(declare-fun m!410987 () Bool)

(assert (=> b!277881 m!410987))

(declare-fun m!410989 () Bool)

(assert (=> b!277881 m!410989))

(assert (=> b!277881 m!410987))

(assert (=> b!277881 m!410989))

(declare-fun m!410991 () Bool)

(assert (=> b!277881 m!410991))

(declare-fun m!410993 () Bool)

(assert (=> b!277885 m!410993))

(declare-fun m!410995 () Bool)

(assert (=> b!277885 m!410995))

(declare-fun m!410997 () Bool)

(assert (=> b!277885 m!410997))

(declare-fun m!410999 () Bool)

(assert (=> b!277880 m!410999))

(declare-fun m!411001 () Bool)

(assert (=> b!277882 m!411001))

(push 1)

(assert (not start!62016))

(assert (not b!277885))

(assert (not b!277882))

(assert (not b!277880))

(assert (not b!277881))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!277950 () Bool)

(declare-fun e!197858 () Bool)

(declare-fun e!197854 () Bool)

(assert (=> b!277950 (= e!197858 e!197854)))

(declare-fun res!230847 () Bool)

(declare-fun call!4522 () Bool)

(assert (=> b!277950 (= res!230847 call!4522)))

(assert (=> b!277950 (=> (not res!230847) (not e!197854))))

(declare-fun b!277951 () Bool)

(declare-fun e!197859 () Bool)

(assert (=> b!277951 (= e!197859 e!197858)))

(declare-fun c!12725 () Bool)

(declare-fun lt!415682 () tuple4!600)

(assert (=> b!277951 (= c!12725 (= (_3!1080 lt!415682) (_4!300 lt!415682)))))

(declare-fun b!277952 () Bool)

(assert (=> b!277952 (= e!197858 call!4522)))

(declare-fun b!277953 () Bool)

(declare-fun lt!415681 () (_ BitVec 32))

(declare-fun e!197856 () Bool)

(assert (=> b!277953 (= e!197856 (byteRangesEq!0 (select (arr!7903 a1!699) (_4!300 lt!415682)) (select (arr!7903 a2!699) (_4!300 lt!415682)) #b00000000000000000000000000000000 lt!415681))))

(declare-fun b!277954 () Bool)

(declare-fun e!197855 () Bool)

(assert (=> b!277954 (= e!197855 e!197859)))

(declare-fun res!230845 () Bool)

(assert (=> b!277954 (=> (not res!230845) (not e!197859))))

(declare-fun e!197857 () Bool)

(assert (=> b!277954 (= res!230845 e!197857)))

(declare-fun res!230843 () Bool)

(assert (=> b!277954 (=> res!230843 e!197857)))

(assert (=> b!277954 (= res!230843 (bvsge (_1!12375 lt!415682) (_2!12375 lt!415682)))))

(assert (=> b!277954 (= lt!415681 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415683 () (_ BitVec 32))

(assert (=> b!277954 (= lt!415683 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277954 (= lt!415682 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277955 () Bool)

(declare-fun res!230846 () Bool)

(assert (=> b!277955 (= res!230846 (= lt!415681 #b00000000000000000000000000000000))))

(assert (=> b!277955 (=> res!230846 e!197856)))

(assert (=> b!277955 (= e!197854 e!197856)))

(declare-fun b!277956 () Bool)

(assert (=> b!277956 (= e!197857 (arrayRangesEq!1193 a1!699 a2!699 (_1!12375 lt!415682) (_2!12375 lt!415682)))))

(declare-fun bm!4519 () Bool)

(assert (=> bm!4519 (= call!4522 (byteRangesEq!0 (select (arr!7903 a1!699) (_3!1080 lt!415682)) (select (arr!7903 a2!699) (_3!1080 lt!415682)) lt!415683 (ite c!12725 lt!415681 #b00000000000000000000000000001000)))))

(declare-fun d!95852 () Bool)

(declare-fun res!230844 () Bool)

(assert (=> d!95852 (=> res!230844 e!197855)))

(assert (=> d!95852 (= res!230844 (bvsge from!822 to!789))))

(assert (=> d!95852 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197855)))

(assert (= (and d!95852 (not res!230844)) b!277954))

(assert (= (and b!277954 (not res!230843)) b!277956))

(assert (= (and b!277954 res!230845) b!277951))

(assert (= (and b!277951 c!12725) b!277952))

(assert (= (and b!277951 (not c!12725)) b!277950))

(assert (= (and b!277950 res!230847) b!277955))

(assert (= (and b!277955 (not res!230846)) b!277953))

(assert (= (or b!277952 b!277950) bm!4519))

(declare-fun m!411043 () Bool)

(assert (=> b!277953 m!411043))

(declare-fun m!411045 () Bool)

(assert (=> b!277953 m!411045))

(assert (=> b!277953 m!411043))

(assert (=> b!277953 m!411045))

(declare-fun m!411047 () Bool)

(assert (=> b!277953 m!411047))

(assert (=> b!277954 m!410999))

(declare-fun m!411049 () Bool)

(assert (=> b!277956 m!411049))

(declare-fun m!411051 () Bool)

(assert (=> bm!4519 m!411051))

(declare-fun m!411053 () Bool)

(assert (=> bm!4519 m!411053))

(assert (=> bm!4519 m!411051))

(assert (=> bm!4519 m!411053))

(declare-fun m!411055 () Bool)

(assert (=> bm!4519 m!411055))

(assert (=> b!277882 d!95852))

(declare-fun d!95854 () Bool)

(assert (=> d!95854 (= (array_inv!6631 a1!699) (bvsge (size!6907 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62016 d!95854))

(declare-fun d!95858 () Bool)

(assert (=> d!95858 (= (array_inv!6631 a2!699) (bvsge (size!6907 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62016 d!95858))

(declare-fun d!95862 () Bool)

(assert (=> d!95862 (= (byteRangesEq!0 (select (arr!7903 a1!699) (_3!1080 lt!415637)) (select (arr!7903 a2!699) (_3!1080 lt!415637)) lt!415634 lt!415636) (or (= lt!415634 lt!415636) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7903 a1!699) (_3!1080 lt!415637))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!415636))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!415634)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7903 a2!699) (_3!1080 lt!415637))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!415636))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!415634)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24164 () Bool)

(assert (= bs!24164 d!95862))

(declare-fun m!411071 () Bool)

(assert (=> bs!24164 m!411071))

(declare-fun m!411073 () Bool)

(assert (=> bs!24164 m!411073))

(assert (=> b!277881 d!95862))

(declare-fun d!95868 () Bool)

(declare-fun res!230859 () Bool)

(declare-fun e!197872 () Bool)

(assert (=> d!95868 (=> res!230859 e!197872)))

(assert (=> d!95868 (= res!230859 (= (_1!12375 lt!415637) (_2!12375 lt!415637)))))

(assert (=> d!95868 (= (arrayRangesEq!1193 a1!699 a2!699 (_1!12375 lt!415637) (_2!12375 lt!415637)) e!197872)))

(declare-fun b!277970 () Bool)

(declare-fun e!197873 () Bool)

(assert (=> b!277970 (= e!197872 e!197873)))

(declare-fun res!230860 () Bool)

(assert (=> b!277970 (=> (not res!230860) (not e!197873))))

(assert (=> b!277970 (= res!230860 (= (select (arr!7903 a1!699) (_1!12375 lt!415637)) (select (arr!7903 a2!699) (_1!12375 lt!415637))))))

(declare-fun b!277971 () Bool)

(assert (=> b!277971 (= e!197873 (arrayRangesEq!1193 a1!699 a2!699 (bvadd (_1!12375 lt!415637) #b00000000000000000000000000000001) (_2!12375 lt!415637)))))

(assert (= (and d!95868 (not res!230859)) b!277970))

(assert (= (and b!277970 res!230860) b!277971))

(declare-fun m!411075 () Bool)

(assert (=> b!277970 m!411075))

(declare-fun m!411077 () Bool)

(assert (=> b!277970 m!411077))

(declare-fun m!411079 () Bool)

(assert (=> b!277971 m!411079))

(assert (=> b!277885 d!95868))

(declare-fun d!95870 () Bool)

(assert (=> d!95870 (arrayRangesEq!1193 a2!699 a1!699 (_1!12375 lt!415637) (_2!12375 lt!415637))))

(declare-fun lt!415695 () Unit!19419)

(declare-fun choose!455 (array!15970 array!15970 (_ BitVec 32) (_ BitVec 32)) Unit!19419)

(assert (=> d!95870 (= lt!415695 (choose!455 a1!699 a2!699 (_1!12375 lt!415637) (_2!12375 lt!415637)))))

(assert (=> d!95870 (and (bvsle #b00000000000000000000000000000000 (_1!12375 lt!415637)) (bvsle (_1!12375 lt!415637) (_2!12375 lt!415637)) (bvsle (_2!12375 lt!415637) (size!6907 a1!699)))))

(assert (=> d!95870 (= (arrayRangesEqSymmetricLemma!112 a1!699 a2!699 (_1!12375 lt!415637) (_2!12375 lt!415637)) lt!415695)))

(declare-fun bs!24166 () Bool)

(assert (= bs!24166 d!95870))

(assert (=> bs!24166 m!410997))

(declare-fun m!411085 () Bool)

(assert (=> bs!24166 m!411085))

(assert (=> b!277885 d!95870))

(declare-fun d!95874 () Bool)

(declare-fun res!230873 () Bool)

(declare-fun e!197888 () Bool)

(assert (=> d!95874 (=> res!230873 e!197888)))

(assert (=> d!95874 (= res!230873 (= (_1!12375 lt!415637) (_2!12375 lt!415637)))))

(assert (=> d!95874 (= (arrayRangesEq!1193 a2!699 a1!699 (_1!12375 lt!415637) (_2!12375 lt!415637)) e!197888)))

(declare-fun b!277988 () Bool)

(declare-fun e!197889 () Bool)

(assert (=> b!277988 (= e!197888 e!197889)))

(declare-fun res!230874 () Bool)

(assert (=> b!277988 (=> (not res!230874) (not e!197889))))

(assert (=> b!277988 (= res!230874 (= (select (arr!7903 a2!699) (_1!12375 lt!415637)) (select (arr!7903 a1!699) (_1!12375 lt!415637))))))

(declare-fun b!277989 () Bool)

(assert (=> b!277989 (= e!197889 (arrayRangesEq!1193 a2!699 a1!699 (bvadd (_1!12375 lt!415637) #b00000000000000000000000000000001) (_2!12375 lt!415637)))))

(assert (= (and d!95874 (not res!230873)) b!277988))

(assert (= (and b!277988 res!230874) b!277989))

(assert (=> b!277988 m!411077))

(assert (=> b!277988 m!411075))

(declare-fun m!411087 () Bool)

(assert (=> b!277989 m!411087))

(assert (=> b!277885 d!95874))

(declare-fun d!95876 () Bool)

(assert (=> d!95876 (= (arrayBitIndices!0 from!822 to!789) (tuple4!601 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277880 d!95876))

(push 1)

(assert (not b!277956))

(assert (not d!95870))

(assert (not b!277989))

(assert (not b!277953))

(assert (not b!277971))

(assert (not b!277954))

(assert (not bm!4519))

(check-sat)

(pop 1)

(push 1)

(check-sat)

