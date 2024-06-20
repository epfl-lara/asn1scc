; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23564 () Bool)

(assert start!23564)

(declare-fun b!119476 () Bool)

(declare-fun e!78289 () Bool)

(declare-fun e!78283 () Bool)

(assert (=> b!119476 (= e!78289 e!78283)))

(declare-fun res!98894 () Bool)

(assert (=> b!119476 (=> (not res!98894) (not e!78283))))

(declare-fun lt!184912 () (_ BitVec 64))

(declare-fun lt!184901 () (_ BitVec 64))

(assert (=> b!119476 (= res!98894 (= lt!184912 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!184901)))))

(declare-datatypes ((array!5339 0))(
  ( (array!5340 (arr!3012 (Array (_ BitVec 32) (_ BitVec 8))) (size!2419 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4312 0))(
  ( (BitStream!4313 (buf!2844 array!5339) (currentByte!5511 (_ BitVec 32)) (currentBit!5506 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7357 0))(
  ( (Unit!7358) )
))
(declare-datatypes ((tuple2!10012 0))(
  ( (tuple2!10013 (_1!5271 Unit!7357) (_2!5271 BitStream!4312)) )
))
(declare-fun lt!184887 () tuple2!10012)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119476 (= lt!184912 (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184887))) (currentByte!5511 (_2!5271 lt!184887)) (currentBit!5506 (_2!5271 lt!184887))))))

(declare-fun thiss!1305 () BitStream!4312)

(assert (=> b!119476 (= lt!184901 (bitIndex!0 (size!2419 (buf!2844 thiss!1305)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305)))))

(declare-fun b!119477 () Bool)

(declare-fun res!98899 () Bool)

(declare-fun e!78287 () Bool)

(assert (=> b!119477 (=> (not res!98899) (not e!78287))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!119477 (= res!98899 (bvslt i!615 nBits!396))))

(declare-fun b!119478 () Bool)

(declare-fun e!78285 () Bool)

(declare-datatypes ((tuple2!10014 0))(
  ( (tuple2!10015 (_1!5272 BitStream!4312) (_2!5272 Bool)) )
))
(declare-fun lt!184910 () tuple2!10014)

(declare-fun lt!184899 () tuple2!10014)

(assert (=> b!119478 (= e!78285 (= (_2!5272 lt!184910) (_2!5272 lt!184899)))))

(declare-fun b!119479 () Bool)

(declare-fun res!98902 () Bool)

(declare-fun e!78288 () Bool)

(assert (=> b!119479 (=> (not res!98902) (not e!78288))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!119479 (= res!98902 (invariant!0 (currentBit!5506 thiss!1305) (currentByte!5511 thiss!1305) (size!2419 (buf!2844 (_2!5271 lt!184887)))))))

(declare-fun b!119480 () Bool)

(declare-fun lt!184894 () tuple2!10012)

(assert (=> b!119480 (= e!78288 (invariant!0 (currentBit!5506 thiss!1305) (currentByte!5511 thiss!1305) (size!2419 (buf!2844 (_2!5271 lt!184894)))))))

(declare-fun b!119481 () Bool)

(declare-fun e!78291 () Bool)

(assert (=> b!119481 (= e!78291 e!78287)))

(declare-fun res!98900 () Bool)

(assert (=> b!119481 (=> (not res!98900) (not e!78287))))

(declare-fun lt!184911 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!119481 (= res!98900 (validate_offset_bits!1 ((_ sign_extend 32) (size!2419 (buf!2844 thiss!1305))) ((_ sign_extend 32) (currentByte!5511 thiss!1305)) ((_ sign_extend 32) (currentBit!5506 thiss!1305)) lt!184911))))

(assert (=> b!119481 (= lt!184911 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun res!98895 () Bool)

(assert (=> start!23564 (=> (not res!98895) (not e!78291))))

(assert (=> start!23564 (= res!98895 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23564 e!78291))

(assert (=> start!23564 true))

(declare-fun e!78286 () Bool)

(declare-fun inv!12 (BitStream!4312) Bool)

(assert (=> start!23564 (and (inv!12 thiss!1305) e!78286)))

(declare-fun b!119482 () Bool)

(declare-fun e!78290 () Bool)

(assert (=> b!119482 (= e!78283 e!78290)))

(declare-fun res!98897 () Bool)

(assert (=> b!119482 (=> (not res!98897) (not e!78290))))

(declare-fun lt!184903 () Bool)

(declare-fun lt!184905 () tuple2!10014)

(assert (=> b!119482 (= res!98897 (and (= (_2!5272 lt!184905) lt!184903) (= (_1!5272 lt!184905) (_2!5271 lt!184887))))))

(declare-fun readBitPure!0 (BitStream!4312) tuple2!10014)

(declare-fun readerFrom!0 (BitStream!4312 (_ BitVec 32) (_ BitVec 32)) BitStream!4312)

(assert (=> b!119482 (= lt!184905 (readBitPure!0 (readerFrom!0 (_2!5271 lt!184887) (currentBit!5506 thiss!1305) (currentByte!5511 thiss!1305))))))

(declare-fun b!119483 () Bool)

(declare-fun res!98901 () Bool)

(assert (=> b!119483 (=> (not res!98901) (not e!78287))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!119483 (= res!98901 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!119484 () Bool)

(declare-fun res!98904 () Bool)

(assert (=> b!119484 (=> (not res!98904) (not e!78283))))

(declare-fun isPrefixOf!0 (BitStream!4312 BitStream!4312) Bool)

(assert (=> b!119484 (= res!98904 (isPrefixOf!0 thiss!1305 (_2!5271 lt!184887)))))

(declare-fun b!119485 () Bool)

(declare-fun e!78284 () Bool)

(assert (=> b!119485 (= e!78287 (not e!78284))))

(declare-fun res!98896 () Bool)

(assert (=> b!119485 (=> res!98896 e!78284)))

(declare-datatypes ((tuple2!10016 0))(
  ( (tuple2!10017 (_1!5273 BitStream!4312) (_2!5273 BitStream!4312)) )
))
(declare-fun lt!184891 () tuple2!10016)

(declare-fun lt!184892 () (_ BitVec 64))

(declare-datatypes ((tuple2!10018 0))(
  ( (tuple2!10019 (_1!5274 BitStream!4312) (_2!5274 (_ BitVec 64))) )
))
(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4312 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10018)

(assert (=> b!119485 (= res!98896 (not (= (_1!5274 (readNLeastSignificantBitsLoopPure!0 (_1!5273 lt!184891) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184892)) (_2!5273 lt!184891))))))

(declare-fun lt!184904 () (_ BitVec 64))

(assert (=> b!119485 (validate_offset_bits!1 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184894)))) ((_ sign_extend 32) (currentByte!5511 (_2!5271 lt!184887))) ((_ sign_extend 32) (currentBit!5506 (_2!5271 lt!184887))) lt!184904)))

(declare-fun lt!184902 () Unit!7357)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4312 array!5339 (_ BitVec 64)) Unit!7357)

(assert (=> b!119485 (= lt!184902 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5271 lt!184887) (buf!2844 (_2!5271 lt!184894)) lt!184904))))

(assert (=> b!119485 (= lt!184904 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!184914 () tuple2!10014)

(declare-fun lt!184895 () (_ BitVec 64))

(declare-fun lt!184897 () (_ BitVec 64))

(assert (=> b!119485 (= lt!184892 (bvor lt!184897 (ite (_2!5272 lt!184914) lt!184895 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!184889 () tuple2!10018)

(declare-fun lt!184896 () tuple2!10016)

(assert (=> b!119485 (= lt!184889 (readNLeastSignificantBitsLoopPure!0 (_1!5273 lt!184896) nBits!396 i!615 lt!184897))))

(assert (=> b!119485 (validate_offset_bits!1 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184894)))) ((_ sign_extend 32) (currentByte!5511 thiss!1305)) ((_ sign_extend 32) (currentBit!5506 thiss!1305)) lt!184911)))

(declare-fun lt!184898 () Unit!7357)

(assert (=> b!119485 (= lt!184898 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2844 (_2!5271 lt!184894)) lt!184911))))

(assert (=> b!119485 (= lt!184897 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(assert (=> b!119485 (= (_2!5272 lt!184914) lt!184903)))

(assert (=> b!119485 (= lt!184914 (readBitPure!0 (_1!5273 lt!184896)))))

(declare-fun reader!0 (BitStream!4312 BitStream!4312) tuple2!10016)

(assert (=> b!119485 (= lt!184891 (reader!0 (_2!5271 lt!184887) (_2!5271 lt!184894)))))

(assert (=> b!119485 (= lt!184896 (reader!0 thiss!1305 (_2!5271 lt!184894)))))

(assert (=> b!119485 e!78285))

(declare-fun res!98893 () Bool)

(assert (=> b!119485 (=> (not res!98893) (not e!78285))))

(assert (=> b!119485 (= res!98893 (= (bitIndex!0 (size!2419 (buf!2844 (_1!5272 lt!184910))) (currentByte!5511 (_1!5272 lt!184910)) (currentBit!5506 (_1!5272 lt!184910))) (bitIndex!0 (size!2419 (buf!2844 (_1!5272 lt!184899))) (currentByte!5511 (_1!5272 lt!184899)) (currentBit!5506 (_1!5272 lt!184899)))))))

(declare-fun lt!184888 () Unit!7357)

(declare-fun lt!184908 () BitStream!4312)

(declare-fun readBitPrefixLemma!0 (BitStream!4312 BitStream!4312) Unit!7357)

(assert (=> b!119485 (= lt!184888 (readBitPrefixLemma!0 lt!184908 (_2!5271 lt!184894)))))

(assert (=> b!119485 (= lt!184899 (readBitPure!0 (BitStream!4313 (buf!2844 (_2!5271 lt!184894)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305))))))

(assert (=> b!119485 (= lt!184910 (readBitPure!0 lt!184908))))

(assert (=> b!119485 (= lt!184908 (BitStream!4313 (buf!2844 (_2!5271 lt!184887)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305)))))

(assert (=> b!119485 e!78288))

(declare-fun res!98898 () Bool)

(assert (=> b!119485 (=> (not res!98898) (not e!78288))))

(assert (=> b!119485 (= res!98898 (isPrefixOf!0 thiss!1305 (_2!5271 lt!184894)))))

(declare-fun lt!184913 () Unit!7357)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4312 BitStream!4312 BitStream!4312) Unit!7357)

(assert (=> b!119485 (= lt!184913 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5271 lt!184887) (_2!5271 lt!184894)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4312 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10012)

(assert (=> b!119485 (= lt!184894 (appendNLeastSignificantBitsLoop!0 (_2!5271 lt!184887) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!119485 e!78289))

(declare-fun res!98903 () Bool)

(assert (=> b!119485 (=> (not res!98903) (not e!78289))))

(assert (=> b!119485 (= res!98903 (= (size!2419 (buf!2844 thiss!1305)) (size!2419 (buf!2844 (_2!5271 lt!184887)))))))

(declare-fun appendBit!0 (BitStream!4312 Bool) tuple2!10012)

(assert (=> b!119485 (= lt!184887 (appendBit!0 thiss!1305 lt!184903))))

(assert (=> b!119485 (= lt!184903 (not (= (bvand v!199 lt!184895) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119485 (= lt!184895 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!119486 () Bool)

(declare-fun array_inv!2221 (array!5339) Bool)

(assert (=> b!119486 (= e!78286 (array_inv!2221 (buf!2844 thiss!1305)))))

(declare-fun b!119487 () Bool)

(assert (=> b!119487 (= e!78290 (= (bitIndex!0 (size!2419 (buf!2844 (_1!5272 lt!184905))) (currentByte!5511 (_1!5272 lt!184905)) (currentBit!5506 (_1!5272 lt!184905))) lt!184912))))

(declare-fun lt!184900 () (_ BitVec 64))

(declare-fun lt!184907 () (_ BitVec 64))

(declare-fun b!119488 () Bool)

(declare-fun lt!184890 () (_ BitVec 64))

(assert (=> b!119488 (= e!78284 (or (= lt!184900 (bvand lt!184890 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!184900 (bvand (bvsub lt!184907 lt!184890) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!119488 (= lt!184900 (bvand lt!184907 #b1000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!119488 (= lt!184907 (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184887))) (currentByte!5511 (_2!5271 lt!184887)) (currentBit!5506 (_2!5271 lt!184887))))))

(declare-fun lt!184909 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4312 (_ BitVec 64)) BitStream!4312)

(assert (=> b!119488 (= (_1!5273 lt!184896) (withMovedBitIndex!0 (_2!5273 lt!184896) (bvsub lt!184909 lt!184890)))))

(assert (=> b!119488 (= lt!184890 (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184894))) (currentByte!5511 (_2!5271 lt!184894)) (currentBit!5506 (_2!5271 lt!184894))))))

(assert (=> b!119488 (= lt!184909 (bitIndex!0 (size!2419 (buf!2844 thiss!1305)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305)))))

(declare-fun lt!184893 () tuple2!10018)

(assert (=> b!119488 (and (= (_2!5274 lt!184889) (_2!5274 lt!184893)) (= (_1!5274 lt!184889) (_1!5274 lt!184893)))))

(declare-fun lt!184906 () Unit!7357)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4312 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7357)

(assert (=> b!119488 (= lt!184906 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5273 lt!184896) nBits!396 i!615 lt!184897))))

(assert (=> b!119488 (= lt!184893 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5273 lt!184896) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184892))))

(assert (= (and start!23564 res!98895) b!119481))

(assert (= (and b!119481 res!98900) b!119483))

(assert (= (and b!119483 res!98901) b!119477))

(assert (= (and b!119477 res!98899) b!119485))

(assert (= (and b!119485 res!98903) b!119476))

(assert (= (and b!119476 res!98894) b!119484))

(assert (= (and b!119484 res!98904) b!119482))

(assert (= (and b!119482 res!98897) b!119487))

(assert (= (and b!119485 res!98898) b!119479))

(assert (= (and b!119479 res!98902) b!119480))

(assert (= (and b!119485 res!98893) b!119478))

(assert (= (and b!119485 (not res!98896)) b!119488))

(assert (= start!23564 b!119486))

(declare-fun m!179975 () Bool)

(assert (=> b!119487 m!179975))

(declare-fun m!179977 () Bool)

(assert (=> b!119484 m!179977))

(declare-fun m!179979 () Bool)

(assert (=> b!119483 m!179979))

(declare-fun m!179981 () Bool)

(assert (=> b!119481 m!179981))

(declare-fun m!179983 () Bool)

(assert (=> b!119488 m!179983))

(assert (=> b!119488 m!179983))

(declare-fun m!179985 () Bool)

(assert (=> b!119488 m!179985))

(declare-fun m!179987 () Bool)

(assert (=> b!119488 m!179987))

(declare-fun m!179989 () Bool)

(assert (=> b!119488 m!179989))

(declare-fun m!179991 () Bool)

(assert (=> b!119488 m!179991))

(declare-fun m!179993 () Bool)

(assert (=> b!119488 m!179993))

(declare-fun m!179995 () Bool)

(assert (=> b!119488 m!179995))

(declare-fun m!179997 () Bool)

(assert (=> start!23564 m!179997))

(declare-fun m!179999 () Bool)

(assert (=> b!119482 m!179999))

(assert (=> b!119482 m!179999))

(declare-fun m!180001 () Bool)

(assert (=> b!119482 m!180001))

(declare-fun m!180003 () Bool)

(assert (=> b!119485 m!180003))

(declare-fun m!180005 () Bool)

(assert (=> b!119485 m!180005))

(declare-fun m!180007 () Bool)

(assert (=> b!119485 m!180007))

(declare-fun m!180009 () Bool)

(assert (=> b!119485 m!180009))

(declare-fun m!180011 () Bool)

(assert (=> b!119485 m!180011))

(declare-fun m!180013 () Bool)

(assert (=> b!119485 m!180013))

(declare-fun m!180015 () Bool)

(assert (=> b!119485 m!180015))

(declare-fun m!180017 () Bool)

(assert (=> b!119485 m!180017))

(declare-fun m!180019 () Bool)

(assert (=> b!119485 m!180019))

(declare-fun m!180021 () Bool)

(assert (=> b!119485 m!180021))

(declare-fun m!180023 () Bool)

(assert (=> b!119485 m!180023))

(declare-fun m!180025 () Bool)

(assert (=> b!119485 m!180025))

(declare-fun m!180027 () Bool)

(assert (=> b!119485 m!180027))

(declare-fun m!180029 () Bool)

(assert (=> b!119485 m!180029))

(declare-fun m!180031 () Bool)

(assert (=> b!119485 m!180031))

(declare-fun m!180033 () Bool)

(assert (=> b!119485 m!180033))

(declare-fun m!180035 () Bool)

(assert (=> b!119485 m!180035))

(declare-fun m!180037 () Bool)

(assert (=> b!119485 m!180037))

(declare-fun m!180039 () Bool)

(assert (=> b!119485 m!180039))

(declare-fun m!180041 () Bool)

(assert (=> b!119480 m!180041))

(declare-fun m!180043 () Bool)

(assert (=> b!119486 m!180043))

(assert (=> b!119476 m!179991))

(assert (=> b!119476 m!179987))

(declare-fun m!180045 () Bool)

(assert (=> b!119479 m!180045))

(push 1)

(assert (not start!23564))

(assert (not b!119487))

(assert (not b!119481))

(assert (not b!119484))

(assert (not b!119485))

(assert (not b!119486))

(assert (not b!119476))

(assert (not b!119479))

(assert (not b!119488))

(assert (not b!119480))

(assert (not b!119483))

(assert (not b!119482))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!38380 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!38380 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2419 (buf!2844 thiss!1305))) ((_ sign_extend 32) (currentByte!5511 thiss!1305)) ((_ sign_extend 32) (currentBit!5506 thiss!1305)) lt!184911) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2419 (buf!2844 thiss!1305))) ((_ sign_extend 32) (currentByte!5511 thiss!1305)) ((_ sign_extend 32) (currentBit!5506 thiss!1305))) lt!184911))))

