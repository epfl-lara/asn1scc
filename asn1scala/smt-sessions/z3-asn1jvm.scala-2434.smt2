; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!62018 () Bool)

(assert start!62018)

(declare-fun b!277898 () Bool)

(declare-datatypes ((Unit!19423 0))(
  ( (Unit!19424) )
))
(declare-fun e!197812 () Unit!19423)

(declare-fun Unit!19425 () Unit!19423)

(assert (=> b!277898 (= e!197812 Unit!19425)))

(declare-datatypes ((array!15972 0))(
  ( (array!15973 (arr!7904 (Array (_ BitVec 32) (_ BitVec 8))) (size!6908 (_ BitVec 32))) )
))
(declare-fun a1!699 () array!15972)

(declare-fun a2!699 () array!15972)

(declare-datatypes ((tuple4!602 0))(
  ( (tuple4!603 (_1!12376 (_ BitVec 32)) (_2!12376 (_ BitVec 32)) (_3!1081 (_ BitVec 32)) (_4!301 (_ BitVec 32))) )
))
(declare-fun lt!415649 () tuple4!602)

(declare-fun arrayRangesEq!1194 (array!15972 array!15972 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277898 (arrayRangesEq!1194 a1!699 a2!699 (_1!12376 lt!415649) (_2!12376 lt!415649))))

(declare-fun lt!415653 () Unit!19423)

(declare-fun arrayRangesEqSymmetricLemma!113 (array!15972 array!15972 (_ BitVec 32) (_ BitVec 32)) Unit!19423)

(assert (=> b!277898 (= lt!415653 (arrayRangesEqSymmetricLemma!113 a1!699 a2!699 (_1!12376 lt!415649) (_2!12376 lt!415649)))))

(assert (=> b!277898 (arrayRangesEq!1194 a2!699 a1!699 (_1!12376 lt!415649) (_2!12376 lt!415649))))

(declare-fun b!277899 () Bool)

(declare-fun e!197811 () Bool)

(declare-fun e!197810 () Bool)

(assert (=> b!277899 (= e!197811 e!197810)))

(declare-fun res!230810 () Bool)

(assert (=> b!277899 (=> (not res!230810) (not e!197810))))

(assert (=> b!277899 (= res!230810 (= (_3!1081 lt!415649) (_4!301 lt!415649)))))

(declare-fun lt!415651 () Unit!19423)

(assert (=> b!277899 (= lt!415651 e!197812)))

(declare-fun c!12717 () Bool)

(assert (=> b!277899 (= c!12717 (bvslt (_1!12376 lt!415649) (_2!12376 lt!415649)))))

(declare-fun lt!415652 () (_ BitVec 32))

(declare-fun to!789 () (_ BitVec 64))

(assert (=> b!277899 (= lt!415652 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun lt!415650 () (_ BitVec 32))

(declare-fun from!822 () (_ BitVec 64))

(assert (=> b!277899 (= lt!415650 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!602)

(assert (=> b!277899 (= lt!415649 (arrayBitIndices!0 from!822 to!789))))

(declare-fun res!230807 () Bool)

(assert (=> start!62018 (=> (not res!230807) (not e!197811))))

(assert (=> start!62018 (= res!230807 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!822) (bvsle from!822 to!789) (= (size!6908 a1!699) (size!6908 a2!699)) (bvsle to!789 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6908 a1!699))))))))

(assert (=> start!62018 e!197811))

(assert (=> start!62018 true))

(declare-fun array_inv!6632 (array!15972) Bool)

(assert (=> start!62018 (array_inv!6632 a1!699)))

(assert (=> start!62018 (array_inv!6632 a2!699)))

(declare-fun b!277900 () Bool)

(declare-fun res!230808 () Bool)

(assert (=> b!277900 (=> (not res!230808) (not e!197811))))

(declare-fun arrayBitRangesEq!0 (array!15972 array!15972 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!277900 (= res!230808 (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789))))

(declare-fun b!277901 () Bool)

(declare-fun res!230809 () Bool)

(assert (=> b!277901 (=> (not res!230809) (not e!197811))))

(assert (=> b!277901 (= res!230809 (bvslt from!822 to!789))))

(declare-fun b!277902 () Bool)

(declare-fun Unit!19426 () Unit!19423)

(assert (=> b!277902 (= e!197812 Unit!19426)))

(declare-fun b!277903 () Bool)

