; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!67198 () Bool)

(assert start!67198)

(declare-fun res!248460 () Bool)

(declare-fun e!216823 () Bool)

(assert (=> start!67198 (=> (not res!248460) (not e!216823))))

(declare-fun fromBit!258 () (_ BitVec 64))

(declare-fun toBit!258 () (_ BitVec 64))

(declare-datatypes ((array!18285 0))(
  ( (array!18286 (arr!9024 (Array (_ BitVec 32) (_ BitVec 8))) (size!7941 (_ BitVec 32))) )
))
(declare-fun a1!948 () array!18285)

(declare-fun a2!948 () array!18285)

(assert (=> start!67198 (= res!248460 (and (bvsle (size!7941 a1!948) (size!7941 a2!948)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 fromBit!258) (bvsle fromBit!258 toBit!258)))))

(assert (=> start!67198 e!216823))

(assert (=> start!67198 true))

(declare-fun array_inv!7553 (array!18285) Bool)

(assert (=> start!67198 (array_inv!7553 a1!948)))

(assert (=> start!67198 (array_inv!7553 a2!948)))

(declare-fun b!301858 () Bool)

(declare-fun e!216825 () Bool)

(assert (=> b!301858 (= e!216823 e!216825)))

(declare-fun res!248462 () Bool)

(assert (=> b!301858 (=> (not res!248462) (not e!216825))))

(declare-fun lt!436961 () (_ BitVec 64))

(assert (=> b!301858 (= res!248462 (and (bvsle toBit!258 lt!436961) (bvsle fromBit!258 lt!436961)))))

(assert (=> b!301858 (= lt!436961 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7941 a1!948))))))

(declare-fun b!301859 () Bool)

(declare-fun res!248459 () Bool)

(assert (=> b!301859 (=> (not res!248459) (not e!216825))))

(declare-fun arrayBitRangesEq!0 (array!18285 array!18285 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!301859 (= res!248459 (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258))))

(declare-fun b!301860 () Bool)

(declare-datatypes ((Unit!21140 0))(
  ( (Unit!21141) )
))
(declare-fun e!216817 () Unit!21140)

(declare-fun lt!436964 () Unit!21140)

(assert (=> b!301860 (= e!216817 lt!436964)))

(declare-datatypes ((tuple4!1090 0))(
  ( (tuple4!1091 (_1!13200 (_ BitVec 32)) (_2!13200 (_ BitVec 32)) (_3!1502 (_ BitVec 32)) (_4!545 (_ BitVec 32))) )
))
(declare-fun lt!436971 () tuple4!1090)

(declare-fun lt!436968 () tuple4!1090)