(declare-fun bs!9288 () Bool)

(assert (= bs!9288 d!38380))

(declare-fun m!180255 () Bool)

(assert (=> bs!9288 m!180255))

(assert (=> b!119481 d!38380))

(declare-fun d!38382 () Bool)

(assert (=> d!38382 (= (invariant!0 (currentBit!5506 thiss!1305) (currentByte!5511 thiss!1305) (size!2419 (buf!2844 (_2!5271 lt!184894)))) (and (bvsge (currentBit!5506 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5506 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5511 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5511 thiss!1305) (size!2419 (buf!2844 (_2!5271 lt!184894)))) (and (= (currentBit!5506 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5511 thiss!1305) (size!2419 (buf!2844 (_2!5271 lt!184894))))))))))

(assert (=> b!119480 d!38382))

(declare-fun d!38384 () Bool)

(assert (=> d!38384 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5506 thiss!1305) (currentByte!5511 thiss!1305) (size!2419 (buf!2844 thiss!1305))))))

(declare-fun bs!9289 () Bool)

(assert (= bs!9289 d!38384))

(declare-fun m!180257 () Bool)

(assert (=> bs!9289 m!180257))

(assert (=> start!23564 d!38384))

(declare-fun d!38386 () Bool)

(assert (=> d!38386 (= (invariant!0 (currentBit!5506 thiss!1305) (currentByte!5511 thiss!1305) (size!2419 (buf!2844 (_2!5271 lt!184887)))) (and (bvsge (currentBit!5506 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5506 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5511 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5511 thiss!1305) (size!2419 (buf!2844 (_2!5271 lt!184887)))) (and (= (currentBit!5506 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5511 thiss!1305) (size!2419 (buf!2844 (_2!5271 lt!184887))))))))))

(assert (=> b!119479 d!38386))

(declare-fun d!38388 () Bool)

(assert (=> d!38388 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!119483 d!38388))

(declare-fun d!38390 () Bool)

(declare-datatypes ((tuple2!10040 0))(
  ( (tuple2!10041 (_1!5285 Bool) (_2!5285 BitStream!4312)) )
))
(declare-fun lt!185169 () tuple2!10040)

(declare-fun readBit!0 (BitStream!4312) tuple2!10040)

(assert (=> d!38390 (= lt!185169 (readBit!0 (readerFrom!0 (_2!5271 lt!184887) (currentBit!5506 thiss!1305) (currentByte!5511 thiss!1305))))))

(assert (=> d!38390 (= (readBitPure!0 (readerFrom!0 (_2!5271 lt!184887) (currentBit!5506 thiss!1305) (currentByte!5511 thiss!1305))) (tuple2!10015 (_2!5285 lt!185169) (_1!5285 lt!185169)))))

(declare-fun bs!9290 () Bool)

(assert (= bs!9290 d!38390))

(assert (=> bs!9290 m!179999))

(declare-fun m!180259 () Bool)

(assert (=> bs!9290 m!180259))

(assert (=> b!119482 d!38390))

(declare-fun d!38392 () Bool)

(declare-fun e!78383 () Bool)

(assert (=> d!38392 e!78383))

(declare-fun res!99027 () Bool)

(assert (=> d!38392 (=> (not res!99027) (not e!78383))))

(assert (=> d!38392 (= res!99027 (invariant!0 (currentBit!5506 (_2!5271 lt!184887)) (currentByte!5511 (_2!5271 lt!184887)) (size!2419 (buf!2844 (_2!5271 lt!184887)))))))

(assert (=> d!38392 (= (readerFrom!0 (_2!5271 lt!184887) (currentBit!5506 thiss!1305) (currentByte!5511 thiss!1305)) (BitStream!4313 (buf!2844 (_2!5271 lt!184887)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305)))))

(declare-fun b!119620 () Bool)

(assert (=> b!119620 (= e!78383 (invariant!0 (currentBit!5506 thiss!1305) (currentByte!5511 thiss!1305) (size!2419 (buf!2844 (_2!5271 lt!184887)))))))

(assert (= (and d!38392 res!99027) b!119620))

(declare-fun m!180261 () Bool)

(assert (=> d!38392 m!180261))

(assert (=> b!119620 m!180045))

(assert (=> b!119482 d!38392))

(declare-fun d!38394 () Bool)

(assert (=> d!38394 (= (array_inv!2221 (buf!2844 thiss!1305)) (bvsge (size!2419 (buf!2844 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!119486 d!38394))

(declare-fun lt!185346 () (_ BitVec 64))

(declare-fun lt!185339 () (_ BitVec 64))

(declare-fun e!78400 () Bool)

(declare-fun lt!185335 () tuple2!10016)

(declare-fun b!119651 () Bool)

(assert (=> b!119651 (= e!78400 (= (_1!5273 lt!185335) (withMovedBitIndex!0 (_2!5273 lt!185335) (bvsub lt!185339 lt!185346))))))

(assert (=> b!119651 (or (= (bvand lt!185339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185346 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185339 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185339 lt!185346) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119651 (= lt!185346 (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184894))) (currentByte!5511 (_2!5271 lt!184894)) (currentBit!5506 (_2!5271 lt!184894))))))

(assert (=> b!119651 (= lt!185339 (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184887))) (currentByte!5511 (_2!5271 lt!184887)) (currentBit!5506 (_2!5271 lt!184887))))))

(declare-fun d!38396 () Bool)

(assert (=> d!38396 e!78400))

(declare-fun res!99051 () Bool)

(assert (=> d!38396 (=> (not res!99051) (not e!78400))))

(assert (=> d!38396 (= res!99051 (isPrefixOf!0 (_1!5273 lt!185335) (_2!5273 lt!185335)))))

(declare-fun lt!185340 () BitStream!4312)

(assert (=> d!38396 (= lt!185335 (tuple2!10017 lt!185340 (_2!5271 lt!184894)))))

(declare-fun lt!185336 () Unit!7357)

(declare-fun lt!185341 () Unit!7357)

(assert (=> d!38396 (= lt!185336 lt!185341)))

(assert (=> d!38396 (isPrefixOf!0 lt!185340 (_2!5271 lt!184894))))

(assert (=> d!38396 (= lt!185341 (lemmaIsPrefixTransitive!0 lt!185340 (_2!5271 lt!184894) (_2!5271 lt!184894)))))

(declare-fun lt!185338 () Unit!7357)

(declare-fun lt!185331 () Unit!7357)

(assert (=> d!38396 (= lt!185338 lt!185331)))

(assert (=> d!38396 (isPrefixOf!0 lt!185340 (_2!5271 lt!184894))))

(assert (=> d!38396 (= lt!185331 (lemmaIsPrefixTransitive!0 lt!185340 (_2!5271 lt!184887) (_2!5271 lt!184894)))))

(declare-fun lt!185333 () Unit!7357)

(declare-fun e!78399 () Unit!7357)

(assert (=> d!38396 (= lt!185333 e!78399)))

(declare-fun c!7187 () Bool)