(assert (=> b!277903 (= e!197810 (not (and (bvsle #b00000000000000000000000000000000 lt!415650) (bvsle lt!415650 lt!415652) (bvsle lt!415652 #b00000000000000000000000000001000))))))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!277903 (byteRangesEq!0 (select (arr!7904 a1!699) (_3!1081 lt!415649)) (select (arr!7904 a2!699) (_3!1081 lt!415649)) lt!415650 lt!415652)))

(assert (= (and start!62018 res!230807) b!277900))

(assert (= (and b!277900 res!230808) b!277901))

(assert (= (and b!277901 res!230809) b!277899))

(assert (= (and b!277899 c!12717) b!277898))

(assert (= (and b!277899 (not c!12717)) b!277902))

(assert (= (and b!277899 res!230810) b!277903))

(declare-fun m!411003 () Bool)

(assert (=> b!277899 m!411003))

(declare-fun m!411005 () Bool)

(assert (=> b!277900 m!411005))

(declare-fun m!411007 () Bool)

(assert (=> b!277898 m!411007))

(declare-fun m!411009 () Bool)

(assert (=> b!277898 m!411009))

(declare-fun m!411011 () Bool)

(assert (=> b!277898 m!411011))

(declare-fun m!411013 () Bool)

(assert (=> b!277903 m!411013))

(declare-fun m!411015 () Bool)

(assert (=> b!277903 m!411015))

(assert (=> b!277903 m!411013))

(assert (=> b!277903 m!411015))

(declare-fun m!411017 () Bool)

(assert (=> b!277903 m!411017))

(declare-fun m!411019 () Bool)

(assert (=> start!62018 m!411019))

(declare-fun m!411021 () Bool)

(assert (=> start!62018 m!411021))

(check-sat (not b!277903) (not start!62018) (not b!277900) (not b!277899) (not b!277898))
(check-sat)
(get-model)

(declare-fun d!95848 () Bool)

(assert (=> d!95848 (= (arrayBitIndices!0 from!822 to!789) (tuple4!603 ((_ extract 31 0) (bvadd (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv from!822 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv to!789 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!277899 d!95848))

(declare-fun c!12726 () Bool)

(declare-fun call!4523 () Bool)

(declare-fun lt!415686 () (_ BitVec 32))

(declare-fun lt!415684 () tuple4!602)

(declare-fun bm!4520 () Bool)

(declare-fun lt!415685 () (_ BitVec 32))

(assert (=> bm!4520 (= call!4523 (byteRangesEq!0 (ite c!12726 (select (arr!7904 a1!699) (_3!1081 lt!415684)) (select (arr!7904 a1!699) (_4!301 lt!415684))) (ite c!12726 (select (arr!7904 a2!699) (_3!1081 lt!415684)) (select (arr!7904 a2!699) (_4!301 lt!415684))) (ite c!12726 lt!415685 #b00000000000000000000000000000000) lt!415686))))

(declare-fun b!277957 () Bool)

(declare-fun e!197860 () Bool)

(assert (=> b!277957 (= e!197860 call!4523)))

(declare-fun b!277958 () Bool)

(declare-fun e!197864 () Bool)

(declare-fun e!197865 () Bool)

(assert (=> b!277958 (= e!197864 e!197865)))

(declare-fun res!230849 () Bool)

(assert (=> b!277958 (=> (not res!230849) (not e!197865))))

(declare-fun e!197861 () Bool)

(assert (=> b!277958 (= res!230849 e!197861)))

(declare-fun res!230851 () Bool)

(assert (=> b!277958 (=> res!230851 e!197861)))

(assert (=> b!277958 (= res!230851 (bvsge (_1!12376 lt!415684) (_2!12376 lt!415684)))))

(assert (=> b!277958 (= lt!415686 ((_ extract 31 0) (bvsrem to!789 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277958 (= lt!415685 ((_ extract 31 0) (bvsrem from!822 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!277958 (= lt!415684 (arrayBitIndices!0 from!822 to!789))))

(declare-fun b!277959 () Bool)

(assert (=> b!277959 (= e!197861 (arrayRangesEq!1194 a1!699 a2!699 (_1!12376 lt!415684) (_2!12376 lt!415684)))))

(declare-fun b!277961 () Bool)

(declare-fun e!197863 () Bool)

(assert (=> b!277961 (= e!197863 call!4523)))

(declare-fun b!277962 () Bool)

(declare-fun res!230850 () Bool)

(assert (=> b!277962 (= res!230850 (= lt!415686 #b00000000000000000000000000000000))))

(assert (=> b!277962 (=> res!230850 e!197860)))

(declare-fun e!197862 () Bool)

(assert (=> b!277962 (= e!197862 e!197860)))

(declare-fun b!277963 () Bool)

(assert (=> b!277963 (= e!197863 e!197862)))

(declare-fun res!230852 () Bool)

(assert (=> b!277963 (= res!230852 (byteRangesEq!0 (select (arr!7904 a1!699) (_3!1081 lt!415684)) (select (arr!7904 a2!699) (_3!1081 lt!415684)) lt!415685 #b00000000000000000000000000001000))))

(assert (=> b!277963 (=> (not res!230852) (not e!197862))))

(declare-fun d!95850 () Bool)

(declare-fun res!230848 () Bool)

(assert (=> d!95850 (=> res!230848 e!197864)))

(assert (=> d!95850 (= res!230848 (bvsge from!822 to!789))))

(assert (=> d!95850 (= (arrayBitRangesEq!0 a1!699 a2!699 from!822 to!789) e!197864)))

(declare-fun b!277960 () Bool)

(assert (=> b!277960 (= e!197865 e!197863)))

(assert (=> b!277960 (= c!12726 (= (_3!1081 lt!415684) (_4!301 lt!415684)))))

(assert (= (and d!95850 (not res!230848)) b!277958))

(assert (= (and b!277958 (not res!230851)) b!277959))

(assert (= (and b!277958 res!230849) b!277960))

(assert (= (and b!277960 c!12726) b!277961))

(assert (= (and b!277960 (not c!12726)) b!277963))

(assert (= (and b!277963 res!230852) b!277962))

(assert (= (and b!277962 (not res!230850)) b!277957))

(assert (= (or b!277961 b!277957) bm!4520))

(declare-fun m!411057 () Bool)

(assert (=> bm!4520 m!411057))

(declare-fun m!411059 () Bool)

(assert (=> bm!4520 m!411059))

(declare-fun m!411061 () Bool)

(assert (=> bm!4520 m!411061))

(declare-fun m!411063 () Bool)

(assert (=> bm!4520 m!411063))

(declare-fun m!411065 () Bool)

(assert (=> bm!4520 m!411065))

(assert (=> b!277958 m!411003))

(declare-fun m!411067 () Bool)

(assert (=> b!277959 m!411067))

(assert (=> b!277963 m!411063))

(assert (=> b!277963 m!411061))

(assert (=> b!277963 m!411063))

(assert (=> b!277963 m!411061))

(declare-fun m!411069 () Bool)

(assert (=> b!277963 m!411069))

(assert (=> b!277900 d!95850))

(declare-fun d!95866 () Bool)

(assert (=> d!95866 (= (byteRangesEq!0 (select (arr!7904 a1!699) (_3!1081 lt!415649)) (select (arr!7904 a2!699) (_3!1081 lt!415649)) lt!415650 lt!415652) (or (= lt!415650 lt!415652) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7904 a1!699) (_3!1081 lt!415649))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!415652))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!415650)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7904 a2!699) (_3!1081 lt!415649))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!415652))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!415650)))) #b00000000000000000000000011111111))))))

(declare-fun bs!24165 () Bool)

(assert (= bs!24165 d!95866))

(declare-fun m!411081 () Bool)

(assert (=> bs!24165 m!411081))

(declare-fun m!411083 () Bool)

(assert (=> bs!24165 m!411083))

(assert (=> b!277903 d!95866))

(declare-fun d!95872 () Bool)

(declare-fun res!230875 () Bool)

(declare-fun e!197890 () Bool)

(assert (=> d!95872 (=> res!230875 e!197890)))

(assert (=> d!95872 (= res!230875 (= (_1!12376 lt!415649) (_2!12376 lt!415649)))))

(assert (=> d!95872 (= (arrayRangesEq!1194 a1!699 a2!699 (_1!12376 lt!415649) (_2!12376 lt!415649)) e!197890)))

(declare-fun b!277990 () Bool)

(declare-fun e!197891 () Bool)

(assert (=> b!277990 (= e!197890 e!197891)))

(declare-fun res!230876 () Bool)

(assert (=> b!277990 (=> (not res!230876) (not e!197891))))

(assert (=> b!277990 (= res!230876 (= (select (arr!7904 a1!699) (_1!12376 lt!415649)) (select (arr!7904 a2!699) (_1!12376 lt!415649))))))

(declare-fun b!277991 () Bool)

(assert (=> b!277991 (= e!197891 (arrayRangesEq!1194 a1!699 a2!699 (bvadd (_1!12376 lt!415649) #b00000000000000000000000000000001) (_2!12376 lt!415649)))))

(assert (= (and d!95872 (not res!230875)) b!277990))

(assert (= (and b!277990 res!230876) b!277991))

(declare-fun m!411089 () Bool)

(assert (=> b!277990 m!411089))

(declare-fun m!411091 () Bool)

(assert (=> b!277990 m!411091))

(declare-fun m!411093 () Bool)

(assert (=> b!277991 m!411093))

(assert (=> b!277898 d!95872))

(declare-fun d!95878 () Bool)

(assert (=> d!95878 (arrayRangesEq!1194 a2!699 a1!699 (_1!12376 lt!415649) (_2!12376 lt!415649))))

(declare-fun lt!415701 () Unit!19423)

(declare-fun choose!456 (array!15972 array!15972 (_ BitVec 32) (_ BitVec 32)) Unit!19423)

(assert (=> d!95878 (= lt!415701 (choose!456 a1!699 a2!699 (_1!12376 lt!415649) (_2!12376 lt!415649)))))

(assert (=> d!95878 (and (bvsle #b00000000000000000000000000000000 (_1!12376 lt!415649)) (bvsle (_1!12376 lt!415649) (_2!12376 lt!415649)) (bvsle (_2!12376 lt!415649) (size!6908 a1!699)))))

(assert (=> d!95878 (= (arrayRangesEqSymmetricLemma!113 a1!699 a2!699 (_1!12376 lt!415649) (_2!12376 lt!415649)) lt!415701)))

(declare-fun bs!24167 () Bool)

(assert (= bs!24167 d!95878))

(assert (=> bs!24167 m!411011))

(declare-fun m!411109 () Bool)

(assert (=> bs!24167 m!411109))

(assert (=> b!277898 d!95878))

(declare-fun d!95882 () Bool)

(declare-fun res!230882 () Bool)

(declare-fun e!197898 () Bool)

(assert (=> d!95882 (=> res!230882 e!197898)))

(assert (=> d!95882 (= res!230882 (= (_1!12376 lt!415649) (_2!12376 lt!415649)))))

(assert (=> d!95882 (= (arrayRangesEq!1194 a2!699 a1!699 (_1!12376 lt!415649) (_2!12376 lt!415649)) e!197898)))

(declare-fun b!277999 () Bool)

(declare-fun e!197899 () Bool)

(assert (=> b!277999 (= e!197898 e!197899)))

(declare-fun res!230883 () Bool)

(assert (=> b!277999 (=> (not res!230883) (not e!197899))))

(assert (=> b!277999 (= res!230883 (= (select (arr!7904 a2!699) (_1!12376 lt!415649)) (select (arr!7904 a1!699) (_1!12376 lt!415649))))))

(declare-fun b!278000 () Bool)

(assert (=> b!278000 (= e!197899 (arrayRangesEq!1194 a2!699 a1!699 (bvadd (_1!12376 lt!415649) #b00000000000000000000000000000001) (_2!12376 lt!415649)))))

(assert (= (and d!95882 (not res!230882)) b!277999))

(assert (= (and b!277999 res!230883) b!278000))

(assert (=> b!277999 m!411091))

(assert (=> b!277999 m!411089))

(declare-fun m!411111 () Bool)

(assert (=> b!278000 m!411111))

(assert (=> b!277898 d!95882))

(declare-fun d!95884 () Bool)

(assert (=> d!95884 (= (array_inv!6632 a1!699) (bvsge (size!6908 a1!699) #b00000000000000000000000000000000))))

(assert (=> start!62018 d!95884))

(declare-fun d!95888 () Bool)

(assert (=> d!95888 (= (array_inv!6632 a2!699) (bvsge (size!6908 a2!699) #b00000000000000000000000000000000))))

(assert (=> start!62018 d!95888))

(check-sat (not b!277959) (not b!277991) (not d!95878) (not b!278000) (not b!277958) (not b!277963) (not bm!4520))
(check-sat)