(declare-fun arrayRangesEqSlicedLemma!213 (array!18285 array!18285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21140)

(assert (=> b!301860 (= lt!436964 (arrayRangesEqSlicedLemma!213 a1!948 a2!948 (_1!13200 lt!436971) (_2!13200 lt!436971) (_1!13200 lt!436968) (_2!13200 lt!436968)))))

(declare-fun arrayRangesEq!1603 (array!18285 array!18285 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301860 (arrayRangesEq!1603 a1!948 a2!948 (_1!13200 lt!436968) (_2!13200 lt!436968))))

(declare-fun b!301861 () Bool)

(declare-fun res!248461 () Bool)

(declare-fun lt!436970 () (_ BitVec 32))

(assert (=> b!301861 (= res!248461 (= lt!436970 #b00000000000000000000000000000000))))

(declare-fun e!216816 () Bool)

(assert (=> b!301861 (=> res!248461 e!216816)))

(declare-fun e!216821 () Bool)

(assert (=> b!301861 (= e!216821 e!216816)))

(declare-fun e!216815 () Bool)

(declare-fun b!301862 () Bool)

(declare-fun fromSlice!52 () (_ BitVec 64))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!301862 (= e!216815 (not (byteRangesEq!0 (select (arr!9024 a1!948) (_3!1502 lt!436968)) (select (arr!9024 a2!948) (_3!1502 lt!436968)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111)))))

(declare-fun b!301863 () Bool)

(declare-fun e!216818 () Unit!21140)

(declare-fun lt!436967 () Unit!21140)

(assert (=> b!301863 (= e!216818 lt!436967)))

(declare-fun arrayRangesEqImpliesEq!255 (array!18285 array!18285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21140)

(assert (=> b!301863 (= lt!436967 (arrayRangesEqImpliesEq!255 a1!948 a2!948 (_1!13200 lt!436971) (_3!1502 lt!436968) (_2!13200 lt!436971)))))

(assert (=> b!301863 (= (select (arr!9024 a1!948) (_3!1502 lt!436968)) (select (arr!9024 a2!948) (_3!1502 lt!436968)))))

(declare-fun c!14284 () Bool)

(declare-fun lt!436963 () (_ BitVec 32))

(declare-fun bm!5480 () Bool)

(declare-fun call!5483 () Bool)

(assert (=> bm!5480 (= call!5483 (byteRangesEq!0 (ite c!14284 (select (arr!9024 a1!948) (_3!1502 lt!436971)) (select (arr!9024 a1!948) (_4!545 lt!436971))) (ite c!14284 (select (arr!9024 a2!948) (_3!1502 lt!436971)) (select (arr!9024 a2!948) (_4!545 lt!436971))) (ite c!14284 lt!436963 #b00000000000000000000000000000000) lt!436970))))

(declare-fun b!301864 () Bool)

(declare-fun Unit!21142 () Unit!21140)

(assert (=> b!301864 (= e!216817 Unit!21142)))

(declare-fun b!301865 () Bool)

(declare-fun e!216824 () Unit!21140)

(declare-fun lt!436966 () Unit!21140)

(assert (=> b!301865 (= e!216824 lt!436966)))

(assert (=> b!301865 (= lt!436966 (arrayRangesEqImpliesEq!255 a1!948 a2!948 (_1!13200 lt!436971) (_4!545 lt!436968) (_2!13200 lt!436971)))))

(assert (=> b!301865 (= (select (arr!9024 a1!948) (_4!545 lt!436968)) (select (arr!9024 a2!948) (_4!545 lt!436968)))))

(declare-fun b!301866 () Bool)

(declare-fun e!216822 () Bool)

(assert (=> b!301866 (= e!216825 e!216822)))

(declare-fun res!248456 () Bool)

(assert (=> b!301866 (=> (not res!248456) (not e!216822))))

(declare-fun e!216819 () Bool)

(assert (=> b!301866 (= res!248456 e!216819)))

(assert (=> b!301866 (= c!14284 (= (_3!1502 lt!436971) (_4!545 lt!436971)))))

(declare-fun lt!436965 () Unit!21140)

(assert (=> b!301866 (= lt!436965 e!216817)))

(declare-fun c!14286 () Bool)

(assert (=> b!301866 (= c!14286 (bvslt (_1!13200 lt!436968) (_2!13200 lt!436968)))))

(declare-fun toSlice!52 () (_ BitVec 64))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!1090)

(assert (=> b!301866 (= lt!436968 (arrayBitIndices!0 fromSlice!52 toSlice!52))))

(assert (=> b!301866 (= lt!436970 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301866 (= lt!436963 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301866 (= lt!436971 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301867 () Bool)

(declare-fun Unit!21143 () Unit!21140)

(assert (=> b!301867 (= e!216818 Unit!21143)))

(declare-fun b!301868 () Bool)

(assert (=> b!301868 (= e!216816 call!5483)))

(declare-fun b!301869 () Bool)

(declare-fun res!248457 () Bool)

(assert (=> b!301869 (=> (not res!248457) (not e!216825))))

(assert (=> b!301869 (= res!248457 (and (bvsle fromBit!258 fromSlice!52) (bvsle fromSlice!52 toSlice!52) (bvsle toSlice!52 toBit!258) (bvsle fromSlice!52 lt!436961) (not (= fromSlice!52 toSlice!52))))))

(declare-fun b!301870 () Bool)

(assert (=> b!301870 (= e!216819 e!216821)))

(declare-fun res!248463 () Bool)

(assert (=> b!301870 (= res!248463 (byteRangesEq!0 (select (arr!9024 a1!948) (_3!1502 lt!436971)) (select (arr!9024 a2!948) (_3!1502 lt!436971)) lt!436963 #b00000000000000000000000000000111))))

(assert (=> b!301870 (=> (not res!248463) (not e!216821))))

(declare-fun b!301871 () Bool)

(assert (=> b!301871 (= e!216819 call!5483)))

(declare-fun b!301872 () Bool)

(assert (=> b!301872 (= e!216822 e!216815)))

(declare-fun res!248458 () Bool)

(assert (=> b!301872 (=> (not res!248458) (not e!216815))))

(assert (=> b!301872 (= res!248458 (not (= (_3!1502 lt!436968) (_4!545 lt!436968))))))

(declare-fun lt!436962 () Unit!21140)

(assert (=> b!301872 (= lt!436962 e!216824)))

(declare-fun c!14283 () Bool)

(assert (=> b!301872 (= c!14283 (and (bvslt (_4!545 lt!436968) (_4!545 lt!436971)) (bvslt (_3!1502 lt!436971) (_4!545 lt!436968))))))

(declare-fun lt!436969 () Unit!21140)

(assert (=> b!301872 (= lt!436969 e!216818)))

(declare-fun c!14285 () Bool)

(assert (=> b!301872 (= c!14285 (and (bvslt (_3!1502 lt!436971) (_3!1502 lt!436968)) (bvslt (_3!1502 lt!436968) (_4!545 lt!436971))))))

(declare-fun b!301873 () Bool)

(declare-fun Unit!21144 () Unit!21140)

(assert (=> b!301873 (= e!216824 Unit!21144)))

(assert (= (and start!67198 res!248460) b!301858))

(assert (= (and b!301858 res!248462) b!301859))

(assert (= (and b!301859 res!248459) b!301869))

(assert (= (and b!301869 res!248457) b!301866))

(assert (= (and b!301866 c!14286) b!301860))

(assert (= (and b!301866 (not c!14286)) b!301864))

(assert (= (and b!301866 c!14284) b!301871))

(assert (= (and b!301866 (not c!14284)) b!301870))

(assert (= (and b!301870 res!248463) b!301861))

(assert (= (and b!301861 (not res!248461)) b!301868))

(assert (= (or b!301871 b!301868) bm!5480))

(assert (= (and b!301866 res!248456) b!301872))

(assert (= (and b!301872 c!14285) b!301863))

(assert (= (and b!301872 (not c!14285)) b!301867))

(assert (= (and b!301872 c!14283) b!301865))

(assert (= (and b!301872 (not c!14283)) b!301873))

(assert (= (and b!301872 res!248458) b!301862))

(declare-fun m!440681 () Bool)

(assert (=> b!301862 m!440681))

(declare-fun m!440683 () Bool)

(assert (=> b!301862 m!440683))

(assert (=> b!301862 m!440681))

(assert (=> b!301862 m!440683))

(declare-fun m!440685 () Bool)

(assert (=> b!301862 m!440685))

(declare-fun m!440687 () Bool)

(assert (=> b!301863 m!440687))

(assert (=> b!301863 m!440681))

(assert (=> b!301863 m!440683))

(declare-fun m!440689 () Bool)

(assert (=> b!301865 m!440689))

(declare-fun m!440691 () Bool)

(assert (=> b!301865 m!440691))

(declare-fun m!440693 () Bool)

(assert (=> b!301865 m!440693))

(declare-fun m!440695 () Bool)

(assert (=> bm!5480 m!440695))

(declare-fun m!440697 () Bool)

(assert (=> bm!5480 m!440697))

(declare-fun m!440699 () Bool)

(assert (=> bm!5480 m!440699))

(declare-fun m!440701 () Bool)

(assert (=> bm!5480 m!440701))

(declare-fun m!440703 () Bool)

(assert (=> bm!5480 m!440703))

(declare-fun m!440705 () Bool)

(assert (=> b!301859 m!440705))

(declare-fun m!440707 () Bool)

(assert (=> b!301860 m!440707))

(declare-fun m!440709 () Bool)

(assert (=> b!301860 m!440709))

(assert (=> b!301870 m!440703))

(assert (=> b!301870 m!440701))

(assert (=> b!301870 m!440703))

(assert (=> b!301870 m!440701))

(declare-fun m!440711 () Bool)

(assert (=> b!301870 m!440711))

(declare-fun m!440713 () Bool)

(assert (=> start!67198 m!440713))

(declare-fun m!440715 () Bool)

(assert (=> start!67198 m!440715))

(declare-fun m!440717 () Bool)

(assert (=> b!301866 m!440717))

(declare-fun m!440719 () Bool)

(assert (=> b!301866 m!440719))

(push 1)

(assert (not b!301863))

(assert (not b!301862))

(assert (not start!67198))

(assert (not bm!5480))

(assert (not b!301860))

(assert (not b!301866))

(assert (not b!301870))

(assert (not b!301865))

(assert (not b!301859))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!100928 () Bool)

(assert (=> d!100928 (= (byteRangesEq!0 (select (arr!9024 a1!948) (_3!1502 lt!436971)) (select (arr!9024 a2!948) (_3!1502 lt!436971)) lt!436963 #b00000000000000000000000000000111) (or (= lt!436963 #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9024 a1!948) (_3!1502 lt!436971))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436963)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9024 a2!948) (_3!1502 lt!436971))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!436963)))) #b00000000000000000000000011111111))))))

(declare-fun bs!26034 () Bool)

(assert (= bs!26034 d!100928))

(declare-fun m!440793 () Bool)

(assert (=> bs!26034 m!440793))

(declare-fun m!440795 () Bool)

(assert (=> bs!26034 m!440795))

(assert (=> b!301870 d!100928))

(declare-fun d!100936 () Bool)

(assert (=> d!100936 (and (bvsge (_4!545 lt!436968) #b00000000000000000000000000000000) (bvslt (_4!545 lt!436968) (size!7941 a1!948)) (bvslt (_4!545 lt!436968) (size!7941 a2!948)) (= (select (arr!9024 a1!948) (_4!545 lt!436968)) (select (arr!9024 a2!948) (_4!545 lt!436968))))))

(declare-fun lt!437006 () Unit!21140)

(declare-fun choose!540 (array!18285 array!18285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21140)

(assert (=> d!100936 (= lt!437006 (choose!540 a1!948 a2!948 (_1!13200 lt!436971) (_4!545 lt!436968) (_2!13200 lt!436971)))))

(assert (=> d!100936 (and (bvsle #b00000000000000000000000000000000 (_1!13200 lt!436971)) (bvsle (_1!13200 lt!436971) (_2!13200 lt!436971)))))

(assert (=> d!100936 (= (arrayRangesEqImpliesEq!255 a1!948 a2!948 (_1!13200 lt!436971) (_4!545 lt!436968) (_2!13200 lt!436971)) lt!437006)))

(declare-fun bs!26035 () Bool)

(assert (= bs!26035 d!100936))

(assert (=> bs!26035 m!440691))

(assert (=> bs!26035 m!440693))

(declare-fun m!440797 () Bool)

(assert (=> bs!26035 m!440797))

(assert (=> b!301865 d!100936))

(declare-fun d!100938 () Bool)

(assert (=> d!100938 (arrayRangesEq!1603 a1!948 a2!948 (_1!13200 lt!436968) (_2!13200 lt!436968))))

(declare-fun lt!437009 () Unit!21140)

(declare-fun choose!541 (array!18285 array!18285 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!21140)

(assert (=> d!100938 (= lt!437009 (choose!541 a1!948 a2!948 (_1!13200 lt!436971) (_2!13200 lt!436971) (_1!13200 lt!436968) (_2!13200 lt!436968)))))

(assert (=> d!100938 (and (bvsle #b00000000000000000000000000000000 (_1!13200 lt!436971)) (bvsle (_1!13200 lt!436971) (_2!13200 lt!436971)))))

(assert (=> d!100938 (= (arrayRangesEqSlicedLemma!213 a1!948 a2!948 (_1!13200 lt!436971) (_2!13200 lt!436971) (_1!13200 lt!436968) (_2!13200 lt!436968)) lt!437009)))

(declare-fun bs!26036 () Bool)

(assert (= bs!26036 d!100938))

(assert (=> bs!26036 m!440709))

(declare-fun m!440799 () Bool)

(assert (=> bs!26036 m!440799))

(assert (=> b!301860 d!100938))

(declare-fun d!100940 () Bool)

(declare-fun res!248510 () Bool)

(declare-fun e!216879 () Bool)

(assert (=> d!100940 (=> res!248510 e!216879)))

(assert (=> d!100940 (= res!248510 (= (_1!13200 lt!436968) (_2!13200 lt!436968)))))

(assert (=> d!100940 (= (arrayRangesEq!1603 a1!948 a2!948 (_1!13200 lt!436968) (_2!13200 lt!436968)) e!216879)))

(declare-fun b!301932 () Bool)

(declare-fun e!216880 () Bool)

(assert (=> b!301932 (= e!216879 e!216880)))

(declare-fun res!248511 () Bool)

(assert (=> b!301932 (=> (not res!248511) (not e!216880))))

(assert (=> b!301932 (= res!248511 (= (select (arr!9024 a1!948) (_1!13200 lt!436968)) (select (arr!9024 a2!948) (_1!13200 lt!436968))))))

(declare-fun b!301933 () Bool)

(assert (=> b!301933 (= e!216880 (arrayRangesEq!1603 a1!948 a2!948 (bvadd (_1!13200 lt!436968) #b00000000000000000000000000000001) (_2!13200 lt!436968)))))

(assert (= (and d!100940 (not res!248510)) b!301932))

(assert (= (and b!301932 res!248511) b!301933))

(declare-fun m!440801 () Bool)

(assert (=> b!301932 m!440801))

(declare-fun m!440803 () Bool)

(assert (=> b!301932 m!440803))

(declare-fun m!440805 () Bool)

(assert (=> b!301933 m!440805))

(assert (=> b!301860 d!100940))

(declare-fun b!301948 () Bool)

(declare-fun e!216898 () Bool)

(declare-fun e!216896 () Bool)

(assert (=> b!301948 (= e!216898 e!216896)))

(declare-fun lt!437017 () (_ BitVec 32))

(declare-fun lt!437016 () tuple4!1090)

(declare-fun res!248523 () Bool)

(assert (=> b!301948 (= res!248523 (byteRangesEq!0 (select (arr!9024 a1!948) (_3!1502 lt!437016)) (select (arr!9024 a2!948) (_3!1502 lt!437016)) lt!437017 #b00000000000000000000000000001000))))

(assert (=> b!301948 (=> (not res!248523) (not e!216896))))

(declare-fun c!14295 () Bool)

(declare-fun lt!437018 () (_ BitVec 32))

(declare-fun bm!5489 () Bool)

(declare-fun call!5492 () Bool)

(assert (=> bm!5489 (= call!5492 (byteRangesEq!0 (ite c!14295 (select (arr!9024 a1!948) (_3!1502 lt!437016)) (select (arr!9024 a1!948) (_4!545 lt!437016))) (ite c!14295 (select (arr!9024 a2!948) (_3!1502 lt!437016)) (select (arr!9024 a2!948) (_4!545 lt!437016))) (ite c!14295 lt!437017 #b00000000000000000000000000000000) lt!437018))))

(declare-fun d!100942 () Bool)

(declare-fun res!248526 () Bool)

(declare-fun e!216893 () Bool)

(assert (=> d!100942 (=> res!248526 e!216893)))

(assert (=> d!100942 (= res!248526 (bvsge fromBit!258 toBit!258))))

(assert (=> d!100942 (= (arrayBitRangesEq!0 a1!948 a2!948 fromBit!258 toBit!258) e!216893)))

(declare-fun b!301949 () Bool)

(assert (=> b!301949 (= e!216898 call!5492)))

(declare-fun b!301950 () Bool)

(declare-fun e!216895 () Bool)

(assert (=> b!301950 (= e!216895 e!216898)))

(assert (=> b!301950 (= c!14295 (= (_3!1502 lt!437016) (_4!545 lt!437016)))))

(declare-fun e!216897 () Bool)

(declare-fun b!301951 () Bool)

(assert (=> b!301951 (= e!216897 (arrayRangesEq!1603 a1!948 a2!948 (_1!13200 lt!437016) (_2!13200 lt!437016)))))

(declare-fun b!301952 () Bool)

(declare-fun e!216894 () Bool)

(assert (=> b!301952 (= e!216894 call!5492)))

(declare-fun b!301953 () Bool)

(assert (=> b!301953 (= e!216893 e!216895)))

(declare-fun res!248524 () Bool)

(assert (=> b!301953 (=> (not res!248524) (not e!216895))))

(assert (=> b!301953 (= res!248524 e!216897)))

(declare-fun res!248522 () Bool)

(assert (=> b!301953 (=> res!248522 e!216897)))

(assert (=> b!301953 (= res!248522 (bvsge (_1!13200 lt!437016) (_2!13200 lt!437016)))))

(assert (=> b!301953 (= lt!437018 ((_ extract 31 0) (bvsrem toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301953 (= lt!437017 ((_ extract 31 0) (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!301953 (= lt!437016 (arrayBitIndices!0 fromBit!258 toBit!258))))

(declare-fun b!301954 () Bool)

(declare-fun res!248525 () Bool)

(assert (=> b!301954 (= res!248525 (= lt!437018 #b00000000000000000000000000000000))))

(assert (=> b!301954 (=> res!248525 e!216894)))

(assert (=> b!301954 (= e!216896 e!216894)))

(assert (= (and d!100942 (not res!248526)) b!301953))

(assert (= (and b!301953 (not res!248522)) b!301951))

(assert (= (and b!301953 res!248524) b!301950))

(assert (= (and b!301950 c!14295) b!301949))

(assert (= (and b!301950 (not c!14295)) b!301948))

(assert (= (and b!301948 res!248523) b!301954))

(assert (= (and b!301954 (not res!248525)) b!301952))

(assert (= (or b!301949 b!301952) bm!5489))

(declare-fun m!440807 () Bool)

(assert (=> b!301948 m!440807))

(declare-fun m!440809 () Bool)

(assert (=> b!301948 m!440809))

(assert (=> b!301948 m!440807))

(assert (=> b!301948 m!440809))

(declare-fun m!440811 () Bool)

(assert (=> b!301948 m!440811))

(declare-fun m!440813 () Bool)

(assert (=> bm!5489 m!440813))

(declare-fun m!440815 () Bool)

(assert (=> bm!5489 m!440815))

(assert (=> bm!5489 m!440807))

(declare-fun m!440817 () Bool)

(assert (=> bm!5489 m!440817))

(assert (=> bm!5489 m!440809))

(declare-fun m!440819 () Bool)

(assert (=> b!301951 m!440819))

(assert (=> b!301953 m!440719))

(assert (=> b!301859 d!100942))

(declare-fun d!100944 () Bool)

(assert (=> d!100944 (= (array_inv!7553 a1!948) (bvsge (size!7941 a1!948) #b00000000000000000000000000000000))))

(assert (=> start!67198 d!100944))

(declare-fun d!100946 () Bool)

(assert (=> d!100946 (= (array_inv!7553 a2!948) (bvsge (size!7941 a2!948) #b00000000000000000000000000000000))))

(assert (=> start!67198 d!100946))

(declare-fun d!100948 () Bool)

(assert (=> d!100948 (= (byteRangesEq!0 (ite c!14284 (select (arr!9024 a1!948) (_3!1502 lt!436971)) (select (arr!9024 a1!948) (_4!545 lt!436971))) (ite c!14284 (select (arr!9024 a2!948) (_3!1502 lt!436971)) (select (arr!9024 a2!948) (_4!545 lt!436971))) (ite c!14284 lt!436963 #b00000000000000000000000000000000) lt!436970) (or (= (ite c!14284 lt!436963 #b00000000000000000000000000000000) lt!436970) (= (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14284 (select (arr!9024 a1!948) (_3!1502 lt!436971)) (select (arr!9024 a1!948) (_4!545 lt!436971)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436970))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14284 lt!436963 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (ite c!14284 (select (arr!9024 a2!948) (_3!1502 lt!436971)) (select (arr!9024 a2!948) (_4!545 lt!436971)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!436970))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 (ite c!14284 lt!436963 #b00000000000000000000000000000000))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26037 () Bool)

(assert (= bs!26037 d!100948))

(declare-fun m!440821 () Bool)

(assert (=> bs!26037 m!440821))

(declare-fun m!440823 () Bool)

(assert (=> bs!26037 m!440823))

(assert (=> bm!5480 d!100948))

(declare-fun d!100950 () Bool)

(assert (=> d!100950 (and (bvsge (_3!1502 lt!436968) #b00000000000000000000000000000000) (bvslt (_3!1502 lt!436968) (size!7941 a1!948)) (bvslt (_3!1502 lt!436968) (size!7941 a2!948)) (= (select (arr!9024 a1!948) (_3!1502 lt!436968)) (select (arr!9024 a2!948) (_3!1502 lt!436968))))))

(declare-fun lt!437019 () Unit!21140)

(assert (=> d!100950 (= lt!437019 (choose!540 a1!948 a2!948 (_1!13200 lt!436971) (_3!1502 lt!436968) (_2!13200 lt!436971)))))

(assert (=> d!100950 (and (bvsle #b00000000000000000000000000000000 (_1!13200 lt!436971)) (bvsle (_1!13200 lt!436971) (_2!13200 lt!436971)))))

(assert (=> d!100950 (= (arrayRangesEqImpliesEq!255 a1!948 a2!948 (_1!13200 lt!436971) (_3!1502 lt!436968) (_2!13200 lt!436971)) lt!437019)))

(declare-fun bs!26038 () Bool)

(assert (= bs!26038 d!100950))

(assert (=> bs!26038 m!440681))

(assert (=> bs!26038 m!440683))

(declare-fun m!440825 () Bool)

(assert (=> bs!26038 m!440825))

(assert (=> b!301863 d!100950))

(declare-fun d!100952 () Bool)

(assert (=> d!100952 (= (arrayBitIndices!0 fromSlice!52 toSlice!52) (tuple4!1091 ((_ extract 31 0) (bvadd (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301866 d!100952))

(declare-fun d!100954 () Bool)

(assert (=> d!100954 (= (arrayBitIndices!0 fromBit!258 toBit!258) (tuple4!1091 ((_ extract 31 0) (bvadd (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv fromBit!258 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv toBit!258 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!301866 d!100954))

(declare-fun d!100956 () Bool)

(assert (=> d!100956 (= (byteRangesEq!0 (select (arr!9024 a1!948) (_3!1502 lt!436968)) (select (arr!9024 a2!948) (_3!1502 lt!436968)) ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (or (= ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000111) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9024 a1!948) (_3!1502 lt!436968))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!9024 a2!948) (_3!1502 lt!436968))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) #b00000000000000000000000000000111))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 ((_ extract 31 0) (bvsrem fromSlice!52 #b0000000000000000000000000000000000000000000000000000000000001000)))))) #b00000000000000000000000011111111))))))

(declare-fun bs!26039 () Bool)

(assert (= bs!26039 d!100956))

(assert (=> bs!26039 m!440793))

(declare-fun m!440827 () Bool)

(assert (=> bs!26039 m!440827))

(assert (=> b!301862 d!100956))

(push 1)

(assert (not d!100938))

(assert (not d!100950))

(assert (not bm!5489))

(assert (not b!301953))

(assert (not b!301933))

(assert (not d!100936))

(assert (not b!301951))

(assert (not b!301948))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