(assert (=> d!38396 (= c!7187 (not (= (size!2419 (buf!2844 (_2!5271 lt!184887))) #b00000000000000000000000000000000)))))

(declare-fun lt!185330 () Unit!7357)

(declare-fun lt!185337 () Unit!7357)

(assert (=> d!38396 (= lt!185330 lt!185337)))

(assert (=> d!38396 (isPrefixOf!0 (_2!5271 lt!184894) (_2!5271 lt!184894))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4312) Unit!7357)

(assert (=> d!38396 (= lt!185337 (lemmaIsPrefixRefl!0 (_2!5271 lt!184894)))))

(declare-fun lt!185332 () Unit!7357)

(declare-fun lt!185347 () Unit!7357)

(assert (=> d!38396 (= lt!185332 lt!185347)))

(assert (=> d!38396 (= lt!185347 (lemmaIsPrefixRefl!0 (_2!5271 lt!184894)))))

(declare-fun lt!185344 () Unit!7357)

(declare-fun lt!185342 () Unit!7357)

(assert (=> d!38396 (= lt!185344 lt!185342)))

(assert (=> d!38396 (isPrefixOf!0 lt!185340 lt!185340)))

(assert (=> d!38396 (= lt!185342 (lemmaIsPrefixRefl!0 lt!185340))))

(declare-fun lt!185334 () Unit!7357)

(declare-fun lt!185345 () Unit!7357)

(assert (=> d!38396 (= lt!185334 lt!185345)))

(assert (=> d!38396 (isPrefixOf!0 (_2!5271 lt!184887) (_2!5271 lt!184887))))

(assert (=> d!38396 (= lt!185345 (lemmaIsPrefixRefl!0 (_2!5271 lt!184887)))))

(assert (=> d!38396 (= lt!185340 (BitStream!4313 (buf!2844 (_2!5271 lt!184894)) (currentByte!5511 (_2!5271 lt!184887)) (currentBit!5506 (_2!5271 lt!184887))))))

(assert (=> d!38396 (isPrefixOf!0 (_2!5271 lt!184887) (_2!5271 lt!184894))))

(assert (=> d!38396 (= (reader!0 (_2!5271 lt!184887) (_2!5271 lt!184894)) lt!185335)))

(declare-fun b!119652 () Bool)

(declare-fun lt!185328 () Unit!7357)

(assert (=> b!119652 (= e!78399 lt!185328)))

(declare-fun lt!185329 () (_ BitVec 64))

(assert (=> b!119652 (= lt!185329 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185343 () (_ BitVec 64))

(assert (=> b!119652 (= lt!185343 (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184887))) (currentByte!5511 (_2!5271 lt!184887)) (currentBit!5506 (_2!5271 lt!184887))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5339 array!5339 (_ BitVec 64) (_ BitVec 64)) Unit!7357)

(assert (=> b!119652 (= lt!185328 (arrayBitRangesEqSymmetric!0 (buf!2844 (_2!5271 lt!184887)) (buf!2844 (_2!5271 lt!184894)) lt!185329 lt!185343))))

(declare-fun arrayBitRangesEq!0 (array!5339 array!5339 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!119652 (arrayBitRangesEq!0 (buf!2844 (_2!5271 lt!184894)) (buf!2844 (_2!5271 lt!184887)) lt!185329 lt!185343)))

(declare-fun b!119653 () Bool)

(declare-fun res!99052 () Bool)

(assert (=> b!119653 (=> (not res!99052) (not e!78400))))

(assert (=> b!119653 (= res!99052 (isPrefixOf!0 (_1!5273 lt!185335) (_2!5271 lt!184887)))))

(declare-fun b!119654 () Bool)

(declare-fun Unit!7366 () Unit!7357)

(assert (=> b!119654 (= e!78399 Unit!7366)))

(declare-fun b!119655 () Bool)

(declare-fun res!99050 () Bool)

(assert (=> b!119655 (=> (not res!99050) (not e!78400))))

(assert (=> b!119655 (= res!99050 (isPrefixOf!0 (_2!5273 lt!185335) (_2!5271 lt!184894)))))

(assert (= (and d!38396 c!7187) b!119652))

(assert (= (and d!38396 (not c!7187)) b!119654))

(assert (= (and d!38396 res!99051) b!119653))

(assert (= (and b!119653 res!99052) b!119655))

(assert (= (and b!119655 res!99050) b!119651))

(declare-fun m!180359 () Bool)

(assert (=> b!119655 m!180359))

(assert (=> b!119652 m!179991))

(declare-fun m!180361 () Bool)

(assert (=> b!119652 m!180361))

(declare-fun m!180363 () Bool)

(assert (=> b!119652 m!180363))

(declare-fun m!180365 () Bool)

(assert (=> d!38396 m!180365))

(declare-fun m!180367 () Bool)

(assert (=> d!38396 m!180367))

(declare-fun m!180369 () Bool)

(assert (=> d!38396 m!180369))

(declare-fun m!180371 () Bool)

(assert (=> d!38396 m!180371))

(declare-fun m!180373 () Bool)

(assert (=> d!38396 m!180373))

(declare-fun m!180375 () Bool)

(assert (=> d!38396 m!180375))

(declare-fun m!180377 () Bool)

(assert (=> d!38396 m!180377))

(declare-fun m!180379 () Bool)

(assert (=> d!38396 m!180379))

(declare-fun m!180381 () Bool)

(assert (=> d!38396 m!180381))

(declare-fun m!180383 () Bool)

(assert (=> d!38396 m!180383))

(declare-fun m!180385 () Bool)

(assert (=> d!38396 m!180385))

(declare-fun m!180387 () Bool)

(assert (=> b!119651 m!180387))

(assert (=> b!119651 m!179989))

(assert (=> b!119651 m!179991))

(declare-fun m!180389 () Bool)

(assert (=> b!119653 m!180389))

(assert (=> b!119485 d!38396))

(declare-fun d!38430 () Bool)

(declare-datatypes ((tuple2!10042 0))(
  ( (tuple2!10043 (_1!5286 (_ BitVec 64)) (_2!5286 BitStream!4312)) )
))
(declare-fun lt!185350 () tuple2!10042)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4312 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10042)

(assert (=> d!38430 (= lt!185350 (readNLeastSignificantBitsLoop!0 (_1!5273 lt!184891) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184892))))

(assert (=> d!38430 (= (readNLeastSignificantBitsLoopPure!0 (_1!5273 lt!184891) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184892) (tuple2!10019 (_2!5286 lt!185350) (_1!5286 lt!185350)))))

(declare-fun bs!9300 () Bool)

(assert (= bs!9300 d!38430))

(declare-fun m!180391 () Bool)

(assert (=> bs!9300 m!180391))

(assert (=> b!119485 d!38430))

(declare-fun d!38432 () Bool)

(assert (=> d!38432 (isPrefixOf!0 thiss!1305 (_2!5271 lt!184894))))

(declare-fun lt!185353 () Unit!7357)

(declare-fun choose!30 (BitStream!4312 BitStream!4312 BitStream!4312) Unit!7357)

(assert (=> d!38432 (= lt!185353 (choose!30 thiss!1305 (_2!5271 lt!184887) (_2!5271 lt!184894)))))

(assert (=> d!38432 (isPrefixOf!0 thiss!1305 (_2!5271 lt!184887))))

(assert (=> d!38432 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5271 lt!184887) (_2!5271 lt!184894)) lt!185353)))

(declare-fun bs!9301 () Bool)

(assert (= bs!9301 d!38432))

(assert (=> bs!9301 m!180031))

(declare-fun m!180393 () Bool)

(assert (=> bs!9301 m!180393))

(assert (=> bs!9301 m!179977))

(assert (=> b!119485 d!38432))

(declare-fun d!38434 () Bool)

(assert (=> d!38434 (validate_offset_bits!1 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184894)))) ((_ sign_extend 32) (currentByte!5511 thiss!1305)) ((_ sign_extend 32) (currentBit!5506 thiss!1305)) lt!184911)))

(declare-fun lt!185356 () Unit!7357)

(declare-fun choose!9 (BitStream!4312 array!5339 (_ BitVec 64) BitStream!4312) Unit!7357)

(assert (=> d!38434 (= lt!185356 (choose!9 thiss!1305 (buf!2844 (_2!5271 lt!184894)) lt!184911 (BitStream!4313 (buf!2844 (_2!5271 lt!184894)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305))))))

(assert (=> d!38434 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2844 (_2!5271 lt!184894)) lt!184911) lt!185356)))

(declare-fun bs!9302 () Bool)

(assert (= bs!9302 d!38434))

(assert (=> bs!9302 m!180033))

(declare-fun m!180395 () Bool)

(assert (=> bs!9302 m!180395))

(assert (=> b!119485 d!38434))

(declare-fun d!38436 () Bool)

(declare-fun lt!185357 () tuple2!10040)

(assert (=> d!38436 (= lt!185357 (readBit!0 (BitStream!4313 (buf!2844 (_2!5271 lt!184894)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305))))))

(assert (=> d!38436 (= (readBitPure!0 (BitStream!4313 (buf!2844 (_2!5271 lt!184894)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305))) (tuple2!10015 (_2!5285 lt!185357) (_1!5285 lt!185357)))))

(declare-fun bs!9303 () Bool)

(assert (= bs!9303 d!38436))

(declare-fun m!180397 () Bool)

(assert (=> bs!9303 m!180397))

(assert (=> b!119485 d!38436))

(declare-fun d!38438 () Bool)

(assert (=> d!38438 (validate_offset_bits!1 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184894)))) ((_ sign_extend 32) (currentByte!5511 (_2!5271 lt!184887))) ((_ sign_extend 32) (currentBit!5506 (_2!5271 lt!184887))) lt!184904)))

(declare-fun lt!185358 () Unit!7357)

(assert (=> d!38438 (= lt!185358 (choose!9 (_2!5271 lt!184887) (buf!2844 (_2!5271 lt!184894)) lt!184904 (BitStream!4313 (buf!2844 (_2!5271 lt!184894)) (currentByte!5511 (_2!5271 lt!184887)) (currentBit!5506 (_2!5271 lt!184887)))))))

(assert (=> d!38438 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5271 lt!184887) (buf!2844 (_2!5271 lt!184894)) lt!184904) lt!185358)))

(declare-fun bs!9304 () Bool)

(assert (= bs!9304 d!38438))

(assert (=> bs!9304 m!180029))

(declare-fun m!180399 () Bool)

(assert (=> bs!9304 m!180399))

(assert (=> b!119485 d!38438))

(declare-fun b!119735 () Bool)

(declare-fun res!99116 () Bool)

(declare-fun lt!185668 () tuple2!10012)

(assert (=> b!119735 (= res!99116 (= (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!185668))) (currentByte!5511 (_2!5271 lt!185668)) (currentBit!5506 (_2!5271 lt!185668))) (bvadd (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184887))) (currentByte!5511 (_2!5271 lt!184887)) (currentBit!5506 (_2!5271 lt!184887))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!78446 () Bool)

(assert (=> b!119735 (=> (not res!99116) (not e!78446))))

(declare-fun b!119736 () Bool)

(declare-fun e!78444 () tuple2!10012)

(declare-fun lt!185672 () Unit!7357)

(assert (=> b!119736 (= e!78444 (tuple2!10013 lt!185672 (_2!5271 lt!184887)))))

(declare-fun lt!185661 () BitStream!4312)

(assert (=> b!119736 (= lt!185661 (_2!5271 lt!184887))))

(assert (=> b!119736 (= lt!185672 (lemmaIsPrefixRefl!0 lt!185661))))

(declare-fun call!1559 () Bool)

(assert (=> b!119736 call!1559))

(declare-fun d!38440 () Bool)

(declare-fun e!78445 () Bool)

(assert (=> d!38440 e!78445))

(declare-fun res!99109 () Bool)

(assert (=> d!38440 (=> (not res!99109) (not e!78445))))

(declare-fun lt!185679 () tuple2!10012)

(assert (=> d!38440 (= res!99109 (= (size!2419 (buf!2844 (_2!5271 lt!184887))) (size!2419 (buf!2844 (_2!5271 lt!185679)))))))

(assert (=> d!38440 (= lt!185679 e!78444)))

(declare-fun c!7201 () Bool)

(assert (=> d!38440 (= c!7201 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!38440 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!38440 (= (appendNLeastSignificantBitsLoop!0 (_2!5271 lt!184887) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!185679)))

(declare-fun b!119737 () Bool)

(declare-fun e!78450 () Bool)

(declare-fun lt!185660 () tuple2!10014)

(assert (=> b!119737 (= e!78450 (= (bitIndex!0 (size!2419 (buf!2844 (_1!5272 lt!185660))) (currentByte!5511 (_1!5272 lt!185660)) (currentBit!5506 (_1!5272 lt!185660))) (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!185668))) (currentByte!5511 (_2!5271 lt!185668)) (currentBit!5506 (_2!5271 lt!185668)))))))

(declare-fun b!119738 () Bool)

(declare-fun e!78447 () (_ BitVec 64))

