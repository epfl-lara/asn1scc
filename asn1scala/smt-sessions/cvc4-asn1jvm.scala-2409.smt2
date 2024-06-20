; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!61294 () Bool)

(assert start!61294)

(declare-fun b!275921 () Bool)

(declare-fun e!195890 () Bool)

(declare-datatypes ((array!15776 0))(
  ( (array!15777 (arr!7824 (Array (_ BitVec 32) (_ BitVec 8))) (size!6834 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12482 0))(
  ( (BitStream!12483 (buf!7302 array!15776) (currentByte!13486 (_ BitVec 32)) (currentBit!13481 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!22498 0))(
  ( (tuple2!22499 (_1!12284 BitStream!12482) (_2!12284 Bool)) )
))
(declare-fun lt!413993 () tuple2!22498)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275921 (= e!195890 (invariant!0 (currentBit!13481 (_1!12284 lt!413993)) (currentByte!13486 (_1!12284 lt!413993)) (size!6834 (buf!7302 (_1!12284 lt!413993)))))))

(declare-fun bs1!11 () BitStream!12482)

(declare-fun lt!413994 () (_ BitVec 64))

(declare-fun bs2!19 () BitStream!12482)

(declare-fun bitAt!0 (array!15776 (_ BitVec 64)) Bool)

(assert (=> b!275921 (= (bitAt!0 (buf!7302 bs1!11) lt!413994) (bitAt!0 (buf!7302 bs2!19) lt!413994))))

(declare-datatypes ((Unit!19373 0))(
  ( (Unit!19374) )
))
(declare-fun lt!413996 () Unit!19373)

(declare-fun lt!413992 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!15776 array!15776 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19373)

(assert (=> b!275921 (= lt!413996 (arrayBitRangesEqImpliesEq!0 (buf!7302 bs1!11) (buf!7302 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413994 lt!413992))))

(declare-fun b!275922 () Bool)

(declare-fun e!195889 () Bool)

(declare-fun array_inv!6558 (array!15776) Bool)

(assert (=> b!275922 (= e!195889 (array_inv!6558 (buf!7302 bs1!11)))))

(declare-fun b!275923 () Bool)

(declare-fun res!229310 () Bool)

(declare-fun e!195887 () Bool)

(assert (=> b!275923 (=> (not res!229310) (not e!195887))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275923 (= res!229310 (validate_offset_bit!0 ((_ sign_extend 32) (size!6834 (buf!7302 bs1!11))) ((_ sign_extend 32) (currentByte!13486 bs1!11)) ((_ sign_extend 32) (currentBit!13481 bs1!11))))))

(declare-fun res!229311 () Bool)

(assert (=> start!61294 (=> (not res!229311) (not e!195887))))

(assert (=> start!61294 (= res!229311 (= (size!6834 (buf!7302 bs1!11)) (size!6834 (buf!7302 bs2!19))))))

(assert (=> start!61294 e!195887))

(declare-fun inv!12 (BitStream!12482) Bool)

(assert (=> start!61294 (and (inv!12 bs1!11) e!195889)))

(declare-fun e!195884 () Bool)

(assert (=> start!61294 (and (inv!12 bs2!19) e!195884)))

(declare-fun b!275924 () Bool)

(declare-fun e!195886 () Bool)

(assert (=> b!275924 (= e!195886 (not e!195890))))

(declare-fun res!229312 () Bool)

(assert (=> b!275924 (=> res!229312 e!195890)))

(assert (=> b!275924 (= res!229312 (or (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413992) (bvsgt lt!413992 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!6834 (buf!7302 bs1!11))))) (bvsgt #b0000000000000000000000000000000000000000000000000000000000000000 lt!413994) (bvsge lt!413994 lt!413992)))))

(declare-fun readBitPure!0 (BitStream!12482) tuple2!22498)

(assert (=> b!275924 (= lt!413993 (readBitPure!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))))

(declare-fun lt!413995 () tuple2!22498)

(assert (=> b!275924 (= lt!413995 (readBitPure!0 bs1!11))))

(assert (=> b!275924 (invariant!0 (currentBit!13481 bs1!11) (currentByte!13486 bs1!11) (size!6834 (buf!7302 bs2!19)))))

(declare-fun b!275925 () Bool)

(assert (=> b!275925 (= e!195884 (array_inv!6558 (buf!7302 bs2!19)))))

(declare-fun b!275926 () Bool)

(assert (=> b!275926 (= e!195887 e!195886)))

(declare-fun res!229313 () Bool)

(assert (=> b!275926 (=> (not res!229313) (not e!195886))))

(declare-fun arrayBitRangesEq!0 (array!15776 array!15776 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!275926 (= res!229313 (arrayBitRangesEq!0 (buf!7302 bs1!11) (buf!7302 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413992))))

(assert (=> b!275926 (= lt!413992 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!413994))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!275926 (= lt!413994 (bitIndex!0 (size!6834 (buf!7302 bs1!11)) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))

(assert (= (and start!61294 res!229311) b!275923))

(assert (= (and b!275923 res!229310) b!275926))

(assert (= (and b!275926 res!229313) b!275924))

(assert (= (and b!275924 (not res!229312)) b!275921))

(assert (= start!61294 b!275922))

(assert (= start!61294 b!275925))

(declare-fun m!408777 () Bool)

(assert (=> start!61294 m!408777))

(declare-fun m!408779 () Bool)

(assert (=> start!61294 m!408779))

(declare-fun m!408781 () Bool)

(assert (=> b!275926 m!408781))

(declare-fun m!408783 () Bool)

(assert (=> b!275926 m!408783))

(declare-fun m!408785 () Bool)

(assert (=> b!275924 m!408785))

(declare-fun m!408787 () Bool)

(assert (=> b!275924 m!408787))

(declare-fun m!408789 () Bool)

(assert (=> b!275924 m!408789))

(declare-fun m!408791 () Bool)

(assert (=> b!275923 m!408791))

(declare-fun m!408793 () Bool)

(assert (=> b!275921 m!408793))

(declare-fun m!408795 () Bool)

(assert (=> b!275921 m!408795))

(declare-fun m!408797 () Bool)

(assert (=> b!275921 m!408797))

(declare-fun m!408799 () Bool)

(assert (=> b!275921 m!408799))

(declare-fun m!408801 () Bool)

(assert (=> b!275925 m!408801))

(declare-fun m!408803 () Bool)

(assert (=> b!275922 m!408803))

(push 1)

(assert (not b!275925))

(assert (not start!61294))

(assert (not b!275922))

(assert (not b!275926))

(assert (not b!275924))

(assert (not b!275923))

(assert (not b!275921))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun b!275989 () Bool)

(declare-fun res!229363 () Bool)

(declare-fun lt!414047 () (_ BitVec 32))

(assert (=> b!275989 (= res!229363 (= lt!414047 #b00000000000000000000000000000000))))

(declare-fun e!195943 () Bool)

(assert (=> b!275989 (=> res!229363 e!195943)))

(declare-fun e!195942 () Bool)

(assert (=> b!275989 (= e!195942 e!195943)))

(declare-fun b!275990 () Bool)

(declare-fun e!195945 () Bool)

(assert (=> b!275990 (= e!195945 e!195942)))

(declare-fun res!229364 () Bool)

(declare-fun call!4427 () Bool)

(assert (=> b!275990 (= res!229364 call!4427)))

(assert (=> b!275990 (=> (not res!229364) (not e!195942))))

(declare-fun b!275991 () Bool)

(assert (=> b!275991 (= e!195945 call!4427)))

(declare-datatypes ((tuple4!514 0))(
  ( (tuple4!515 (_1!12288 (_ BitVec 32)) (_2!12288 (_ BitVec 32)) (_3!1037 (_ BitVec 32)) (_4!257 (_ BitVec 32))) )
))
(declare-fun lt!414048 () tuple4!514)

(declare-fun bm!4424 () Bool)

(declare-fun c!12612 () Bool)

(declare-fun lt!414046 () (_ BitVec 32))

(declare-fun byteRangesEq!0 ((_ BitVec 8) (_ BitVec 8) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> bm!4424 (= call!4427 (byteRangesEq!0 (select (arr!7824 (buf!7302 bs1!11)) (_3!1037 lt!414048)) (select (arr!7824 (buf!7302 bs2!19)) (_3!1037 lt!414048)) lt!414046 (ite c!12612 lt!414047 #b00000000000000000000000000001000)))))

(declare-fun d!94898 () Bool)

(declare-fun res!229360 () Bool)

(declare-fun e!195946 () Bool)

(assert (=> d!94898 (=> res!229360 e!195946)))

(assert (=> d!94898 (= res!229360 (bvsge #b0000000000000000000000000000000000000000000000000000000000000000 lt!413992))))

(assert (=> d!94898 (= (arrayBitRangesEq!0 (buf!7302 bs1!11) (buf!7302 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413992) e!195946)))

(declare-fun b!275992 () Bool)

(assert (=> b!275992 (= e!195943 (byteRangesEq!0 (select (arr!7824 (buf!7302 bs1!11)) (_4!257 lt!414048)) (select (arr!7824 (buf!7302 bs2!19)) (_4!257 lt!414048)) #b00000000000000000000000000000000 lt!414047))))

(declare-fun b!275993 () Bool)

(declare-fun e!195944 () Bool)

(assert (=> b!275993 (= e!195946 e!195944)))

(declare-fun res!229361 () Bool)

(assert (=> b!275993 (=> (not res!229361) (not e!195944))))

(declare-fun e!195947 () Bool)

(assert (=> b!275993 (= res!229361 e!195947)))

(declare-fun res!229362 () Bool)

(assert (=> b!275993 (=> res!229362 e!195947)))

(assert (=> b!275993 (= res!229362 (bvsge (_1!12288 lt!414048) (_2!12288 lt!414048)))))

(assert (=> b!275993 (= lt!414047 ((_ extract 31 0) (bvsrem lt!413992 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!275993 (= lt!414046 ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun arrayBitIndices!0 ((_ BitVec 64) (_ BitVec 64)) tuple4!514)

(assert (=> b!275993 (= lt!414048 (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!413992))))

(declare-fun b!275994 () Bool)

(assert (=> b!275994 (= e!195944 e!195945)))

(assert (=> b!275994 (= c!12612 (= (_3!1037 lt!414048) (_4!257 lt!414048)))))

(declare-fun b!275995 () Bool)

(declare-fun arrayRangesEq!1150 (array!15776 array!15776 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!275995 (= e!195947 (arrayRangesEq!1150 (buf!7302 bs1!11) (buf!7302 bs2!19) (_1!12288 lt!414048) (_2!12288 lt!414048)))))

(assert (= (and d!94898 (not res!229360)) b!275993))

(assert (= (and b!275993 (not res!229362)) b!275995))

(assert (= (and b!275993 res!229361) b!275994))

(assert (= (and b!275994 c!12612) b!275991))

(assert (= (and b!275994 (not c!12612)) b!275990))

(assert (= (and b!275990 res!229364) b!275989))

(assert (= (and b!275989 (not res!229363)) b!275992))

(assert (= (or b!275991 b!275990) bm!4424))

(declare-fun m!408855 () Bool)

(assert (=> bm!4424 m!408855))

(declare-fun m!408857 () Bool)

(assert (=> bm!4424 m!408857))

(assert (=> bm!4424 m!408855))

(assert (=> bm!4424 m!408857))

(declare-fun m!408859 () Bool)

(assert (=> bm!4424 m!408859))

(declare-fun m!408861 () Bool)

(assert (=> b!275992 m!408861))

(declare-fun m!408863 () Bool)

(assert (=> b!275992 m!408863))

(assert (=> b!275992 m!408861))

(assert (=> b!275992 m!408863))

(declare-fun m!408865 () Bool)

(assert (=> b!275992 m!408865))

(declare-fun m!408867 () Bool)

(assert (=> b!275993 m!408867))

(declare-fun m!408869 () Bool)

(assert (=> b!275995 m!408869))

(assert (=> b!275926 d!94898))

(declare-fun d!94904 () Bool)

(declare-fun e!195953 () Bool)

(assert (=> d!94904 e!195953))

(declare-fun res!229376 () Bool)

(assert (=> d!94904 (=> (not res!229376) (not e!195953))))

(declare-fun lt!414083 () (_ BitVec 64))

(declare-fun lt!414086 () (_ BitVec 64))

(declare-fun lt!414084 () (_ BitVec 64))

(assert (=> d!94904 (= res!229376 (= lt!414086 (bvsub lt!414083 lt!414084)))))

(assert (=> d!94904 (or (= (bvand lt!414083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414084 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414083 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414083 lt!414084) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!94904 (= lt!414084 (remainingBits!0 ((_ sign_extend 32) (size!6834 (buf!7302 bs1!11))) ((_ sign_extend 32) (currentByte!13486 bs1!11)) ((_ sign_extend 32) (currentBit!13481 bs1!11))))))

(declare-fun lt!414087 () (_ BitVec 64))

(declare-fun lt!414085 () (_ BitVec 64))

(assert (=> d!94904 (= lt!414083 (bvmul lt!414087 lt!414085))))

(assert (=> d!94904 (or (= lt!414087 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414085 (bvsdiv (bvmul lt!414087 lt!414085) lt!414087)))))

(assert (=> d!94904 (= lt!414085 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!94904 (= lt!414087 ((_ sign_extend 32) (size!6834 (buf!7302 bs1!11))))))

(assert (=> d!94904 (= lt!414086 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13486 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13481 bs1!11))))))

(assert (=> d!94904 (invariant!0 (currentBit!13481 bs1!11) (currentByte!13486 bs1!11) (size!6834 (buf!7302 bs1!11)))))

(assert (=> d!94904 (= (bitIndex!0 (size!6834 (buf!7302 bs1!11)) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)) lt!414086)))

(declare-fun b!276006 () Bool)

(declare-fun res!229375 () Bool)

(assert (=> b!276006 (=> (not res!229375) (not e!195953))))

(assert (=> b!276006 (= res!229375 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414086))))

(declare-fun b!276007 () Bool)

(declare-fun lt!414088 () (_ BitVec 64))

(assert (=> b!276007 (= e!195953 (bvsle lt!414086 (bvmul lt!414088 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276007 (or (= lt!414088 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414088 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414088)))))

(assert (=> b!276007 (= lt!414088 ((_ sign_extend 32) (size!6834 (buf!7302 bs1!11))))))

(assert (= (and d!94904 res!229376) b!276006))

(assert (= (and b!276006 res!229375) b!276007))

(declare-fun m!408879 () Bool)

(assert (=> d!94904 m!408879))

(declare-fun m!408881 () Bool)

(assert (=> d!94904 m!408881))

(assert (=> b!275926 d!94904))

(declare-fun d!94912 () Bool)

(assert (=> d!94912 (= (invariant!0 (currentBit!13481 (_1!12284 lt!413993)) (currentByte!13486 (_1!12284 lt!413993)) (size!6834 (buf!7302 (_1!12284 lt!413993)))) (and (bvsge (currentBit!13481 (_1!12284 lt!413993)) #b00000000000000000000000000000000) (bvslt (currentBit!13481 (_1!12284 lt!413993)) #b00000000000000000000000000001000) (bvsge (currentByte!13486 (_1!12284 lt!413993)) #b00000000000000000000000000000000) (or (bvslt (currentByte!13486 (_1!12284 lt!413993)) (size!6834 (buf!7302 (_1!12284 lt!413993)))) (and (= (currentBit!13481 (_1!12284 lt!413993)) #b00000000000000000000000000000000) (= (currentByte!13486 (_1!12284 lt!413993)) (size!6834 (buf!7302 (_1!12284 lt!413993))))))))))

(assert (=> b!275921 d!94912))

(declare-fun d!94916 () Bool)

(assert (=> d!94916 (= (bitAt!0 (buf!7302 bs1!11) lt!413994) (not (= (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 bs1!11)) ((_ extract 31 0) (bvsdiv lt!413994 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!413994 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!23933 () Bool)

(assert (= bs!23933 d!94916))

(declare-fun m!408885 () Bool)

(assert (=> bs!23933 m!408885))

(declare-fun m!408887 () Bool)

(assert (=> bs!23933 m!408887))

(assert (=> b!275921 d!94916))

(declare-fun d!94930 () Bool)

(assert (=> d!94930 (= (bitAt!0 (buf!7302 bs2!19) lt!413994) (not (= (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 bs2!19)) ((_ extract 31 0) (bvsdiv lt!413994 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!413994 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!23934 () Bool)

(assert (= bs!23934 d!94930))

(declare-fun m!408889 () Bool)

(assert (=> bs!23934 m!408889))

(assert (=> bs!23934 m!408887))

(assert (=> b!275921 d!94930))

(declare-fun d!94932 () Bool)

(assert (=> d!94932 (= (bitAt!0 (buf!7302 bs1!11) lt!413994) (bitAt!0 (buf!7302 bs2!19) lt!413994))))

(declare-fun lt!414091 () Unit!19373)

(declare-fun choose!31 (array!15776 array!15776 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!19373)

(assert (=> d!94932 (= lt!414091 (choose!31 (buf!7302 bs1!11) (buf!7302 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413994 lt!413992))))

(assert (=> d!94932 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!413992))))

(assert (=> d!94932 (= (arrayBitRangesEqImpliesEq!0 (buf!7302 bs1!11) (buf!7302 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413994 lt!413992) lt!414091)))

(declare-fun bs!23935 () Bool)

(assert (= bs!23935 d!94932))

(assert (=> bs!23935 m!408795))

(assert (=> bs!23935 m!408797))

(declare-fun m!408891 () Bool)

(assert (=> bs!23935 m!408891))

(assert (=> b!275921 d!94932))

(declare-fun d!94934 () Bool)

(assert (=> d!94934 (= (array_inv!6558 (buf!7302 bs2!19)) (bvsge (size!6834 (buf!7302 bs2!19)) #b00000000000000000000000000000000))))

(assert (=> b!275925 d!94934))

(declare-fun d!94936 () Bool)

(assert (=> d!94936 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6834 (buf!7302 bs1!11))) ((_ sign_extend 32) (currentByte!13486 bs1!11)) ((_ sign_extend 32) (currentBit!13481 bs1!11))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6834 (buf!7302 bs1!11))) ((_ sign_extend 32) (currentByte!13486 bs1!11)) ((_ sign_extend 32) (currentBit!13481 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23938 () Bool)

(assert (= bs!23938 d!94936))

(assert (=> bs!23938 m!408879))

(assert (=> b!275923 d!94936))

(declare-fun d!94942 () Bool)

(declare-datatypes ((tuple2!22504 0))(
  ( (tuple2!22505 (_1!12290 Bool) (_2!12290 BitStream!12482)) )
))
(declare-fun lt!414096 () tuple2!22504)

(declare-fun readBit!0 (BitStream!12482) tuple2!22504)

(assert (=> d!94942 (= lt!414096 (readBit!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))))

(assert (=> d!94942 (= (readBitPure!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))) (tuple2!22499 (_2!12290 lt!414096) (_1!12290 lt!414096)))))

(declare-fun bs!23939 () Bool)

(assert (= bs!23939 d!94942))

(declare-fun m!408899 () Bool)

(assert (=> bs!23939 m!408899))

(assert (=> b!275924 d!94942))

(declare-fun d!94944 () Bool)

(declare-fun lt!414098 () tuple2!22504)

(assert (=> d!94944 (= lt!414098 (readBit!0 bs1!11))))

(assert (=> d!94944 (= (readBitPure!0 bs1!11) (tuple2!22499 (_2!12290 lt!414098) (_1!12290 lt!414098)))))

(declare-fun bs!23940 () Bool)

(assert (= bs!23940 d!94944))

(declare-fun m!408901 () Bool)

(assert (=> bs!23940 m!408901))

(assert (=> b!275924 d!94944))

(declare-fun d!94946 () Bool)

(assert (=> d!94946 (= (invariant!0 (currentBit!13481 bs1!11) (currentByte!13486 bs1!11) (size!6834 (buf!7302 bs2!19))) (and (bvsge (currentBit!13481 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13481 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13486 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13486 bs1!11) (size!6834 (buf!7302 bs2!19))) (and (= (currentBit!13481 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13486 bs1!11) (size!6834 (buf!7302 bs2!19)))))))))

(assert (=> b!275924 d!94946))

(declare-fun d!94948 () Bool)

(assert (=> d!94948 (= (inv!12 bs1!11) (invariant!0 (currentBit!13481 bs1!11) (currentByte!13486 bs1!11) (size!6834 (buf!7302 bs1!11))))))

(declare-fun bs!23942 () Bool)

(assert (= bs!23942 d!94948))

(assert (=> bs!23942 m!408881))

(assert (=> start!61294 d!94948))

(declare-fun d!94950 () Bool)

(assert (=> d!94950 (= (inv!12 bs2!19) (invariant!0 (currentBit!13481 bs2!19) (currentByte!13486 bs2!19) (size!6834 (buf!7302 bs2!19))))))

(declare-fun bs!23943 () Bool)

(assert (= bs!23943 d!94950))

(declare-fun m!408905 () Bool)

(assert (=> bs!23943 m!408905))

(assert (=> start!61294 d!94950))

(declare-fun d!94952 () Bool)

(assert (=> d!94952 (= (array_inv!6558 (buf!7302 bs1!11)) (bvsge (size!6834 (buf!7302 bs1!11)) #b00000000000000000000000000000000))))

(assert (=> b!275922 d!94952))

(push 1)

(assert (not d!94932))

(assert (not d!94948))

(assert (not d!94904))

(assert (not b!275995))

(assert (not b!275993))

(assert (not d!94944))

(assert (not d!94950))

(assert (not b!275992))

(assert (not d!94936))

(assert (not bm!4424))

(assert (not d!94942))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!94974 () Bool)

(assert (=> d!94974 (= (remainingBits!0 ((_ sign_extend 32) (size!6834 (buf!7302 bs1!11))) ((_ sign_extend 32) (currentByte!13486 bs1!11)) ((_ sign_extend 32) (currentBit!13481 bs1!11))) (bvsub (bvmul ((_ sign_extend 32) (size!6834 (buf!7302 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!13486 bs1!11)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13481 bs1!11)))))))

(assert (=> d!94936 d!94974))

(declare-fun d!94976 () Bool)

(assert (=> d!94976 (= (byteRangesEq!0 (select (arr!7824 (buf!7302 bs1!11)) (_3!1037 lt!414048)) (select (arr!7824 (buf!7302 bs2!19)) (_3!1037 lt!414048)) lt!414046 (ite c!12612 lt!414047 #b00000000000000000000000000001000)) (or (= lt!414046 (ite c!12612 lt!414047 #b00000000000000000000000000001000)) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 bs1!11)) (_3!1037 lt!414048))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12612 lt!414047 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!414046)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 bs2!19)) (_3!1037 lt!414048))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) (ite c!12612 lt!414047 #b00000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 lt!414046)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23947 () Bool)

(assert (= bs!23947 d!94976))

(declare-fun m!408941 () Bool)

(assert (=> bs!23947 m!408941))

(declare-fun m!408943 () Bool)

(assert (=> bs!23947 m!408943))

(assert (=> bm!4424 d!94976))

(declare-fun d!94978 () Bool)

(assert (=> d!94978 (= (byteRangesEq!0 (select (arr!7824 (buf!7302 bs1!11)) (_4!257 lt!414048)) (select (arr!7824 (buf!7302 bs2!19)) (_4!257 lt!414048)) #b00000000000000000000000000000000 lt!414047) (or (= #b00000000000000000000000000000000 lt!414047) (= (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 bs1!11)) (_4!257 lt!414048))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!414047))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111) (bvand (bvand (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 bs2!19)) (_4!257 lt!414048))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b10000000) #b00000000000000000000000000000010 #b11000000) #b00000000000000000000000000000011 #b11100000) #b00000000000000000000000000000100 #b11110000) #b00000000000000000000000000000101 #b11111000) #b00000000000000000000000000000110 #b11111100) #b00000000000000000000000000000111 #b11111110) #b00000000000000000000000000001000 #b11111111) lt!414047))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000001 #b00000001) #b00000000000000000000000000000010 #b00000011) #b00000000000000000000000000000011 #b00000111) #b00000000000000000000000000000100 #b00001111) #b00000000000000000000000000000101 #b00011111) #b00000000000000000000000000000110 #b00111111) #b00000000000000000000000000000111 #b01111111) #b00000000000000000000000000001000 #b11111111) (bvsub #b00000000000000000000000000001000 #b00000000000000000000000000000000)))) #b00000000000000000000000011111111))))))

(declare-fun bs!23948 () Bool)

(assert (= bs!23948 d!94978))

(declare-fun m!408945 () Bool)

(assert (=> bs!23948 m!408945))

(declare-fun m!408947 () Bool)

(assert (=> bs!23948 m!408947))

(assert (=> b!275992 d!94978))

(assert (=> d!94904 d!94974))

(declare-fun d!94980 () Bool)

(assert (=> d!94980 (= (invariant!0 (currentBit!13481 bs1!11) (currentByte!13486 bs1!11) (size!6834 (buf!7302 bs1!11))) (and (bvsge (currentBit!13481 bs1!11) #b00000000000000000000000000000000) (bvslt (currentBit!13481 bs1!11) #b00000000000000000000000000001000) (bvsge (currentByte!13486 bs1!11) #b00000000000000000000000000000000) (or (bvslt (currentByte!13486 bs1!11) (size!6834 (buf!7302 bs1!11))) (and (= (currentBit!13481 bs1!11) #b00000000000000000000000000000000) (= (currentByte!13486 bs1!11) (size!6834 (buf!7302 bs1!11)))))))))

(assert (=> d!94904 d!94980))

(declare-fun d!94982 () Bool)

(assert (=> d!94982 (= (invariant!0 (currentBit!13481 bs2!19) (currentByte!13486 bs2!19) (size!6834 (buf!7302 bs2!19))) (and (bvsge (currentBit!13481 bs2!19) #b00000000000000000000000000000000) (bvslt (currentBit!13481 bs2!19) #b00000000000000000000000000001000) (bvsge (currentByte!13486 bs2!19) #b00000000000000000000000000000000) (or (bvslt (currentByte!13486 bs2!19) (size!6834 (buf!7302 bs2!19))) (and (= (currentBit!13481 bs2!19) #b00000000000000000000000000000000) (= (currentByte!13486 bs2!19) (size!6834 (buf!7302 bs2!19)))))))))

(assert (=> d!94950 d!94982))

(declare-fun d!94984 () Bool)

(declare-fun e!195974 () Bool)

(assert (=> d!94984 e!195974))

(declare-fun res!229389 () Bool)

(assert (=> d!94984 (=> (not res!229389) (not e!195974))))

(declare-datatypes ((tuple2!22508 0))(
  ( (tuple2!22509 (_1!12292 Unit!19373) (_2!12292 BitStream!12482)) )
))
(declare-fun increaseBitIndex!0 (BitStream!12482) tuple2!22508)

(assert (=> d!94984 (= res!229389 (= (buf!7302 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))))

(declare-fun lt!414143 () Bool)

(assert (=> d!94984 (= lt!414143 (not (= (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!414146 () tuple2!22504)

(assert (=> d!94984 (= lt!414146 (tuple2!22505 (not (= (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))) #b00000000000000000000000000000000)) (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))))))

(assert (=> d!94984 (validate_offset_bit!0 ((_ sign_extend 32) (size!6834 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) ((_ sign_extend 32) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) ((_ sign_extend 32) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))))

(assert (=> d!94984 (= (readBit!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))) lt!414146)))

(declare-fun lt!414142 () (_ BitVec 64))

(declare-fun b!276020 () Bool)

(declare-fun lt!414141 () (_ BitVec 64))

(assert (=> b!276020 (= e!195974 (= (bitIndex!0 (size!6834 (buf!7302 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))) (currentByte!13486 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) (currentBit!13481 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))) (bvadd lt!414141 lt!414142)))))

(assert (=> b!276020 (or (not (= (bvand lt!414141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414142 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!414141 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!414141 lt!414142) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276020 (= lt!414142 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!276020 (= lt!414141 (bitIndex!0 (size!6834 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))))

(declare-fun lt!414144 () Bool)

(assert (=> b!276020 (= lt!414144 (not (= (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!414147 () Bool)

(assert (=> b!276020 (= lt!414147 (not (= (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))) #b00000000000000000000000000000000)))))

(declare-fun lt!414145 () Bool)

(assert (=> b!276020 (= lt!414145 (not (= (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))) #b00000000000000000000000000000000)))))

(assert (= (and d!94984 res!229389) b!276020))

(declare-fun m!408949 () Bool)

(assert (=> d!94984 m!408949))

(declare-fun m!408951 () Bool)

(assert (=> d!94984 m!408951))

(declare-fun m!408953 () Bool)

(assert (=> d!94984 m!408953))

(declare-fun m!408955 () Bool)

(assert (=> d!94984 m!408955))

(declare-fun m!408957 () Bool)

(assert (=> b!276020 m!408957))

(assert (=> b!276020 m!408951))

(assert (=> b!276020 m!408953))

(assert (=> b!276020 m!408949))

(declare-fun m!408959 () Bool)

(assert (=> b!276020 m!408959))

(assert (=> d!94942 d!94984))

(assert (=> d!94948 d!94980))

(declare-fun d!94986 () Bool)

(assert (=> d!94986 (= (arrayBitIndices!0 #b0000000000000000000000000000000000000000000000000000000000000000 lt!413992) (tuple4!515 ((_ extract 31 0) (bvadd (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (ite (= (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000000) #b00000000000000000000000000000000 #b00000000000000000000000000000001)))) ((_ extract 31 0) (bvsdiv lt!413992 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)) ((_ extract 31 0) (bvsdiv lt!413992 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> b!275993 d!94986))

(declare-fun d!94988 () Bool)

(declare-fun e!195975 () Bool)

(assert (=> d!94988 e!195975))

(declare-fun res!229390 () Bool)

(assert (=> d!94988 (=> (not res!229390) (not e!195975))))

(assert (=> d!94988 (= res!229390 (= (buf!7302 (_2!12292 (increaseBitIndex!0 bs1!11))) (buf!7302 bs1!11)))))

(declare-fun lt!414150 () Bool)

(assert (=> d!94988 (= lt!414150 (not (= (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 bs1!11)) (currentByte!13486 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13481 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!414153 () tuple2!22504)

(assert (=> d!94988 (= lt!414153 (tuple2!22505 (not (= (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 bs1!11)) (currentByte!13486 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13481 bs1!11)))) #b00000000000000000000000000000000)) (_2!12292 (increaseBitIndex!0 bs1!11))))))

(assert (=> d!94988 (validate_offset_bit!0 ((_ sign_extend 32) (size!6834 (buf!7302 bs1!11))) ((_ sign_extend 32) (currentByte!13486 bs1!11)) ((_ sign_extend 32) (currentBit!13481 bs1!11)))))

(assert (=> d!94988 (= (readBit!0 bs1!11) lt!414153)))

(declare-fun b!276021 () Bool)

(declare-fun lt!414148 () (_ BitVec 64))

(declare-fun lt!414149 () (_ BitVec 64))

(assert (=> b!276021 (= e!195975 (= (bitIndex!0 (size!6834 (buf!7302 (_2!12292 (increaseBitIndex!0 bs1!11)))) (currentByte!13486 (_2!12292 (increaseBitIndex!0 bs1!11))) (currentBit!13481 (_2!12292 (increaseBitIndex!0 bs1!11)))) (bvadd lt!414148 lt!414149)))))

(assert (=> b!276021 (or (not (= (bvand lt!414148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414149 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!414148 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!414148 lt!414149) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276021 (= lt!414149 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!276021 (= lt!414148 (bitIndex!0 (size!6834 (buf!7302 bs1!11)) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))

(declare-fun lt!414151 () Bool)

(assert (=> b!276021 (= lt!414151 (not (= (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 bs1!11)) (currentByte!13486 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13481 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!414154 () Bool)

(assert (=> b!276021 (= lt!414154 (not (= (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 bs1!11)) (currentByte!13486 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13481 bs1!11)))) #b00000000000000000000000000000000)))))

(declare-fun lt!414152 () Bool)

(assert (=> b!276021 (= lt!414152 (not (= (bvand ((_ sign_extend 24) (select (arr!7824 (buf!7302 bs1!11)) (currentByte!13486 bs1!11))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) (currentBit!13481 bs1!11)))) #b00000000000000000000000000000000)))))

(assert (= (and d!94988 res!229390) b!276021))

(declare-fun m!408961 () Bool)

(assert (=> d!94988 m!408961))

(declare-fun m!408963 () Bool)

(assert (=> d!94988 m!408963))

(declare-fun m!408965 () Bool)

(assert (=> d!94988 m!408965))

(assert (=> d!94988 m!408791))

(declare-fun m!408967 () Bool)

(assert (=> b!276021 m!408967))

(assert (=> b!276021 m!408963))

(assert (=> b!276021 m!408965))

(assert (=> b!276021 m!408961))

(assert (=> b!276021 m!408783))

(assert (=> d!94944 d!94988))

(assert (=> d!94932 d!94916))

(assert (=> d!94932 d!94930))

(declare-fun d!94990 () Bool)

(assert (=> d!94990 (= (bitAt!0 (buf!7302 bs1!11) lt!413994) (bitAt!0 (buf!7302 bs2!19) lt!413994))))

(assert (=> d!94990 true))

(declare-fun _$31!41 () Unit!19373)

(assert (=> d!94990 (= (choose!31 (buf!7302 bs1!11) (buf!7302 bs2!19) #b0000000000000000000000000000000000000000000000000000000000000000 lt!413994 lt!413992) _$31!41)))

(declare-fun bs!23949 () Bool)

(assert (= bs!23949 d!94990))

(assert (=> bs!23949 m!408795))

(assert (=> bs!23949 m!408797))

(assert (=> d!94932 d!94990))

(declare-fun d!94992 () Bool)

(declare-fun res!229395 () Bool)

(declare-fun e!195980 () Bool)

(assert (=> d!94992 (=> res!229395 e!195980)))

(assert (=> d!94992 (= res!229395 (= (_1!12288 lt!414048) (_2!12288 lt!414048)))))

(assert (=> d!94992 (= (arrayRangesEq!1150 (buf!7302 bs1!11) (buf!7302 bs2!19) (_1!12288 lt!414048) (_2!12288 lt!414048)) e!195980)))

(declare-fun b!276026 () Bool)

(declare-fun e!195981 () Bool)

(assert (=> b!276026 (= e!195980 e!195981)))

(declare-fun res!229396 () Bool)

(assert (=> b!276026 (=> (not res!229396) (not e!195981))))

(assert (=> b!276026 (= res!229396 (= (select (arr!7824 (buf!7302 bs1!11)) (_1!12288 lt!414048)) (select (arr!7824 (buf!7302 bs2!19)) (_1!12288 lt!414048))))))

(declare-fun b!276027 () Bool)

(assert (=> b!276027 (= e!195981 (arrayRangesEq!1150 (buf!7302 bs1!11) (buf!7302 bs2!19) (bvadd (_1!12288 lt!414048) #b00000000000000000000000000000001) (_2!12288 lt!414048)))))

(assert (= (and d!94992 (not res!229395)) b!276026))

(assert (= (and b!276026 res!229396) b!276027))

(declare-fun m!408969 () Bool)

(assert (=> b!276026 m!408969))

(declare-fun m!408971 () Bool)

(assert (=> b!276026 m!408971))

(declare-fun m!408973 () Bool)

(assert (=> b!276027 m!408973))

(assert (=> b!275995 d!94992))

(push 1)

(assert (not d!94988))

(assert (not b!276027))

(assert (not b!276021))

(assert (not d!94984))

(assert (not b!276020))

(assert (not d!94990))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(assert (=> d!94990 d!94916))

(assert (=> d!94990 d!94930))

(declare-fun d!95008 () Bool)

(declare-fun res!229413 () Bool)

(declare-fun e!195991 () Bool)

(assert (=> d!95008 (=> res!229413 e!195991)))

(assert (=> d!95008 (= res!229413 (= (bvadd (_1!12288 lt!414048) #b00000000000000000000000000000001) (_2!12288 lt!414048)))))

(assert (=> d!95008 (= (arrayRangesEq!1150 (buf!7302 bs1!11) (buf!7302 bs2!19) (bvadd (_1!12288 lt!414048) #b00000000000000000000000000000001) (_2!12288 lt!414048)) e!195991)))

(declare-fun b!276044 () Bool)

(declare-fun e!195992 () Bool)

(assert (=> b!276044 (= e!195991 e!195992)))

(declare-fun res!229414 () Bool)

(assert (=> b!276044 (=> (not res!229414) (not e!195992))))

(assert (=> b!276044 (= res!229414 (= (select (arr!7824 (buf!7302 bs1!11)) (bvadd (_1!12288 lt!414048) #b00000000000000000000000000000001)) (select (arr!7824 (buf!7302 bs2!19)) (bvadd (_1!12288 lt!414048) #b00000000000000000000000000000001))))))

(declare-fun b!276045 () Bool)

(assert (=> b!276045 (= e!195992 (arrayRangesEq!1150 (buf!7302 bs1!11) (buf!7302 bs2!19) (bvadd (_1!12288 lt!414048) #b00000000000000000000000000000001 #b00000000000000000000000000000001) (_2!12288 lt!414048)))))

(assert (= (and d!95008 (not res!229413)) b!276044))

(assert (= (and b!276044 res!229414) b!276045))

(declare-fun m!409001 () Bool)

(assert (=> b!276044 m!409001))

(declare-fun m!409003 () Bool)

(assert (=> b!276044 m!409003))

(declare-fun m!409005 () Bool)

(assert (=> b!276045 m!409005))

(assert (=> b!276027 d!95008))

(declare-fun d!95010 () Bool)

(declare-fun e!195995 () Bool)

(assert (=> d!95010 e!195995))

(declare-fun res!229419 () Bool)

(assert (=> d!95010 (=> (not res!229419) (not e!195995))))

(declare-fun lt!414205 () (_ BitVec 64))

(declare-fun lt!414206 () (_ BitVec 64))

(declare-fun lt!414203 () tuple2!22508)

(assert (=> d!95010 (= res!229419 (= (bvadd lt!414206 lt!414205) (bitIndex!0 (size!6834 (buf!7302 (_2!12292 lt!414203))) (currentByte!13486 (_2!12292 lt!414203)) (currentBit!13481 (_2!12292 lt!414203)))))))

(assert (=> d!95010 (or (not (= (bvand lt!414206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414205 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!414206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!414206 lt!414205) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95010 (= lt!414205 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!95010 (= lt!414206 (bitIndex!0 (size!6834 (buf!7302 bs1!11)) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))

(declare-fun Unit!19379 () Unit!19373)

(declare-fun Unit!19380 () Unit!19373)

(assert (=> d!95010 (= lt!414203 (ite (bvslt (currentBit!13481 bs1!11) #b00000000000000000000000000000111) (tuple2!22509 Unit!19379 (BitStream!12483 (buf!7302 bs1!11) (currentByte!13486 bs1!11) (bvadd (currentBit!13481 bs1!11) #b00000000000000000000000000000001))) (tuple2!22509 Unit!19380 (BitStream!12483 (buf!7302 bs1!11) (bvadd (currentByte!13486 bs1!11) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!95010 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6834 (buf!7302 bs1!11))) ((_ sign_extend 32) (currentByte!13486 bs1!11)) ((_ sign_extend 32) (currentBit!13481 bs1!11))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!95010 (= (increaseBitIndex!0 bs1!11) lt!414203)))

(declare-fun b!276050 () Bool)

(declare-fun res!229420 () Bool)

(assert (=> b!276050 (=> (not res!229420) (not e!195995))))

(declare-fun lt!414204 () (_ BitVec 64))

(declare-fun lt!414207 () (_ BitVec 64))

(assert (=> b!276050 (= res!229420 (= (bvsub lt!414204 lt!414207) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!276050 (or (= (bvand lt!414204 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414207 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414204 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414204 lt!414207) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276050 (= lt!414207 (remainingBits!0 ((_ sign_extend 32) (size!6834 (buf!7302 (_2!12292 lt!414203)))) ((_ sign_extend 32) (currentByte!13486 (_2!12292 lt!414203))) ((_ sign_extend 32) (currentBit!13481 (_2!12292 lt!414203)))))))

(assert (=> b!276050 (= lt!414204 (remainingBits!0 ((_ sign_extend 32) (size!6834 (buf!7302 bs1!11))) ((_ sign_extend 32) (currentByte!13486 bs1!11)) ((_ sign_extend 32) (currentBit!13481 bs1!11))))))

(declare-fun b!276051 () Bool)

(assert (=> b!276051 (= e!195995 (= (size!6834 (buf!7302 bs1!11)) (size!6834 (buf!7302 (_2!12292 lt!414203)))))))

(assert (= (and d!95010 res!229419) b!276050))

(assert (= (and b!276050 res!229420) b!276051))

(declare-fun m!409007 () Bool)

(assert (=> d!95010 m!409007))

(assert (=> d!95010 m!408783))

(assert (=> d!95010 m!408879))

(declare-fun m!409009 () Bool)

(assert (=> b!276050 m!409009))

(assert (=> b!276050 m!408879))

(assert (=> d!94988 d!95010))

(assert (=> d!94988 d!94936))

(declare-fun d!95012 () Bool)

(declare-fun e!195996 () Bool)

(assert (=> d!95012 e!195996))

(declare-fun res!229422 () Bool)

(assert (=> d!95012 (=> (not res!229422) (not e!195996))))

(declare-fun lt!414211 () (_ BitVec 64))

(declare-fun lt!414208 () (_ BitVec 64))

(declare-fun lt!414209 () (_ BitVec 64))

(assert (=> d!95012 (= res!229422 (= lt!414211 (bvsub lt!414208 lt!414209)))))

(assert (=> d!95012 (or (= (bvand lt!414208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414209 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414208 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414208 lt!414209) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95012 (= lt!414209 (remainingBits!0 ((_ sign_extend 32) (size!6834 (buf!7302 (_2!12292 (increaseBitIndex!0 bs1!11))))) ((_ sign_extend 32) (currentByte!13486 (_2!12292 (increaseBitIndex!0 bs1!11)))) ((_ sign_extend 32) (currentBit!13481 (_2!12292 (increaseBitIndex!0 bs1!11))))))))

(declare-fun lt!414212 () (_ BitVec 64))

(declare-fun lt!414210 () (_ BitVec 64))

(assert (=> d!95012 (= lt!414208 (bvmul lt!414212 lt!414210))))

(assert (=> d!95012 (or (= lt!414212 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414210 (bvsdiv (bvmul lt!414212 lt!414210) lt!414212)))))

(assert (=> d!95012 (= lt!414210 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95012 (= lt!414212 ((_ sign_extend 32) (size!6834 (buf!7302 (_2!12292 (increaseBitIndex!0 bs1!11))))))))

(assert (=> d!95012 (= lt!414211 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13486 (_2!12292 (increaseBitIndex!0 bs1!11)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13481 (_2!12292 (increaseBitIndex!0 bs1!11))))))))

(assert (=> d!95012 (invariant!0 (currentBit!13481 (_2!12292 (increaseBitIndex!0 bs1!11))) (currentByte!13486 (_2!12292 (increaseBitIndex!0 bs1!11))) (size!6834 (buf!7302 (_2!12292 (increaseBitIndex!0 bs1!11)))))))

(assert (=> d!95012 (= (bitIndex!0 (size!6834 (buf!7302 (_2!12292 (increaseBitIndex!0 bs1!11)))) (currentByte!13486 (_2!12292 (increaseBitIndex!0 bs1!11))) (currentBit!13481 (_2!12292 (increaseBitIndex!0 bs1!11)))) lt!414211)))

(declare-fun b!276052 () Bool)

(declare-fun res!229421 () Bool)

(assert (=> b!276052 (=> (not res!229421) (not e!195996))))

(assert (=> b!276052 (= res!229421 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414211))))

(declare-fun b!276053 () Bool)

(declare-fun lt!414213 () (_ BitVec 64))

(assert (=> b!276053 (= e!195996 (bvsle lt!414211 (bvmul lt!414213 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276053 (or (= lt!414213 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414213 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414213)))))

(assert (=> b!276053 (= lt!414213 ((_ sign_extend 32) (size!6834 (buf!7302 (_2!12292 (increaseBitIndex!0 bs1!11))))))))

(assert (= (and d!95012 res!229422) b!276052))

(assert (= (and b!276052 res!229421) b!276053))

(declare-fun m!409011 () Bool)

(assert (=> d!95012 m!409011))

(declare-fun m!409013 () Bool)

(assert (=> d!95012 m!409013))

(assert (=> b!276021 d!95012))

(assert (=> b!276021 d!95010))

(assert (=> b!276021 d!94904))

(declare-fun d!95014 () Bool)

(declare-fun e!195997 () Bool)

(assert (=> d!95014 e!195997))

(declare-fun res!229424 () Bool)

(assert (=> d!95014 (=> (not res!229424) (not e!195997))))

(declare-fun lt!414214 () (_ BitVec 64))

(declare-fun lt!414215 () (_ BitVec 64))

(declare-fun lt!414217 () (_ BitVec 64))

(assert (=> d!95014 (= res!229424 (= lt!414217 (bvsub lt!414214 lt!414215)))))

(assert (=> d!95014 (or (= (bvand lt!414214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414215 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414214 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414214 lt!414215) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95014 (= lt!414215 (remainingBits!0 ((_ sign_extend 32) (size!6834 (buf!7302 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))))) ((_ sign_extend 32) (currentByte!13486 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))) ((_ sign_extend 32) (currentBit!13481 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))))))))

(declare-fun lt!414218 () (_ BitVec 64))

(declare-fun lt!414216 () (_ BitVec 64))

(assert (=> d!95014 (= lt!414214 (bvmul lt!414218 lt!414216))))

(assert (=> d!95014 (or (= lt!414218 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414216 (bvsdiv (bvmul lt!414218 lt!414216) lt!414218)))))

(assert (=> d!95014 (= lt!414216 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95014 (= lt!414218 ((_ sign_extend 32) (size!6834 (buf!7302 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))))))))

(assert (=> d!95014 (= lt!414217 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13486 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13481 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))))))))

(assert (=> d!95014 (invariant!0 (currentBit!13481 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) (currentByte!13486 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) (size!6834 (buf!7302 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))))))

(assert (=> d!95014 (= (bitIndex!0 (size!6834 (buf!7302 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))) (currentByte!13486 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) (currentBit!13481 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))) lt!414217)))

(declare-fun b!276054 () Bool)

(declare-fun res!229423 () Bool)

(assert (=> b!276054 (=> (not res!229423) (not e!195997))))

(assert (=> b!276054 (= res!229423 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414217))))

(declare-fun b!276055 () Bool)

(declare-fun lt!414219 () (_ BitVec 64))

(assert (=> b!276055 (= e!195997 (bvsle lt!414217 (bvmul lt!414219 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276055 (or (= lt!414219 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414219 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414219)))))

(assert (=> b!276055 (= lt!414219 ((_ sign_extend 32) (size!6834 (buf!7302 (_2!12292 (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))))))))

(assert (= (and d!95014 res!229424) b!276054))

(assert (= (and b!276054 res!229423) b!276055))

(declare-fun m!409015 () Bool)

(assert (=> d!95014 m!409015))

(declare-fun m!409017 () Bool)

(assert (=> d!95014 m!409017))

(assert (=> b!276020 d!95014))

(declare-fun d!95016 () Bool)

(declare-fun e!195998 () Bool)

(assert (=> d!95016 e!195998))

(declare-fun res!229425 () Bool)

(assert (=> d!95016 (=> (not res!229425) (not e!195998))))

(declare-fun lt!414222 () (_ BitVec 64))

(declare-fun lt!414220 () tuple2!22508)

(declare-fun lt!414223 () (_ BitVec 64))

(assert (=> d!95016 (= res!229425 (= (bvadd lt!414223 lt!414222) (bitIndex!0 (size!6834 (buf!7302 (_2!12292 lt!414220))) (currentByte!13486 (_2!12292 lt!414220)) (currentBit!13481 (_2!12292 lt!414220)))))))

(assert (=> d!95016 (or (not (= (bvand lt!414223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414222 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!414223 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!414223 lt!414222) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95016 (= lt!414222 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!95016 (= lt!414223 (bitIndex!0 (size!6834 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))))

(declare-fun Unit!19381 () Unit!19373)

(declare-fun Unit!19382 () Unit!19373)

(assert (=> d!95016 (= lt!414220 (ite (bvslt (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))) #b00000000000000000000000000000111) (tuple2!22509 Unit!19381 (BitStream!12483 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))) (bvadd (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))) #b00000000000000000000000000000001))) (tuple2!22509 Unit!19382 (BitStream!12483 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))) (bvadd (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))) #b00000000000000000000000000000001) #b00000000000000000000000000000000))))))

(assert (=> d!95016 (bvsgt (remainingBits!0 ((_ sign_extend 32) (size!6834 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) ((_ sign_extend 32) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) ((_ sign_extend 32) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!95016 (= (increaseBitIndex!0 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))) lt!414220)))

(declare-fun b!276056 () Bool)

(declare-fun res!229426 () Bool)

(assert (=> b!276056 (=> (not res!229426) (not e!195998))))

(declare-fun lt!414221 () (_ BitVec 64))

(declare-fun lt!414224 () (_ BitVec 64))

(assert (=> b!276056 (= res!229426 (= (bvsub lt!414221 lt!414224) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!276056 (or (= (bvand lt!414221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414224 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414221 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414221 lt!414224) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!276056 (= lt!414224 (remainingBits!0 ((_ sign_extend 32) (size!6834 (buf!7302 (_2!12292 lt!414220)))) ((_ sign_extend 32) (currentByte!13486 (_2!12292 lt!414220))) ((_ sign_extend 32) (currentBit!13481 (_2!12292 lt!414220)))))))

(assert (=> b!276056 (= lt!414221 (remainingBits!0 ((_ sign_extend 32) (size!6834 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) ((_ sign_extend 32) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) ((_ sign_extend 32) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))))))

(declare-fun b!276057 () Bool)

(assert (=> b!276057 (= e!195998 (= (size!6834 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) (size!6834 (buf!7302 (_2!12292 lt!414220)))))))

(assert (= (and d!95016 res!229425) b!276056))

(assert (= (and b!276056 res!229426) b!276057))

(declare-fun m!409019 () Bool)

(assert (=> d!95016 m!409019))

(assert (=> d!95016 m!408959))

(declare-fun m!409021 () Bool)

(assert (=> d!95016 m!409021))

(declare-fun m!409023 () Bool)

(assert (=> b!276056 m!409023))

(assert (=> b!276056 m!409021))

(assert (=> b!276020 d!95016))

(declare-fun d!95018 () Bool)

(declare-fun e!195999 () Bool)

(assert (=> d!95018 e!195999))

(declare-fun res!229428 () Bool)

(assert (=> d!95018 (=> (not res!229428) (not e!195999))))

(declare-fun lt!414228 () (_ BitVec 64))

(declare-fun lt!414225 () (_ BitVec 64))

(declare-fun lt!414226 () (_ BitVec 64))

(assert (=> d!95018 (= res!229428 (= lt!414228 (bvsub lt!414225 lt!414226)))))

(assert (=> d!95018 (or (= (bvand lt!414225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!414226 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!414225 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!414225 lt!414226) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!95018 (= lt!414226 (remainingBits!0 ((_ sign_extend 32) (size!6834 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) ((_ sign_extend 32) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) ((_ sign_extend 32) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))))))

(declare-fun lt!414229 () (_ BitVec 64))

(declare-fun lt!414227 () (_ BitVec 64))

(assert (=> d!95018 (= lt!414225 (bvmul lt!414229 lt!414227))))

(assert (=> d!95018 (or (= lt!414229 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!414227 (bvsdiv (bvmul lt!414229 lt!414227) lt!414229)))))

(assert (=> d!95018 (= lt!414227 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!95018 (= lt!414229 ((_ sign_extend 32) (size!6834 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))))))

(assert (=> d!95018 (= lt!414228 (bvadd (bvmul ((_ sign_extend 32) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))))))

(assert (=> d!95018 (invariant!0 (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))) (size!6834 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))))))

(assert (=> d!95018 (= (bitIndex!0 (size!6834 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) lt!414228)))

(declare-fun b!276058 () Bool)

(declare-fun res!229427 () Bool)

(assert (=> b!276058 (=> (not res!229427) (not e!195999))))

(assert (=> b!276058 (= res!229427 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!414228))))

(declare-fun b!276059 () Bool)

(declare-fun lt!414230 () (_ BitVec 64))

(assert (=> b!276059 (= e!195999 (bvsle lt!414228 (bvmul lt!414230 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!276059 (or (= lt!414230 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!414230 #b0000000000000000000000000000000000000000000000000000000000001000) lt!414230)))))

(assert (=> b!276059 (= lt!414230 ((_ sign_extend 32) (size!6834 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))))))

(assert (= (and d!95018 res!229428) b!276058))

(assert (= (and b!276058 res!229427) b!276059))

(assert (=> d!95018 m!409021))

(declare-fun m!409025 () Bool)

(assert (=> d!95018 m!409025))

(assert (=> b!276020 d!95018))

(assert (=> d!94984 d!95016))

(declare-fun d!95020 () Bool)

(assert (=> d!95020 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!6834 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) ((_ sign_extend 32) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) ((_ sign_extend 32) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!6834 (buf!7302 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) ((_ sign_extend 32) (currentByte!13486 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11)))) ((_ sign_extend 32) (currentBit!13481 (BitStream!12483 (buf!7302 bs2!19) (currentByte!13486 bs1!11) (currentBit!13481 bs1!11))))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!23951 () Bool)

(assert (= bs!23951 d!95020))

(assert (=> bs!23951 m!409021))

(assert (=> d!94984 d!95020))

(push 1)

(assert (not d!95014))

(assert (not d!95010))

(assert (not d!95016))

(assert (not b!276056))

(assert (not b!276045))

(assert (not b!276050))

(assert (not d!95012))

(assert (not d!95020))

(assert (not d!95018))

(check-sat)

(pop 1)

(push 1)

(check-sat)