(assert (=> b!119738 (= e!78447 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!119739 () Bool)

(declare-fun lt!185681 () tuple2!10012)

(declare-fun Unit!7372 () Unit!7357)

(assert (=> b!119739 (= e!78444 (tuple2!10013 Unit!7372 (_2!5271 lt!185681)))))

(declare-fun lt!185675 () Bool)

(assert (=> b!119739 (= lt!185675 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119739 (= lt!185668 (appendBit!0 (_2!5271 lt!184887) lt!185675))))

(declare-fun res!99113 () Bool)

(assert (=> b!119739 (= res!99113 (= (size!2419 (buf!2844 (_2!5271 lt!184887))) (size!2419 (buf!2844 (_2!5271 lt!185668)))))))

(assert (=> b!119739 (=> (not res!99113) (not e!78446))))

(assert (=> b!119739 e!78446))

(declare-fun lt!185658 () tuple2!10012)

(assert (=> b!119739 (= lt!185658 lt!185668)))

(assert (=> b!119739 (= lt!185681 (appendNLeastSignificantBitsLoop!0 (_2!5271 lt!185658) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!185647 () Unit!7357)

(assert (=> b!119739 (= lt!185647 (lemmaIsPrefixTransitive!0 (_2!5271 lt!184887) (_2!5271 lt!185658) (_2!5271 lt!185681)))))

(assert (=> b!119739 call!1559))

(declare-fun lt!185657 () Unit!7357)

(assert (=> b!119739 (= lt!185657 lt!185647)))

(assert (=> b!119739 (invariant!0 (currentBit!5506 (_2!5271 lt!184887)) (currentByte!5511 (_2!5271 lt!184887)) (size!2419 (buf!2844 (_2!5271 lt!185658))))))

(declare-fun lt!185641 () BitStream!4312)

(assert (=> b!119739 (= lt!185641 (BitStream!4313 (buf!2844 (_2!5271 lt!185658)) (currentByte!5511 (_2!5271 lt!184887)) (currentBit!5506 (_2!5271 lt!184887))))))

(assert (=> b!119739 (invariant!0 (currentBit!5506 lt!185641) (currentByte!5511 lt!185641) (size!2419 (buf!2844 (_2!5271 lt!185681))))))

(declare-fun lt!185667 () BitStream!4312)

(assert (=> b!119739 (= lt!185667 (BitStream!4313 (buf!2844 (_2!5271 lt!185681)) (currentByte!5511 lt!185641) (currentBit!5506 lt!185641)))))

(declare-fun lt!185664 () tuple2!10014)

(assert (=> b!119739 (= lt!185664 (readBitPure!0 lt!185641))))

(declare-fun lt!185677 () tuple2!10014)

(assert (=> b!119739 (= lt!185677 (readBitPure!0 lt!185667))))

(declare-fun lt!185654 () Unit!7357)

(assert (=> b!119739 (= lt!185654 (readBitPrefixLemma!0 lt!185641 (_2!5271 lt!185681)))))

(declare-fun res!99108 () Bool)

(assert (=> b!119739 (= res!99108 (= (bitIndex!0 (size!2419 (buf!2844 (_1!5272 lt!185664))) (currentByte!5511 (_1!5272 lt!185664)) (currentBit!5506 (_1!5272 lt!185664))) (bitIndex!0 (size!2419 (buf!2844 (_1!5272 lt!185677))) (currentByte!5511 (_1!5272 lt!185677)) (currentBit!5506 (_1!5272 lt!185677)))))))

(declare-fun e!78449 () Bool)

(assert (=> b!119739 (=> (not res!99108) (not e!78449))))

(assert (=> b!119739 e!78449))

(declare-fun lt!185676 () Unit!7357)

(assert (=> b!119739 (= lt!185676 lt!185654)))

(declare-fun lt!185649 () tuple2!10016)

(assert (=> b!119739 (= lt!185649 (reader!0 (_2!5271 lt!184887) (_2!5271 lt!185681)))))

(declare-fun lt!185644 () tuple2!10016)

(assert (=> b!119739 (= lt!185644 (reader!0 (_2!5271 lt!185658) (_2!5271 lt!185681)))))

(declare-fun lt!185645 () tuple2!10014)

(assert (=> b!119739 (= lt!185645 (readBitPure!0 (_1!5273 lt!185649)))))

(assert (=> b!119739 (= (_2!5272 lt!185645) lt!185675)))

(declare-fun lt!185662 () Unit!7357)

(declare-fun Unit!7373 () Unit!7357)

(assert (=> b!119739 (= lt!185662 Unit!7373)))

(declare-fun lt!185673 () (_ BitVec 64))

(assert (=> b!119739 (= lt!185673 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!185678 () (_ BitVec 64))

(assert (=> b!119739 (= lt!185678 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!185638 () Unit!7357)

(assert (=> b!119739 (= lt!185638 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5271 lt!184887) (buf!2844 (_2!5271 lt!185681)) lt!185678))))

(assert (=> b!119739 (validate_offset_bits!1 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!185681)))) ((_ sign_extend 32) (currentByte!5511 (_2!5271 lt!184887))) ((_ sign_extend 32) (currentBit!5506 (_2!5271 lt!184887))) lt!185678)))

(declare-fun lt!185656 () Unit!7357)

(assert (=> b!119739 (= lt!185656 lt!185638)))

(declare-fun lt!185648 () tuple2!10018)

(assert (=> b!119739 (= lt!185648 (readNLeastSignificantBitsLoopPure!0 (_1!5273 lt!185649) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185673))))

(declare-fun lt!185651 () (_ BitVec 64))

(assert (=> b!119739 (= lt!185651 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!185669 () Unit!7357)

(assert (=> b!119739 (= lt!185669 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5271 lt!185658) (buf!2844 (_2!5271 lt!185681)) lt!185651))))

(assert (=> b!119739 (validate_offset_bits!1 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!185681)))) ((_ sign_extend 32) (currentByte!5511 (_2!5271 lt!185658))) ((_ sign_extend 32) (currentBit!5506 (_2!5271 lt!185658))) lt!185651)))

(declare-fun lt!185670 () Unit!7357)

(assert (=> b!119739 (= lt!185670 lt!185669)))

(declare-fun lt!185663 () tuple2!10018)

(assert (=> b!119739 (= lt!185663 (readNLeastSignificantBitsLoopPure!0 (_1!5273 lt!185644) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!185673 (ite (_2!5272 lt!185645) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!185637 () tuple2!10018)

(assert (=> b!119739 (= lt!185637 (readNLeastSignificantBitsLoopPure!0 (_1!5273 lt!185649) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185673))))

(declare-fun c!7200 () Bool)

(assert (=> b!119739 (= c!7200 (_2!5272 (readBitPure!0 (_1!5273 lt!185649))))))

(declare-fun lt!185671 () tuple2!10018)

(assert (=> b!119739 (= lt!185671 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5273 lt!185649) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!185673 e!78447)))))

(declare-fun lt!185653 () Unit!7357)

(assert (=> b!119739 (= lt!185653 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5273 lt!185649) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185673))))

(assert (=> b!119739 (and (= (_2!5274 lt!185637) (_2!5274 lt!185671)) (= (_1!5274 lt!185637) (_1!5274 lt!185671)))))

(declare-fun lt!185680 () Unit!7357)

(assert (=> b!119739 (= lt!185680 lt!185653)))

(assert (=> b!119739 (= (_1!5273 lt!185649) (withMovedBitIndex!0 (_2!5273 lt!185649) (bvsub (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184887))) (currentByte!5511 (_2!5271 lt!184887)) (currentBit!5506 (_2!5271 lt!184887))) (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!185681))) (currentByte!5511 (_2!5271 lt!185681)) (currentBit!5506 (_2!5271 lt!185681))))))))

(declare-fun lt!185643 () Unit!7357)

(declare-fun Unit!7374 () Unit!7357)

(assert (=> b!119739 (= lt!185643 Unit!7374)))

(assert (=> b!119739 (= (_1!5273 lt!185644) (withMovedBitIndex!0 (_2!5273 lt!185644) (bvsub (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!185658))) (currentByte!5511 (_2!5271 lt!185658)) (currentBit!5506 (_2!5271 lt!185658))) (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!185681))) (currentByte!5511 (_2!5271 lt!185681)) (currentBit!5506 (_2!5271 lt!185681))))))))

(declare-fun lt!185639 () Unit!7357)

(declare-fun Unit!7375 () Unit!7357)

(assert (=> b!119739 (= lt!185639 Unit!7375)))

(assert (=> b!119739 (= (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184887))) (currentByte!5511 (_2!5271 lt!184887)) (currentBit!5506 (_2!5271 lt!184887))) (bvsub (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!185658))) (currentByte!5511 (_2!5271 lt!185658)) (currentBit!5506 (_2!5271 lt!185658))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!185659 () Unit!7357)

(declare-fun Unit!7376 () Unit!7357)

(assert (=> b!119739 (= lt!185659 Unit!7376)))

(assert (=> b!119739 (= (_2!5274 lt!185648) (_2!5274 lt!185663))))

(declare-fun lt!185683 () Unit!7357)

(declare-fun Unit!7377 () Unit!7357)

(assert (=> b!119739 (= lt!185683 Unit!7377)))

(assert (=> b!119739 (= (_1!5274 lt!185648) (_2!5273 lt!185649))))

(declare-fun bm!1556 () Bool)

(assert (=> bm!1556 (= call!1559 (isPrefixOf!0 (ite c!7201 (_2!5271 lt!184887) lt!185661) (ite c!7201 (_2!5271 lt!185681) lt!185661)))))

(declare-fun b!119740 () Bool)

(declare-fun lt!185655 () tuple2!10018)

(declare-fun lt!185652 () tuple2!10016)

(assert (=> b!119740 (= e!78445 (and (= (_2!5274 lt!185655) v!199) (= (_1!5274 lt!185655) (_2!5273 lt!185652))))))

(declare-fun lt!185646 () (_ BitVec 64))

(assert (=> b!119740 (= lt!185655 (readNLeastSignificantBitsLoopPure!0 (_1!5273 lt!185652) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!185646))))

(declare-fun lt!185682 () Unit!7357)

(declare-fun lt!185650 () Unit!7357)

(assert (=> b!119740 (= lt!185682 lt!185650)))

(declare-fun lt!185674 () (_ BitVec 64))

(assert (=> b!119740 (validate_offset_bits!1 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!185679)))) ((_ sign_extend 32) (currentByte!5511 (_2!5271 lt!184887))) ((_ sign_extend 32) (currentBit!5506 (_2!5271 lt!184887))) lt!185674)))

(assert (=> b!119740 (= lt!185650 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5271 lt!184887) (buf!2844 (_2!5271 lt!185679)) lt!185674))))

(declare-fun e!78448 () Bool)

(assert (=> b!119740 e!78448))

(declare-fun res!99111 () Bool)

(assert (=> b!119740 (=> (not res!99111) (not e!78448))))

(assert (=> b!119740 (= res!99111 (and (= (size!2419 (buf!2844 (_2!5271 lt!184887))) (size!2419 (buf!2844 (_2!5271 lt!185679)))) (bvsge lt!185674 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119740 (= lt!185674 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!119740 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119740 (= lt!185646 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!119740 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119740 (= lt!185652 (reader!0 (_2!5271 lt!184887) (_2!5271 lt!185679)))))

(declare-fun b!119741 () Bool)

(assert (=> b!119741 (= e!78448 (validate_offset_bits!1 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184887)))) ((_ sign_extend 32) (currentByte!5511 (_2!5271 lt!184887))) ((_ sign_extend 32) (currentBit!5506 (_2!5271 lt!184887))) lt!185674))))

(declare-fun b!119742 () Bool)

(assert (=> b!119742 (= e!78449 (= (_2!5272 lt!185664) (_2!5272 lt!185677)))))

(declare-fun b!119743 () Bool)

(declare-fun res!99110 () Bool)

(assert (=> b!119743 (= res!99110 (isPrefixOf!0 (_2!5271 lt!184887) (_2!5271 lt!185668)))))

(assert (=> b!119743 (=> (not res!99110) (not e!78446))))

(declare-fun b!119744 () Bool)

(assert (=> b!119744 (= lt!185660 (readBitPure!0 (readerFrom!0 (_2!5271 lt!185668) (currentBit!5506 (_2!5271 lt!184887)) (currentByte!5511 (_2!5271 lt!184887)))))))

(declare-fun res!99112 () Bool)

(assert (=> b!119744 (= res!99112 (and (= (_2!5272 lt!185660) lt!185675) (= (_1!5272 lt!185660) (_2!5271 lt!185668))))))

(assert (=> b!119744 (=> (not res!99112) (not e!78450))))

(assert (=> b!119744 (= e!78446 e!78450)))

(declare-fun b!119745 () Bool)

(declare-fun res!99115 () Bool)

(assert (=> b!119745 (=> (not res!99115) (not e!78445))))

(declare-fun lt!185640 () (_ BitVec 64))

(declare-fun lt!185642 () (_ BitVec 64))

(assert (=> b!119745 (= res!99115 (= (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!185679))) (currentByte!5511 (_2!5271 lt!185679)) (currentBit!5506 (_2!5271 lt!185679))) (bvadd lt!185642 lt!185640)))))

(assert (=> b!119745 (or (not (= (bvand lt!185642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185640 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!185642 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!185642 lt!185640) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119745 (= lt!185640 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!119745 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!119745 (= lt!185642 (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184887))) (currentByte!5511 (_2!5271 lt!184887)) (currentBit!5506 (_2!5271 lt!184887))))))

(declare-fun b!119746 () Bool)

(assert (=> b!119746 (= e!78447 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!119747 () Bool)

(declare-fun res!99114 () Bool)

(assert (=> b!119747 (=> (not res!99114) (not e!78445))))

(assert (=> b!119747 (= res!99114 (isPrefixOf!0 (_2!5271 lt!184887) (_2!5271 lt!185679)))))

(assert (= (and d!38440 c!7201) b!119739))

(assert (= (and d!38440 (not c!7201)) b!119736))

(assert (= (and b!119739 res!99113) b!119735))

(assert (= (and b!119735 res!99116) b!119743))

(assert (= (and b!119743 res!99110) b!119744))

(assert (= (and b!119744 res!99112) b!119737))

(assert (= (and b!119739 res!99108) b!119742))

(assert (= (and b!119739 c!7200) b!119738))

(assert (= (and b!119739 (not c!7200)) b!119746))

(assert (= (or b!119739 b!119736) bm!1556))

(assert (= (and d!38440 res!99109) b!119745))

(assert (= (and b!119745 res!99115) b!119747))

(assert (= (and b!119747 res!99114) b!119740))

(assert (= (and b!119740 res!99111) b!119741))

(declare-fun m!180485 () Bool)

(assert (=> b!119744 m!180485))

(assert (=> b!119744 m!180485))

(declare-fun m!180487 () Bool)

(assert (=> b!119744 m!180487))

(declare-fun m!180489 () Bool)

(assert (=> b!119745 m!180489))

(assert (=> b!119745 m!179991))

(declare-fun m!180491 () Bool)

(assert (=> b!119743 m!180491))

(declare-fun m!180493 () Bool)

(assert (=> b!119736 m!180493))

(declare-fun m!180495 () Bool)

(assert (=> b!119740 m!180495))

(declare-fun m!180497 () Bool)

(assert (=> b!119740 m!180497))

(declare-fun m!180499 () Bool)

(assert (=> b!119740 m!180499))

(declare-fun m!180501 () Bool)

(assert (=> b!119740 m!180501))

(declare-fun m!180503 () Bool)

(assert (=> b!119740 m!180503))

(declare-fun m!180505 () Bool)

(assert (=> b!119747 m!180505))

(declare-fun m!180507 () Bool)

(assert (=> b!119741 m!180507))

(declare-fun m!180509 () Bool)

(assert (=> b!119735 m!180509))

(assert (=> b!119735 m!179991))

(declare-fun m!180511 () Bool)

(assert (=> bm!1556 m!180511))

(declare-fun m!180513 () Bool)

(assert (=> b!119739 m!180513))

(assert (=> b!119739 m!180495))

(declare-fun m!180515 () Bool)

(assert (=> b!119739 m!180515))

(declare-fun m!180517 () Bool)

(assert (=> b!119739 m!180517))

(assert (=> b!119739 m!180515))

(declare-fun m!180519 () Bool)

(assert (=> b!119739 m!180519))

(declare-fun m!180521 () Bool)

(assert (=> b!119739 m!180521))

(declare-fun m!180523 () Bool)

(assert (=> b!119739 m!180523))

(declare-fun m!180525 () Bool)

(assert (=> b!119739 m!180525))

(declare-fun m!180527 () Bool)

(assert (=> b!119739 m!180527))

(declare-fun m!180529 () Bool)

(assert (=> b!119739 m!180529))

(declare-fun m!180531 () Bool)

(assert (=> b!119739 m!180531))

(declare-fun m!180533 () Bool)

(assert (=> b!119739 m!180533))

(declare-fun m!180535 () Bool)

(assert (=> b!119739 m!180535))

(declare-fun m!180537 () Bool)

(assert (=> b!119739 m!180537))

(declare-fun m!180539 () Bool)

(assert (=> b!119739 m!180539))

(declare-fun m!180541 () Bool)

(assert (=> b!119739 m!180541))

(declare-fun m!180543 () Bool)

(assert (=> b!119739 m!180543))

(declare-fun m!180545 () Bool)

(assert (=> b!119739 m!180545))

(declare-fun m!180547 () Bool)

(assert (=> b!119739 m!180547))

(assert (=> b!119739 m!179991))

(declare-fun m!180549 () Bool)

(assert (=> b!119739 m!180549))

(declare-fun m!180551 () Bool)

(assert (=> b!119739 m!180551))

(declare-fun m!180553 () Bool)

(assert (=> b!119739 m!180553))

(declare-fun m!180555 () Bool)

(assert (=> b!119739 m!180555))

(declare-fun m!180557 () Bool)

(assert (=> b!119739 m!180557))

(declare-fun m!180559 () Bool)

(assert (=> b!119739 m!180559))

(declare-fun m!180561 () Bool)

(assert (=> b!119739 m!180561))

(declare-fun m!180563 () Bool)

(assert (=> b!119739 m!180563))

(declare-fun m!180565 () Bool)

(assert (=> b!119737 m!180565))

(assert (=> b!119737 m!180509))

(assert (=> b!119485 d!38440))

(declare-fun d!38444 () Bool)

(assert (=> d!38444 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184894)))) ((_ sign_extend 32) (currentByte!5511 thiss!1305)) ((_ sign_extend 32) (currentBit!5506 thiss!1305)) lt!184911) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184894)))) ((_ sign_extend 32) (currentByte!5511 thiss!1305)) ((_ sign_extend 32) (currentBit!5506 thiss!1305))) lt!184911))))

(declare-fun bs!9306 () Bool)

(assert (= bs!9306 d!38444))

(declare-fun m!180567 () Bool)

(assert (=> bs!9306 m!180567))

(assert (=> b!119485 d!38444))

(declare-fun d!38446 () Bool)

(declare-fun e!78459 () Bool)

(assert (=> d!38446 e!78459))

(declare-fun res!99130 () Bool)

(assert (=> d!38446 (=> (not res!99130) (not e!78459))))

(declare-fun lt!185736 () (_ BitVec 64))

(declare-fun lt!185733 () (_ BitVec 64))

(declare-fun lt!185737 () (_ BitVec 64))

(assert (=> d!38446 (= res!99130 (= lt!185733 (bvsub lt!185737 lt!185736)))))

(assert (=> d!38446 (or (= (bvand lt!185737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185736 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185737 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185737 lt!185736) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38446 (= lt!185736 (remainingBits!0 ((_ sign_extend 32) (size!2419 (buf!2844 (_1!5272 lt!184899)))) ((_ sign_extend 32) (currentByte!5511 (_1!5272 lt!184899))) ((_ sign_extend 32) (currentBit!5506 (_1!5272 lt!184899)))))))

(declare-fun lt!185732 () (_ BitVec 64))

(declare-fun lt!185735 () (_ BitVec 64))

(assert (=> d!38446 (= lt!185737 (bvmul lt!185732 lt!185735))))

(assert (=> d!38446 (or (= lt!185732 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!185735 (bvsdiv (bvmul lt!185732 lt!185735) lt!185732)))))

(assert (=> d!38446 (= lt!185735 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38446 (= lt!185732 ((_ sign_extend 32) (size!2419 (buf!2844 (_1!5272 lt!184899)))))))

(assert (=> d!38446 (= lt!185733 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5511 (_1!5272 lt!184899))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5506 (_1!5272 lt!184899)))))))

(assert (=> d!38446 (invariant!0 (currentBit!5506 (_1!5272 lt!184899)) (currentByte!5511 (_1!5272 lt!184899)) (size!2419 (buf!2844 (_1!5272 lt!184899))))))

(assert (=> d!38446 (= (bitIndex!0 (size!2419 (buf!2844 (_1!5272 lt!184899))) (currentByte!5511 (_1!5272 lt!184899)) (currentBit!5506 (_1!5272 lt!184899))) lt!185733)))

(declare-fun b!119764 () Bool)

(declare-fun res!99129 () Bool)

(assert (=> b!119764 (=> (not res!99129) (not e!78459))))

(assert (=> b!119764 (= res!99129 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!185733))))

(declare-fun b!119765 () Bool)

(declare-fun lt!185734 () (_ BitVec 64))

(assert (=> b!119765 (= e!78459 (bvsle lt!185733 (bvmul lt!185734 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119765 (or (= lt!185734 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!185734 #b0000000000000000000000000000000000000000000000000000000000001000) lt!185734)))))

(assert (=> b!119765 (= lt!185734 ((_ sign_extend 32) (size!2419 (buf!2844 (_1!5272 lt!184899)))))))

(assert (= (and d!38446 res!99130) b!119764))

(assert (= (and b!119764 res!99129) b!119765))

(declare-fun m!180569 () Bool)

(assert (=> d!38446 m!180569))

(declare-fun m!180571 () Bool)

(assert (=> d!38446 m!180571))

(assert (=> b!119485 d!38446))

(declare-fun d!38448 () Bool)

(declare-fun e!78473 () Bool)

(assert (=> d!38448 e!78473))

(declare-fun res!99148 () Bool)

(assert (=> d!38448 (=> (not res!99148) (not e!78473))))

(declare-fun lt!185791 () tuple2!10014)

(declare-fun lt!185793 () tuple2!10014)

(assert (=> d!38448 (= res!99148 (= (bitIndex!0 (size!2419 (buf!2844 (_1!5272 lt!185791))) (currentByte!5511 (_1!5272 lt!185791)) (currentBit!5506 (_1!5272 lt!185791))) (bitIndex!0 (size!2419 (buf!2844 (_1!5272 lt!185793))) (currentByte!5511 (_1!5272 lt!185793)) (currentBit!5506 (_1!5272 lt!185793)))))))

(declare-fun lt!185794 () BitStream!4312)

(declare-fun lt!185792 () Unit!7357)

(declare-fun choose!50 (BitStream!4312 BitStream!4312 BitStream!4312 tuple2!10014 tuple2!10014 BitStream!4312 Bool tuple2!10014 tuple2!10014 BitStream!4312 Bool) Unit!7357)

(assert (=> d!38448 (= lt!185792 (choose!50 lt!184908 (_2!5271 lt!184894) lt!185794 lt!185791 (tuple2!10015 (_1!5272 lt!185791) (_2!5272 lt!185791)) (_1!5272 lt!185791) (_2!5272 lt!185791) lt!185793 (tuple2!10015 (_1!5272 lt!185793) (_2!5272 lt!185793)) (_1!5272 lt!185793) (_2!5272 lt!185793)))))

(assert (=> d!38448 (= lt!185793 (readBitPure!0 lt!185794))))

(assert (=> d!38448 (= lt!185791 (readBitPure!0 lt!184908))))

(assert (=> d!38448 (= lt!185794 (BitStream!4313 (buf!2844 (_2!5271 lt!184894)) (currentByte!5511 lt!184908) (currentBit!5506 lt!184908)))))

(assert (=> d!38448 (invariant!0 (currentBit!5506 lt!184908) (currentByte!5511 lt!184908) (size!2419 (buf!2844 (_2!5271 lt!184894))))))

(assert (=> d!38448 (= (readBitPrefixLemma!0 lt!184908 (_2!5271 lt!184894)) lt!185792)))

(declare-fun b!119787 () Bool)

(assert (=> b!119787 (= e!78473 (= (_2!5272 lt!185791) (_2!5272 lt!185793)))))

(assert (= (and d!38448 res!99148) b!119787))

(declare-fun m!180655 () Bool)

(assert (=> d!38448 m!180655))

(assert (=> d!38448 m!180039))

(declare-fun m!180659 () Bool)

(assert (=> d!38448 m!180659))

(declare-fun m!180661 () Bool)

(assert (=> d!38448 m!180661))

(declare-fun m!180663 () Bool)

(assert (=> d!38448 m!180663))

(declare-fun m!180665 () Bool)

(assert (=> d!38448 m!180665))

(assert (=> b!119485 d!38448))

(declare-fun d!38454 () Bool)

(assert (=> d!38454 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!119485 d!38454))

(declare-fun d!38456 () Bool)

(declare-fun e!78476 () Bool)

(assert (=> d!38456 e!78476))

(declare-fun res!99153 () Bool)

(assert (=> d!38456 (=> (not res!99153) (not e!78476))))

(declare-fun lt!185799 () (_ BitVec 64))

(declare-fun lt!185800 () (_ BitVec 64))

(declare-fun lt!185796 () (_ BitVec 64))

(assert (=> d!38456 (= res!99153 (= lt!185796 (bvsub lt!185800 lt!185799)))))

(assert (=> d!38456 (or (= (bvand lt!185800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185799 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185800 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185800 lt!185799) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38456 (= lt!185799 (remainingBits!0 ((_ sign_extend 32) (size!2419 (buf!2844 (_1!5272 lt!184910)))) ((_ sign_extend 32) (currentByte!5511 (_1!5272 lt!184910))) ((_ sign_extend 32) (currentBit!5506 (_1!5272 lt!184910)))))))

(declare-fun lt!185795 () (_ BitVec 64))

(declare-fun lt!185798 () (_ BitVec 64))

(assert (=> d!38456 (= lt!185800 (bvmul lt!185795 lt!185798))))

(assert (=> d!38456 (or (= lt!185795 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!185798 (bvsdiv (bvmul lt!185795 lt!185798) lt!185795)))))

(assert (=> d!38456 (= lt!185798 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38456 (= lt!185795 ((_ sign_extend 32) (size!2419 (buf!2844 (_1!5272 lt!184910)))))))

(assert (=> d!38456 (= lt!185796 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5511 (_1!5272 lt!184910))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5506 (_1!5272 lt!184910)))))))

(assert (=> d!38456 (invariant!0 (currentBit!5506 (_1!5272 lt!184910)) (currentByte!5511 (_1!5272 lt!184910)) (size!2419 (buf!2844 (_1!5272 lt!184910))))))

(assert (=> d!38456 (= (bitIndex!0 (size!2419 (buf!2844 (_1!5272 lt!184910))) (currentByte!5511 (_1!5272 lt!184910)) (currentBit!5506 (_1!5272 lt!184910))) lt!185796)))

(declare-fun b!119791 () Bool)

(declare-fun res!99152 () Bool)

(assert (=> b!119791 (=> (not res!99152) (not e!78476))))

(assert (=> b!119791 (= res!99152 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!185796))))

(declare-fun b!119792 () Bool)

(declare-fun lt!185797 () (_ BitVec 64))

(assert (=> b!119792 (= e!78476 (bvsle lt!185796 (bvmul lt!185797 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119792 (or (= lt!185797 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!185797 #b0000000000000000000000000000000000000000000000000000000000001000) lt!185797)))))

(assert (=> b!119792 (= lt!185797 ((_ sign_extend 32) (size!2419 (buf!2844 (_1!5272 lt!184910)))))))

(assert (= (and d!38456 res!99153) b!119791))

(assert (= (and b!119791 res!99152) b!119792))

(declare-fun m!180667 () Bool)

(assert (=> d!38456 m!180667))

(declare-fun m!180669 () Bool)

(assert (=> d!38456 m!180669))

(assert (=> b!119485 d!38456))

(declare-fun d!38458 () Bool)

(declare-fun lt!185801 () tuple2!10040)

(assert (=> d!38458 (= lt!185801 (readBit!0 (_1!5273 lt!184896)))))

(assert (=> d!38458 (= (readBitPure!0 (_1!5273 lt!184896)) (tuple2!10015 (_2!5285 lt!185801) (_1!5285 lt!185801)))))

(declare-fun bs!9307 () Bool)

(assert (= bs!9307 d!38458))

(declare-fun m!180671 () Bool)

(assert (=> bs!9307 m!180671))

(assert (=> b!119485 d!38458))

(declare-fun d!38460 () Bool)

(declare-fun lt!185802 () tuple2!10040)

(assert (=> d!38460 (= lt!185802 (readBit!0 lt!184908))))

(assert (=> d!38460 (= (readBitPure!0 lt!184908) (tuple2!10015 (_2!5285 lt!185802) (_1!5285 lt!185802)))))

(declare-fun bs!9308 () Bool)

(assert (= bs!9308 d!38460))

(declare-fun m!180673 () Bool)

(assert (=> bs!9308 m!180673))

(assert (=> b!119485 d!38460))

(declare-fun d!38462 () Bool)

(assert (=> d!38462 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184894)))) ((_ sign_extend 32) (currentByte!5511 (_2!5271 lt!184887))) ((_ sign_extend 32) (currentBit!5506 (_2!5271 lt!184887))) lt!184904) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184894)))) ((_ sign_extend 32) (currentByte!5511 (_2!5271 lt!184887))) ((_ sign_extend 32) (currentBit!5506 (_2!5271 lt!184887)))) lt!184904))))

(declare-fun bs!9309 () Bool)

(assert (= bs!9309 d!38462))

(declare-fun m!180675 () Bool)

(assert (=> bs!9309 m!180675))

(assert (=> b!119485 d!38462))

(declare-fun d!38464 () Bool)

(declare-fun lt!185803 () tuple2!10042)

(assert (=> d!38464 (= lt!185803 (readNLeastSignificantBitsLoop!0 (_1!5273 lt!184896) nBits!396 i!615 lt!184897))))

(assert (=> d!38464 (= (readNLeastSignificantBitsLoopPure!0 (_1!5273 lt!184896) nBits!396 i!615 lt!184897) (tuple2!10019 (_2!5286 lt!185803) (_1!5286 lt!185803)))))

(declare-fun bs!9310 () Bool)

(assert (= bs!9310 d!38464))

(declare-fun m!180677 () Bool)

(assert (=> bs!9310 m!180677))

(assert (=> b!119485 d!38464))

(declare-fun b!119805 () Bool)

(declare-fun e!78481 () Bool)

(declare-fun lt!185820 () tuple2!10014)

(declare-fun lt!185819 () tuple2!10012)

(assert (=> b!119805 (= e!78481 (= (bitIndex!0 (size!2419 (buf!2844 (_1!5272 lt!185820))) (currentByte!5511 (_1!5272 lt!185820)) (currentBit!5506 (_1!5272 lt!185820))) (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!185819))) (currentByte!5511 (_2!5271 lt!185819)) (currentBit!5506 (_2!5271 lt!185819)))))))

(declare-fun b!119802 () Bool)

(declare-fun res!99162 () Bool)

(declare-fun e!78482 () Bool)

(assert (=> b!119802 (=> (not res!99162) (not e!78482))))

(declare-fun lt!185818 () (_ BitVec 64))

(declare-fun lt!185817 () (_ BitVec 64))

(assert (=> b!119802 (= res!99162 (= (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!185819))) (currentByte!5511 (_2!5271 lt!185819)) (currentBit!5506 (_2!5271 lt!185819))) (bvadd lt!185818 lt!185817)))))

(assert (=> b!119802 (or (not (= (bvand lt!185818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185817 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!185818 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!185818 lt!185817) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119802 (= lt!185817 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!119802 (= lt!185818 (bitIndex!0 (size!2419 (buf!2844 thiss!1305)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305)))))

(declare-fun d!38466 () Bool)

(assert (=> d!38466 e!78482))

(declare-fun res!99163 () Bool)

(assert (=> d!38466 (=> (not res!99163) (not e!78482))))

(assert (=> d!38466 (= res!99163 (= (size!2419 (buf!2844 thiss!1305)) (size!2419 (buf!2844 (_2!5271 lt!185819)))))))

(declare-fun choose!16 (BitStream!4312 Bool) tuple2!10012)

(assert (=> d!38466 (= lt!185819 (choose!16 thiss!1305 lt!184903))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!38466 (validate_offset_bit!0 ((_ sign_extend 32) (size!2419 (buf!2844 thiss!1305))) ((_ sign_extend 32) (currentByte!5511 thiss!1305)) ((_ sign_extend 32) (currentBit!5506 thiss!1305)))))

(assert (=> d!38466 (= (appendBit!0 thiss!1305 lt!184903) lt!185819)))

(declare-fun b!119803 () Bool)

(declare-fun res!99165 () Bool)

(assert (=> b!119803 (=> (not res!99165) (not e!78482))))

(assert (=> b!119803 (= res!99165 (isPrefixOf!0 thiss!1305 (_2!5271 lt!185819)))))

(declare-fun b!119804 () Bool)

(assert (=> b!119804 (= e!78482 e!78481)))

(declare-fun res!99164 () Bool)

(assert (=> b!119804 (=> (not res!99164) (not e!78481))))

(assert (=> b!119804 (= res!99164 (and (= (_2!5272 lt!185820) lt!184903) (= (_1!5272 lt!185820) (_2!5271 lt!185819))))))

(assert (=> b!119804 (= lt!185820 (readBitPure!0 (readerFrom!0 (_2!5271 lt!185819) (currentBit!5506 thiss!1305) (currentByte!5511 thiss!1305))))))

(assert (= (and d!38466 res!99163) b!119802))

(assert (= (and b!119802 res!99162) b!119803))

(assert (= (and b!119803 res!99165) b!119804))

(assert (= (and b!119804 res!99164) b!119805))

(declare-fun m!180685 () Bool)

(assert (=> d!38466 m!180685))

(declare-fun m!180687 () Bool)

(assert (=> d!38466 m!180687))

(declare-fun m!180689 () Bool)

(assert (=> b!119805 m!180689))

(declare-fun m!180691 () Bool)

(assert (=> b!119805 m!180691))

(declare-fun m!180693 () Bool)

(assert (=> b!119803 m!180693))

(declare-fun m!180695 () Bool)

(assert (=> b!119804 m!180695))

(assert (=> b!119804 m!180695))

(declare-fun m!180697 () Bool)

(assert (=> b!119804 m!180697))

(assert (=> b!119802 m!180691))

(assert (=> b!119802 m!179987))

(assert (=> b!119485 d!38466))

(declare-fun lt!185839 () (_ BitVec 64))

(declare-fun lt!185828 () tuple2!10016)

(declare-fun lt!185832 () (_ BitVec 64))

(declare-fun e!78484 () Bool)

(declare-fun b!119806 () Bool)

(assert (=> b!119806 (= e!78484 (= (_1!5273 lt!185828) (withMovedBitIndex!0 (_2!5273 lt!185828) (bvsub lt!185832 lt!185839))))))

(assert (=> b!119806 (or (= (bvand lt!185832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185839 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185832 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185832 lt!185839) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!119806 (= lt!185839 (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184894))) (currentByte!5511 (_2!5271 lt!184894)) (currentBit!5506 (_2!5271 lt!184894))))))

(assert (=> b!119806 (= lt!185832 (bitIndex!0 (size!2419 (buf!2844 thiss!1305)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305)))))

(declare-fun d!38474 () Bool)

(assert (=> d!38474 e!78484))

(declare-fun res!99167 () Bool)

(assert (=> d!38474 (=> (not res!99167) (not e!78484))))

(assert (=> d!38474 (= res!99167 (isPrefixOf!0 (_1!5273 lt!185828) (_2!5273 lt!185828)))))

(declare-fun lt!185833 () BitStream!4312)

(assert (=> d!38474 (= lt!185828 (tuple2!10017 lt!185833 (_2!5271 lt!184894)))))

(declare-fun lt!185829 () Unit!7357)

(declare-fun lt!185834 () Unit!7357)

(assert (=> d!38474 (= lt!185829 lt!185834)))

(assert (=> d!38474 (isPrefixOf!0 lt!185833 (_2!5271 lt!184894))))

(assert (=> d!38474 (= lt!185834 (lemmaIsPrefixTransitive!0 lt!185833 (_2!5271 lt!184894) (_2!5271 lt!184894)))))

(declare-fun lt!185831 () Unit!7357)

(declare-fun lt!185824 () Unit!7357)

(assert (=> d!38474 (= lt!185831 lt!185824)))

(assert (=> d!38474 (isPrefixOf!0 lt!185833 (_2!5271 lt!184894))))

(assert (=> d!38474 (= lt!185824 (lemmaIsPrefixTransitive!0 lt!185833 thiss!1305 (_2!5271 lt!184894)))))

(declare-fun lt!185826 () Unit!7357)

(declare-fun e!78483 () Unit!7357)

(assert (=> d!38474 (= lt!185826 e!78483)))

(declare-fun c!7206 () Bool)

(assert (=> d!38474 (= c!7206 (not (= (size!2419 (buf!2844 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!185823 () Unit!7357)

(declare-fun lt!185830 () Unit!7357)

(assert (=> d!38474 (= lt!185823 lt!185830)))

(assert (=> d!38474 (isPrefixOf!0 (_2!5271 lt!184894) (_2!5271 lt!184894))))

(assert (=> d!38474 (= lt!185830 (lemmaIsPrefixRefl!0 (_2!5271 lt!184894)))))

(declare-fun lt!185825 () Unit!7357)

(declare-fun lt!185840 () Unit!7357)

(assert (=> d!38474 (= lt!185825 lt!185840)))

(assert (=> d!38474 (= lt!185840 (lemmaIsPrefixRefl!0 (_2!5271 lt!184894)))))

(declare-fun lt!185837 () Unit!7357)

(declare-fun lt!185835 () Unit!7357)

(assert (=> d!38474 (= lt!185837 lt!185835)))

(assert (=> d!38474 (isPrefixOf!0 lt!185833 lt!185833)))

(assert (=> d!38474 (= lt!185835 (lemmaIsPrefixRefl!0 lt!185833))))

(declare-fun lt!185827 () Unit!7357)

(declare-fun lt!185838 () Unit!7357)

(assert (=> d!38474 (= lt!185827 lt!185838)))

(assert (=> d!38474 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!38474 (= lt!185838 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!38474 (= lt!185833 (BitStream!4313 (buf!2844 (_2!5271 lt!184894)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305)))))

(assert (=> d!38474 (isPrefixOf!0 thiss!1305 (_2!5271 lt!184894))))

(assert (=> d!38474 (= (reader!0 thiss!1305 (_2!5271 lt!184894)) lt!185828)))

(declare-fun b!119807 () Bool)

(declare-fun lt!185821 () Unit!7357)

(assert (=> b!119807 (= e!78483 lt!185821)))

(declare-fun lt!185822 () (_ BitVec 64))

(assert (=> b!119807 (= lt!185822 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!185836 () (_ BitVec 64))

(assert (=> b!119807 (= lt!185836 (bitIndex!0 (size!2419 (buf!2844 thiss!1305)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305)))))

(assert (=> b!119807 (= lt!185821 (arrayBitRangesEqSymmetric!0 (buf!2844 thiss!1305) (buf!2844 (_2!5271 lt!184894)) lt!185822 lt!185836))))

(assert (=> b!119807 (arrayBitRangesEq!0 (buf!2844 (_2!5271 lt!184894)) (buf!2844 thiss!1305) lt!185822 lt!185836)))

(declare-fun b!119808 () Bool)

(declare-fun res!99168 () Bool)

(assert (=> b!119808 (=> (not res!99168) (not e!78484))))

(assert (=> b!119808 (= res!99168 (isPrefixOf!0 (_1!5273 lt!185828) thiss!1305))))

(declare-fun b!119809 () Bool)

(declare-fun Unit!7382 () Unit!7357)

(assert (=> b!119809 (= e!78483 Unit!7382)))

(declare-fun b!119810 () Bool)

(declare-fun res!99166 () Bool)

(assert (=> b!119810 (=> (not res!99166) (not e!78484))))

(assert (=> b!119810 (= res!99166 (isPrefixOf!0 (_2!5273 lt!185828) (_2!5271 lt!184894)))))

(assert (= (and d!38474 c!7206) b!119807))

(assert (= (and d!38474 (not c!7206)) b!119809))

(assert (= (and d!38474 res!99167) b!119808))

(assert (= (and b!119808 res!99168) b!119810))

(assert (= (and b!119810 res!99166) b!119806))

(declare-fun m!180699 () Bool)

(assert (=> b!119810 m!180699))

(assert (=> b!119807 m!179987))

(declare-fun m!180701 () Bool)

(assert (=> b!119807 m!180701))

(declare-fun m!180703 () Bool)

(assert (=> b!119807 m!180703))

(declare-fun m!180705 () Bool)

(assert (=> d!38474 m!180705))

(declare-fun m!180707 () Bool)

(assert (=> d!38474 m!180707))

(assert (=> d!38474 m!180031))

(assert (=> d!38474 m!180371))

(declare-fun m!180709 () Bool)

(assert (=> d!38474 m!180709))

(assert (=> d!38474 m!180375))

(declare-fun m!180711 () Bool)

(assert (=> d!38474 m!180711))

(declare-fun m!180713 () Bool)

(assert (=> d!38474 m!180713))

(declare-fun m!180715 () Bool)

(assert (=> d!38474 m!180715))

(declare-fun m!180717 () Bool)

(assert (=> d!38474 m!180717))

(declare-fun m!180719 () Bool)

(assert (=> d!38474 m!180719))

(declare-fun m!180721 () Bool)

(assert (=> b!119806 m!180721))

(assert (=> b!119806 m!179989))

(assert (=> b!119806 m!179987))

(declare-fun m!180723 () Bool)

(assert (=> b!119808 m!180723))

(assert (=> b!119485 d!38474))

(declare-fun d!38476 () Bool)

(declare-fun res!99175 () Bool)

(declare-fun e!78489 () Bool)

(assert (=> d!38476 (=> (not res!99175) (not e!78489))))

(assert (=> d!38476 (= res!99175 (= (size!2419 (buf!2844 thiss!1305)) (size!2419 (buf!2844 (_2!5271 lt!184894)))))))

(assert (=> d!38476 (= (isPrefixOf!0 thiss!1305 (_2!5271 lt!184894)) e!78489)))

(declare-fun b!119817 () Bool)

(declare-fun res!99176 () Bool)

(assert (=> b!119817 (=> (not res!99176) (not e!78489))))

(assert (=> b!119817 (= res!99176 (bvsle (bitIndex!0 (size!2419 (buf!2844 thiss!1305)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305)) (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184894))) (currentByte!5511 (_2!5271 lt!184894)) (currentBit!5506 (_2!5271 lt!184894)))))))

(declare-fun b!119818 () Bool)

(declare-fun e!78490 () Bool)

(assert (=> b!119818 (= e!78489 e!78490)))

(declare-fun res!99177 () Bool)

(assert (=> b!119818 (=> res!99177 e!78490)))

(assert (=> b!119818 (= res!99177 (= (size!2419 (buf!2844 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!119819 () Bool)

(assert (=> b!119819 (= e!78490 (arrayBitRangesEq!0 (buf!2844 thiss!1305) (buf!2844 (_2!5271 lt!184894)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2419 (buf!2844 thiss!1305)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305))))))

(assert (= (and d!38476 res!99175) b!119817))

(assert (= (and b!119817 res!99176) b!119818))

(assert (= (and b!119818 (not res!99177)) b!119819))

(assert (=> b!119817 m!179987))

(assert (=> b!119817 m!179989))

(assert (=> b!119819 m!179987))

(assert (=> b!119819 m!179987))

(declare-fun m!180725 () Bool)

(assert (=> b!119819 m!180725))

(assert (=> b!119485 d!38476))

(declare-fun d!38478 () Bool)

(declare-fun res!99178 () Bool)

(declare-fun e!78493 () Bool)

(assert (=> d!38478 (=> (not res!99178) (not e!78493))))

(assert (=> d!38478 (= res!99178 (= (size!2419 (buf!2844 thiss!1305)) (size!2419 (buf!2844 (_2!5271 lt!184887)))))))

(assert (=> d!38478 (= (isPrefixOf!0 thiss!1305 (_2!5271 lt!184887)) e!78493)))

(declare-fun b!119824 () Bool)

(declare-fun res!99179 () Bool)

(assert (=> b!119824 (=> (not res!99179) (not e!78493))))

(assert (=> b!119824 (= res!99179 (bvsle (bitIndex!0 (size!2419 (buf!2844 thiss!1305)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305)) (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184887))) (currentByte!5511 (_2!5271 lt!184887)) (currentBit!5506 (_2!5271 lt!184887)))))))

(declare-fun b!119825 () Bool)

(declare-fun e!78494 () Bool)

(assert (=> b!119825 (= e!78493 e!78494)))

(declare-fun res!99180 () Bool)

(assert (=> b!119825 (=> res!99180 e!78494)))

(assert (=> b!119825 (= res!99180 (= (size!2419 (buf!2844 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!119826 () Bool)

(assert (=> b!119826 (= e!78494 (arrayBitRangesEq!0 (buf!2844 thiss!1305) (buf!2844 (_2!5271 lt!184887)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2419 (buf!2844 thiss!1305)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305))))))

(assert (= (and d!38478 res!99178) b!119824))

(assert (= (and b!119824 res!99179) b!119825))

(assert (= (and b!119825 (not res!99180)) b!119826))

(assert (=> b!119824 m!179987))

(assert (=> b!119824 m!179991))

(assert (=> b!119826 m!179987))

(assert (=> b!119826 m!179987))

(declare-fun m!180727 () Bool)

(assert (=> b!119826 m!180727))

(assert (=> b!119484 d!38478))

(declare-fun d!38480 () Bool)

(declare-fun e!78501 () Bool)

(assert (=> d!38480 e!78501))

(declare-fun res!99192 () Bool)

(assert (=> d!38480 (=> (not res!99192) (not e!78501))))

(declare-fun lt!185906 () (_ BitVec 64))

(declare-fun lt!185905 () BitStream!4312)

(assert (=> d!38480 (= res!99192 (= (bvadd lt!185906 (bvsub lt!184909 lt!184890)) (bitIndex!0 (size!2419 (buf!2844 lt!185905)) (currentByte!5511 lt!185905) (currentBit!5506 lt!185905))))))

(assert (=> d!38480 (or (not (= (bvand lt!185906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!184909 lt!184890) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!185906 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!185906 (bvsub lt!184909 lt!184890)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38480 (= lt!185906 (bitIndex!0 (size!2419 (buf!2844 (_2!5273 lt!184896))) (currentByte!5511 (_2!5273 lt!184896)) (currentBit!5506 (_2!5273 lt!184896))))))

(declare-fun moveBitIndex!0 (BitStream!4312 (_ BitVec 64)) tuple2!10012)

(assert (=> d!38480 (= lt!185905 (_2!5271 (moveBitIndex!0 (_2!5273 lt!184896) (bvsub lt!184909 lt!184890))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4312 (_ BitVec 64)) Bool)

(assert (=> d!38480 (moveBitIndexPrecond!0 (_2!5273 lt!184896) (bvsub lt!184909 lt!184890))))

(assert (=> d!38480 (= (withMovedBitIndex!0 (_2!5273 lt!184896) (bvsub lt!184909 lt!184890)) lt!185905)))

(declare-fun b!119840 () Bool)

(assert (=> b!119840 (= e!78501 (= (size!2419 (buf!2844 (_2!5273 lt!184896))) (size!2419 (buf!2844 lt!185905))))))

(assert (= (and d!38480 res!99192) b!119840))

(declare-fun m!180763 () Bool)

(assert (=> d!38480 m!180763))

(declare-fun m!180765 () Bool)

(assert (=> d!38480 m!180765))

(declare-fun m!180767 () Bool)

(assert (=> d!38480 m!180767))

(declare-fun m!180769 () Bool)

(assert (=> d!38480 m!180769))

(assert (=> b!119488 d!38480))

(declare-fun d!38488 () Bool)

(declare-fun e!78502 () Bool)

(assert (=> d!38488 e!78502))

(declare-fun res!99194 () Bool)

(assert (=> d!38488 (=> (not res!99194) (not e!78502))))

(declare-fun lt!185908 () (_ BitVec 64))

(declare-fun lt!185911 () (_ BitVec 64))

(declare-fun lt!185912 () (_ BitVec 64))

(assert (=> d!38488 (= res!99194 (= lt!185908 (bvsub lt!185912 lt!185911)))))

(assert (=> d!38488 (or (= (bvand lt!185912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185911 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185912 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185912 lt!185911) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38488 (= lt!185911 (remainingBits!0 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184894)))) ((_ sign_extend 32) (currentByte!5511 (_2!5271 lt!184894))) ((_ sign_extend 32) (currentBit!5506 (_2!5271 lt!184894)))))))

(declare-fun lt!185907 () (_ BitVec 64))

(declare-fun lt!185910 () (_ BitVec 64))

(assert (=> d!38488 (= lt!185912 (bvmul lt!185907 lt!185910))))

(assert (=> d!38488 (or (= lt!185907 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!185910 (bvsdiv (bvmul lt!185907 lt!185910) lt!185907)))))

(assert (=> d!38488 (= lt!185910 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38488 (= lt!185907 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184894)))))))

(assert (=> d!38488 (= lt!185908 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5511 (_2!5271 lt!184894))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5506 (_2!5271 lt!184894)))))))

(assert (=> d!38488 (invariant!0 (currentBit!5506 (_2!5271 lt!184894)) (currentByte!5511 (_2!5271 lt!184894)) (size!2419 (buf!2844 (_2!5271 lt!184894))))))

(assert (=> d!38488 (= (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184894))) (currentByte!5511 (_2!5271 lt!184894)) (currentBit!5506 (_2!5271 lt!184894))) lt!185908)))

(declare-fun b!119841 () Bool)

(declare-fun res!99193 () Bool)

(assert (=> b!119841 (=> (not res!99193) (not e!78502))))

(assert (=> b!119841 (= res!99193 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!185908))))

(declare-fun b!119842 () Bool)

(declare-fun lt!185909 () (_ BitVec 64))

(assert (=> b!119842 (= e!78502 (bvsle lt!185908 (bvmul lt!185909 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119842 (or (= lt!185909 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!185909 #b0000000000000000000000000000000000000000000000000000000000001000) lt!185909)))))

(assert (=> b!119842 (= lt!185909 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184894)))))))

(assert (= (and d!38488 res!99194) b!119841))

(assert (= (and b!119841 res!99193) b!119842))

(declare-fun m!180771 () Bool)

(assert (=> d!38488 m!180771))

(declare-fun m!180773 () Bool)

(assert (=> d!38488 m!180773))

(assert (=> b!119488 d!38488))

(declare-fun lt!185913 () tuple2!10042)

(declare-fun d!38490 () Bool)

(assert (=> d!38490 (= lt!185913 (readNLeastSignificantBitsLoop!0 (withMovedBitIndex!0 (_1!5273 lt!184896) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184892))))

(assert (=> d!38490 (= (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5273 lt!184896) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!184892) (tuple2!10019 (_2!5286 lt!185913) (_1!5286 lt!185913)))))

(declare-fun bs!9315 () Bool)

(assert (= bs!9315 d!38490))

(assert (=> bs!9315 m!179983))

(declare-fun m!180775 () Bool)

(assert (=> bs!9315 m!180775))

(assert (=> b!119488 d!38490))

(declare-fun d!38492 () Bool)

(declare-fun e!78503 () Bool)

(assert (=> d!38492 e!78503))

(declare-fun res!99196 () Bool)

(assert (=> d!38492 (=> (not res!99196) (not e!78503))))

(declare-fun lt!185918 () (_ BitVec 64))

(declare-fun lt!185915 () (_ BitVec 64))

(declare-fun lt!185919 () (_ BitVec 64))

(assert (=> d!38492 (= res!99196 (= lt!185915 (bvsub lt!185919 lt!185918)))))

(assert (=> d!38492 (or (= (bvand lt!185919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185918 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185919 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185919 lt!185918) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38492 (= lt!185918 (remainingBits!0 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184887)))) ((_ sign_extend 32) (currentByte!5511 (_2!5271 lt!184887))) ((_ sign_extend 32) (currentBit!5506 (_2!5271 lt!184887)))))))

(declare-fun lt!185914 () (_ BitVec 64))

(declare-fun lt!185917 () (_ BitVec 64))

(assert (=> d!38492 (= lt!185919 (bvmul lt!185914 lt!185917))))

(assert (=> d!38492 (or (= lt!185914 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!185917 (bvsdiv (bvmul lt!185914 lt!185917) lt!185914)))))

(assert (=> d!38492 (= lt!185917 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38492 (= lt!185914 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184887)))))))

(assert (=> d!38492 (= lt!185915 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5511 (_2!5271 lt!184887))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5506 (_2!5271 lt!184887)))))))

(assert (=> d!38492 (invariant!0 (currentBit!5506 (_2!5271 lt!184887)) (currentByte!5511 (_2!5271 lt!184887)) (size!2419 (buf!2844 (_2!5271 lt!184887))))))

(assert (=> d!38492 (= (bitIndex!0 (size!2419 (buf!2844 (_2!5271 lt!184887))) (currentByte!5511 (_2!5271 lt!184887)) (currentBit!5506 (_2!5271 lt!184887))) lt!185915)))

(declare-fun b!119843 () Bool)

(declare-fun res!99195 () Bool)

(assert (=> b!119843 (=> (not res!99195) (not e!78503))))

(assert (=> b!119843 (= res!99195 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!185915))))

(declare-fun b!119844 () Bool)

(declare-fun lt!185916 () (_ BitVec 64))

(assert (=> b!119844 (= e!78503 (bvsle lt!185915 (bvmul lt!185916 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119844 (or (= lt!185916 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!185916 #b0000000000000000000000000000000000000000000000000000000000001000) lt!185916)))))

(assert (=> b!119844 (= lt!185916 ((_ sign_extend 32) (size!2419 (buf!2844 (_2!5271 lt!184887)))))))

(assert (= (and d!38492 res!99196) b!119843))

(assert (= (and b!119843 res!99195) b!119844))

(declare-fun m!180777 () Bool)

(assert (=> d!38492 m!180777))

(assert (=> d!38492 m!180261))

(assert (=> b!119488 d!38492))

(declare-fun d!38494 () Bool)

(declare-fun lt!185953 () tuple2!10018)

(declare-fun lt!185954 () tuple2!10018)

(assert (=> d!38494 (and (= (_2!5274 lt!185953) (_2!5274 lt!185954)) (= (_1!5274 lt!185953) (_1!5274 lt!185954)))))

(declare-fun lt!185958 () BitStream!4312)

(declare-fun lt!185957 () Unit!7357)

(declare-fun lt!185956 () Bool)

(declare-fun lt!185955 () (_ BitVec 64))

(declare-fun choose!45 (BitStream!4312 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10018 tuple2!10018 BitStream!4312 (_ BitVec 64) Bool BitStream!4312 (_ BitVec 64) tuple2!10018 tuple2!10018 BitStream!4312 (_ BitVec 64)) Unit!7357)

(assert (=> d!38494 (= lt!185957 (choose!45 (_1!5273 lt!184896) nBits!396 i!615 lt!184897 lt!185953 (tuple2!10019 (_1!5274 lt!185953) (_2!5274 lt!185953)) (_1!5274 lt!185953) (_2!5274 lt!185953) lt!185956 lt!185958 lt!185955 lt!185954 (tuple2!10019 (_1!5274 lt!185954) (_2!5274 lt!185954)) (_1!5274 lt!185954) (_2!5274 lt!185954)))))

(assert (=> d!38494 (= lt!185954 (readNLeastSignificantBitsLoopPure!0 lt!185958 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!185955))))

(assert (=> d!38494 (= lt!185955 (bvor lt!184897 (ite lt!185956 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38494 (= lt!185958 (withMovedBitIndex!0 (_1!5273 lt!184896) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!38494 (= lt!185956 (_2!5272 (readBitPure!0 (_1!5273 lt!184896))))))

(assert (=> d!38494 (= lt!185953 (readNLeastSignificantBitsLoopPure!0 (_1!5273 lt!184896) nBits!396 i!615 lt!184897))))

(assert (=> d!38494 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5273 lt!184896) nBits!396 i!615 lt!184897) lt!185957)))

(declare-fun bs!9318 () Bool)

(assert (= bs!9318 d!38494))

(assert (=> bs!9318 m!180007))

(declare-fun m!180785 () Bool)

(assert (=> bs!9318 m!180785))

(declare-fun m!180787 () Bool)

(assert (=> bs!9318 m!180787))

(assert (=> bs!9318 m!179983))

(assert (=> bs!9318 m!180013))

(assert (=> b!119488 d!38494))

(declare-fun d!38500 () Bool)

(declare-fun e!78507 () Bool)

(assert (=> d!38500 e!78507))

(declare-fun res!99203 () Bool)

(assert (=> d!38500 (=> (not res!99203) (not e!78507))))

(declare-fun lt!185960 () (_ BitVec 64))

(declare-fun lt!185959 () BitStream!4312)

(assert (=> d!38500 (= res!99203 (= (bvadd lt!185960 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2419 (buf!2844 lt!185959)) (currentByte!5511 lt!185959) (currentBit!5506 lt!185959))))))

(assert (=> d!38500 (or (not (= (bvand lt!185960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!185960 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!185960 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38500 (= lt!185960 (bitIndex!0 (size!2419 (buf!2844 (_1!5273 lt!184896))) (currentByte!5511 (_1!5273 lt!184896)) (currentBit!5506 (_1!5273 lt!184896))))))

(assert (=> d!38500 (= lt!185959 (_2!5271 (moveBitIndex!0 (_1!5273 lt!184896) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!38500 (moveBitIndexPrecond!0 (_1!5273 lt!184896) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!38500 (= (withMovedBitIndex!0 (_1!5273 lt!184896) #b0000000000000000000000000000000000000000000000000000000000000001) lt!185959)))

(declare-fun b!119851 () Bool)

(assert (=> b!119851 (= e!78507 (= (size!2419 (buf!2844 (_1!5273 lt!184896))) (size!2419 (buf!2844 lt!185959))))))

(assert (= (and d!38500 res!99203) b!119851))

(declare-fun m!180789 () Bool)

(assert (=> d!38500 m!180789))

(declare-fun m!180791 () Bool)

(assert (=> d!38500 m!180791))

(declare-fun m!180793 () Bool)

(assert (=> d!38500 m!180793))

(declare-fun m!180795 () Bool)

(assert (=> d!38500 m!180795))

(assert (=> b!119488 d!38500))

(declare-fun d!38502 () Bool)

(declare-fun e!78508 () Bool)

(assert (=> d!38502 e!78508))

(declare-fun res!99205 () Bool)

(assert (=> d!38502 (=> (not res!99205) (not e!78508))))

(declare-fun lt!185966 () (_ BitVec 64))

(declare-fun lt!185965 () (_ BitVec 64))

(declare-fun lt!185962 () (_ BitVec 64))

(assert (=> d!38502 (= res!99205 (= lt!185962 (bvsub lt!185966 lt!185965)))))

(assert (=> d!38502 (or (= (bvand lt!185966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185965 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185966 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185966 lt!185965) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38502 (= lt!185965 (remainingBits!0 ((_ sign_extend 32) (size!2419 (buf!2844 thiss!1305))) ((_ sign_extend 32) (currentByte!5511 thiss!1305)) ((_ sign_extend 32) (currentBit!5506 thiss!1305))))))

(declare-fun lt!185961 () (_ BitVec 64))

(declare-fun lt!185964 () (_ BitVec 64))

(assert (=> d!38502 (= lt!185966 (bvmul lt!185961 lt!185964))))

(assert (=> d!38502 (or (= lt!185961 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!185964 (bvsdiv (bvmul lt!185961 lt!185964) lt!185961)))))

(assert (=> d!38502 (= lt!185964 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38502 (= lt!185961 ((_ sign_extend 32) (size!2419 (buf!2844 thiss!1305))))))

(assert (=> d!38502 (= lt!185962 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5511 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5506 thiss!1305))))))

(assert (=> d!38502 (invariant!0 (currentBit!5506 thiss!1305) (currentByte!5511 thiss!1305) (size!2419 (buf!2844 thiss!1305)))))

(assert (=> d!38502 (= (bitIndex!0 (size!2419 (buf!2844 thiss!1305)) (currentByte!5511 thiss!1305) (currentBit!5506 thiss!1305)) lt!185962)))

(declare-fun b!119852 () Bool)

(declare-fun res!99204 () Bool)

(assert (=> b!119852 (=> (not res!99204) (not e!78508))))

(assert (=> b!119852 (= res!99204 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!185962))))

(declare-fun b!119853 () Bool)

(declare-fun lt!185963 () (_ BitVec 64))

(assert (=> b!119853 (= e!78508 (bvsle lt!185962 (bvmul lt!185963 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119853 (or (= lt!185963 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!185963 #b0000000000000000000000000000000000000000000000000000000000001000) lt!185963)))))

(assert (=> b!119853 (= lt!185963 ((_ sign_extend 32) (size!2419 (buf!2844 thiss!1305))))))

(assert (= (and d!38502 res!99205) b!119852))

(assert (= (and b!119852 res!99204) b!119853))

(assert (=> d!38502 m!180255))

(assert (=> d!38502 m!180257))

(assert (=> b!119488 d!38502))

(assert (=> b!119476 d!38492))

(assert (=> b!119476 d!38502))

(declare-fun d!38504 () Bool)

(declare-fun e!78509 () Bool)

(assert (=> d!38504 e!78509))

(declare-fun res!99207 () Bool)

(assert (=> d!38504 (=> (not res!99207) (not e!78509))))

(declare-fun lt!185972 () (_ BitVec 64))

(declare-fun lt!185971 () (_ BitVec 64))

(declare-fun lt!185968 () (_ BitVec 64))

(assert (=> d!38504 (= res!99207 (= lt!185968 (bvsub lt!185972 lt!185971)))))

(assert (=> d!38504 (or (= (bvand lt!185972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!185971 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!185972 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!185972 lt!185971) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!38504 (= lt!185971 (remainingBits!0 ((_ sign_extend 32) (size!2419 (buf!2844 (_1!5272 lt!184905)))) ((_ sign_extend 32) (currentByte!5511 (_1!5272 lt!184905))) ((_ sign_extend 32) (currentBit!5506 (_1!5272 lt!184905)))))))

(declare-fun lt!185967 () (_ BitVec 64))

(declare-fun lt!185970 () (_ BitVec 64))

(assert (=> d!38504 (= lt!185972 (bvmul lt!185967 lt!185970))))

(assert (=> d!38504 (or (= lt!185967 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!185970 (bvsdiv (bvmul lt!185967 lt!185970) lt!185967)))))

(assert (=> d!38504 (= lt!185970 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!38504 (= lt!185967 ((_ sign_extend 32) (size!2419 (buf!2844 (_1!5272 lt!184905)))))))

(assert (=> d!38504 (= lt!185968 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5511 (_1!5272 lt!184905))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5506 (_1!5272 lt!184905)))))))

(assert (=> d!38504 (invariant!0 (currentBit!5506 (_1!5272 lt!184905)) (currentByte!5511 (_1!5272 lt!184905)) (size!2419 (buf!2844 (_1!5272 lt!184905))))))

(assert (=> d!38504 (= (bitIndex!0 (size!2419 (buf!2844 (_1!5272 lt!184905))) (currentByte!5511 (_1!5272 lt!184905)) (currentBit!5506 (_1!5272 lt!184905))) lt!185968)))

(declare-fun b!119854 () Bool)

(declare-fun res!99206 () Bool)

(assert (=> b!119854 (=> (not res!99206) (not e!78509))))

(assert (=> b!119854 (= res!99206 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!185968))))

(declare-fun b!119855 () Bool)

(declare-fun lt!185969 () (_ BitVec 64))

(assert (=> b!119855 (= e!78509 (bvsle lt!185968 (bvmul lt!185969 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!119855 (or (= lt!185969 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!185969 #b0000000000000000000000000000000000000000000000000000000000001000) lt!185969)))))

(assert (=> b!119855 (= lt!185969 ((_ sign_extend 32) (size!2419 (buf!2844 (_1!5272 lt!184905)))))))

(assert (= (and d!38504 res!99207) b!119854))

(assert (= (and b!119854 res!99206) b!119855))

(declare-fun m!180797 () Bool)

(assert (=> d!38504 m!180797))

(declare-fun m!180799 () Bool)

(assert (=> d!38504 m!180799))

(assert (=> b!119487 d!38504))

(push 1)

(assert (not b!119735))

(assert (not b!119806))

(assert (not d!38492))

(assert (not b!119653))

(assert (not d!38446))

(assert (not d!38500))

(assert (not b!119808))

(assert (not d!38396))

(assert (not d!38460))

(assert (not d!38480))

(assert (not b!119736))

(assert (not b!119810))

(assert (not b!119743))

(assert (not d!38444))

(assert (not b!119655))

(assert (not b!119817))

(assert (not d!38458))

(assert (not b!119807))

(assert (not b!119620))

(assert (not b!119744))

(assert (not d!38380))

(assert (not b!119740))

(assert (not b!119803))

(assert (not b!119741))

(assert (not d!38462))

(assert (not d!38456))

(assert (not d!38392))

(assert (not d!38466))

(assert (not d!38488))

(assert (not d!38436))

(assert (not b!119804))

(assert (not b!119739))

(assert (not d!38430))

(assert (not bm!1556))

(assert (not d!38384))

(assert (not d!38504))

(assert (not d!38448))

(assert (not d!38390))

(assert (not d!38502))

(assert (not d!38474))

(assert (not b!119651))

(assert (not b!119819))

(assert (not d!38490))

(assert (not b!119652))

(assert (not d!38464))

(assert (not b!119802))

(assert (not d!38432))

(assert (not b!119747))

(assert (not b!119737))

(assert (not d!38438))

(assert (not d!38434))

(assert (not b!119826))

(assert (not b!119805))

(assert (not d!38494))

(assert (not b!119745))

(assert (not b!119824))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

