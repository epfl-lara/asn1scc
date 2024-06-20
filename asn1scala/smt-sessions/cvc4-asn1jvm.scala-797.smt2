; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!23004 () Bool)

(assert start!23004)

(declare-fun b!116810 () Bool)

(declare-fun e!76602 () Bool)

(declare-fun e!76599 () Bool)

(assert (=> b!116810 (= e!76602 e!76599)))

(declare-fun res!96615 () Bool)

(assert (=> b!116810 (=> (not res!96615) (not e!76599))))

(declare-fun lt!178458 () (_ BitVec 64))

(declare-fun lt!178463 () (_ BitVec 64))

(assert (=> b!116810 (= res!96615 (= lt!178458 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!178463)))))

(declare-datatypes ((array!5268 0))(
  ( (array!5269 (arr!2984 (Array (_ BitVec 32) (_ BitVec 8))) (size!2391 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4256 0))(
  ( (BitStream!4257 (buf!2801 array!5268) (currentByte!5438 (_ BitVec 32)) (currentBit!5433 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!7187 0))(
  ( (Unit!7188) )
))
(declare-datatypes ((tuple2!9728 0))(
  ( (tuple2!9729 (_1!5129 Unit!7187) (_2!5129 BitStream!4256)) )
))
(declare-fun lt!178465 () tuple2!9728)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116810 (= lt!178458 (bitIndex!0 (size!2391 (buf!2801 (_2!5129 lt!178465))) (currentByte!5438 (_2!5129 lt!178465)) (currentBit!5433 (_2!5129 lt!178465))))))

(declare-fun thiss!1305 () BitStream!4256)

(assert (=> b!116810 (= lt!178463 (bitIndex!0 (size!2391 (buf!2801 thiss!1305)) (currentByte!5438 thiss!1305) (currentBit!5433 thiss!1305)))))

(declare-fun b!116811 () Bool)

(declare-fun res!96614 () Bool)

(declare-fun e!76598 () Bool)

(assert (=> b!116811 (=> (not res!96614) (not e!76598))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!116811 (= res!96614 (invariant!0 (currentBit!5433 thiss!1305) (currentByte!5438 thiss!1305) (size!2391 (buf!2801 (_2!5129 lt!178465)))))))

(declare-fun b!116812 () Bool)

(declare-fun e!76601 () Bool)

(declare-datatypes ((tuple2!9730 0))(
  ( (tuple2!9731 (_1!5130 BitStream!4256) (_2!5130 Bool)) )
))
(declare-fun lt!178460 () tuple2!9730)

(assert (=> b!116812 (= e!76601 (= (bitIndex!0 (size!2391 (buf!2801 (_1!5130 lt!178460))) (currentByte!5438 (_1!5130 lt!178460)) (currentBit!5433 (_1!5130 lt!178460))) lt!178458))))

(declare-fun res!96612 () Bool)

(declare-fun e!76600 () Bool)

(assert (=> start!23004 (=> (not res!96612) (not e!76600))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!23004 (= res!96612 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!23004 e!76600))

(assert (=> start!23004 true))

(declare-fun e!76594 () Bool)

(declare-fun inv!12 (BitStream!4256) Bool)

(assert (=> start!23004 (and (inv!12 thiss!1305) e!76594)))

(declare-fun b!116813 () Bool)

(declare-fun e!76595 () Bool)

(assert (=> b!116813 (= e!76600 e!76595)))

(declare-fun res!96619 () Bool)

(assert (=> b!116813 (=> (not res!96619) (not e!76595))))

(declare-fun lt!178470 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116813 (= res!96619 (validate_offset_bits!1 ((_ sign_extend 32) (size!2391 (buf!2801 thiss!1305))) ((_ sign_extend 32) (currentByte!5438 thiss!1305)) ((_ sign_extend 32) (currentBit!5433 thiss!1305)) lt!178470))))

(assert (=> b!116813 (= lt!178470 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!116814 () Bool)

(declare-fun e!76597 () Bool)

(declare-fun lt!178469 () tuple2!9730)

(declare-fun lt!178468 () tuple2!9730)

(assert (=> b!116814 (= e!76597 (= (_2!5130 lt!178469) (_2!5130 lt!178468)))))

(declare-fun b!116815 () Bool)

(declare-fun lt!178464 () tuple2!9728)

(assert (=> b!116815 (= e!76595 (not (= (size!2391 (buf!2801 (_2!5129 lt!178465))) (size!2391 (buf!2801 (_2!5129 lt!178464))))))))

(declare-fun v!199 () (_ BitVec 64))

(declare-datatypes ((tuple2!9732 0))(
  ( (tuple2!9733 (_1!5131 BitStream!4256) (_2!5131 (_ BitVec 64))) )
))
(declare-fun lt!178466 () tuple2!9732)

(declare-datatypes ((tuple2!9734 0))(
  ( (tuple2!9735 (_1!5132 BitStream!4256) (_2!5132 BitStream!4256)) )
))
(declare-fun lt!178456 () tuple2!9734)

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9732)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!116815 (= lt!178466 (readNLeastSignificantBitsLoopPure!0 (_1!5132 lt!178456) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> b!116815 (validate_offset_bits!1 ((_ sign_extend 32) (size!2391 (buf!2801 (_2!5129 lt!178464)))) ((_ sign_extend 32) (currentByte!5438 thiss!1305)) ((_ sign_extend 32) (currentBit!5433 thiss!1305)) lt!178470)))

(declare-fun lt!178462 () Unit!7187)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4256 array!5268 (_ BitVec 64)) Unit!7187)

(assert (=> b!116815 (= lt!178462 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2801 (_2!5129 lt!178464)) lt!178470))))

(declare-fun lt!178455 () Bool)

(declare-fun readBitPure!0 (BitStream!4256) tuple2!9730)

(assert (=> b!116815 (= (_2!5130 (readBitPure!0 (_1!5132 lt!178456))) lt!178455)))

(declare-fun lt!178457 () tuple2!9734)

(declare-fun reader!0 (BitStream!4256 BitStream!4256) tuple2!9734)

(assert (=> b!116815 (= lt!178457 (reader!0 (_2!5129 lt!178465) (_2!5129 lt!178464)))))

(assert (=> b!116815 (= lt!178456 (reader!0 thiss!1305 (_2!5129 lt!178464)))))

(assert (=> b!116815 e!76597))

(declare-fun res!96617 () Bool)

(assert (=> b!116815 (=> (not res!96617) (not e!76597))))

(assert (=> b!116815 (= res!96617 (= (bitIndex!0 (size!2391 (buf!2801 (_1!5130 lt!178469))) (currentByte!5438 (_1!5130 lt!178469)) (currentBit!5433 (_1!5130 lt!178469))) (bitIndex!0 (size!2391 (buf!2801 (_1!5130 lt!178468))) (currentByte!5438 (_1!5130 lt!178468)) (currentBit!5433 (_1!5130 lt!178468)))))))

(declare-fun lt!178467 () Unit!7187)

(declare-fun lt!178461 () BitStream!4256)

(declare-fun readBitPrefixLemma!0 (BitStream!4256 BitStream!4256) Unit!7187)

(assert (=> b!116815 (= lt!178467 (readBitPrefixLemma!0 lt!178461 (_2!5129 lt!178464)))))

(assert (=> b!116815 (= lt!178468 (readBitPure!0 (BitStream!4257 (buf!2801 (_2!5129 lt!178464)) (currentByte!5438 thiss!1305) (currentBit!5433 thiss!1305))))))

(assert (=> b!116815 (= lt!178469 (readBitPure!0 lt!178461))))

(assert (=> b!116815 (= lt!178461 (BitStream!4257 (buf!2801 (_2!5129 lt!178465)) (currentByte!5438 thiss!1305) (currentBit!5433 thiss!1305)))))

(assert (=> b!116815 e!76598))

(declare-fun res!96618 () Bool)

(assert (=> b!116815 (=> (not res!96618) (not e!76598))))

(declare-fun isPrefixOf!0 (BitStream!4256 BitStream!4256) Bool)

(assert (=> b!116815 (= res!96618 (isPrefixOf!0 thiss!1305 (_2!5129 lt!178464)))))

(declare-fun lt!178459 () Unit!7187)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4256 BitStream!4256 BitStream!4256) Unit!7187)

(assert (=> b!116815 (= lt!178459 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5129 lt!178465) (_2!5129 lt!178464)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4256 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9728)

(assert (=> b!116815 (= lt!178464 (appendNLeastSignificantBitsLoop!0 (_2!5129 lt!178465) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!116815 e!76602))

(declare-fun res!96621 () Bool)

(assert (=> b!116815 (=> (not res!96621) (not e!76602))))

(assert (=> b!116815 (= res!96621 (= (size!2391 (buf!2801 thiss!1305)) (size!2391 (buf!2801 (_2!5129 lt!178465)))))))

(declare-fun appendBit!0 (BitStream!4256 Bool) tuple2!9728)

(assert (=> b!116815 (= lt!178465 (appendBit!0 thiss!1305 lt!178455))))

(assert (=> b!116815 (= lt!178455 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!116816 () Bool)

(declare-fun array_inv!2193 (array!5268) Bool)

(assert (=> b!116816 (= e!76594 (array_inv!2193 (buf!2801 thiss!1305)))))

(declare-fun b!116817 () Bool)

(assert (=> b!116817 (= e!76598 (invariant!0 (currentBit!5433 thiss!1305) (currentByte!5438 thiss!1305) (size!2391 (buf!2801 (_2!5129 lt!178464)))))))

(declare-fun b!116818 () Bool)

(declare-fun res!96620 () Bool)

(assert (=> b!116818 (=> (not res!96620) (not e!76595))))

(assert (=> b!116818 (= res!96620 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!116819 () Bool)

(declare-fun res!96616 () Bool)

(assert (=> b!116819 (=> (not res!96616) (not e!76599))))

(assert (=> b!116819 (= res!96616 (isPrefixOf!0 thiss!1305 (_2!5129 lt!178465)))))

(declare-fun b!116820 () Bool)

(assert (=> b!116820 (= e!76599 e!76601)))

(declare-fun res!96613 () Bool)

(assert (=> b!116820 (=> (not res!96613) (not e!76601))))

(assert (=> b!116820 (= res!96613 (and (= (_2!5130 lt!178460) lt!178455) (= (_1!5130 lt!178460) (_2!5129 lt!178465))))))

(declare-fun readerFrom!0 (BitStream!4256 (_ BitVec 32) (_ BitVec 32)) BitStream!4256)

(assert (=> b!116820 (= lt!178460 (readBitPure!0 (readerFrom!0 (_2!5129 lt!178465) (currentBit!5433 thiss!1305) (currentByte!5438 thiss!1305))))))

(declare-fun b!116821 () Bool)

(declare-fun res!96611 () Bool)

(assert (=> b!116821 (=> (not res!96611) (not e!76595))))

(assert (=> b!116821 (= res!96611 (bvslt i!615 nBits!396))))

(assert (= (and start!23004 res!96612) b!116813))

(assert (= (and b!116813 res!96619) b!116818))

(assert (= (and b!116818 res!96620) b!116821))

(assert (= (and b!116821 res!96611) b!116815))

(assert (= (and b!116815 res!96621) b!116810))

(assert (= (and b!116810 res!96615) b!116819))

(assert (= (and b!116819 res!96616) b!116820))

(assert (= (and b!116820 res!96613) b!116812))

(assert (= (and b!116815 res!96618) b!116811))

(assert (= (and b!116811 res!96614) b!116817))

(assert (= (and b!116815 res!96617) b!116814))

(assert (= start!23004 b!116816))

(declare-fun m!174939 () Bool)

(assert (=> b!116815 m!174939))

(declare-fun m!174941 () Bool)

(assert (=> b!116815 m!174941))

(declare-fun m!174943 () Bool)

(assert (=> b!116815 m!174943))

(declare-fun m!174945 () Bool)

(assert (=> b!116815 m!174945))

(declare-fun m!174947 () Bool)

(assert (=> b!116815 m!174947))

(declare-fun m!174949 () Bool)

(assert (=> b!116815 m!174949))

(declare-fun m!174951 () Bool)

(assert (=> b!116815 m!174951))

(declare-fun m!174953 () Bool)

(assert (=> b!116815 m!174953))

(declare-fun m!174955 () Bool)

(assert (=> b!116815 m!174955))

(declare-fun m!174957 () Bool)

(assert (=> b!116815 m!174957))

(declare-fun m!174959 () Bool)

(assert (=> b!116815 m!174959))

(declare-fun m!174961 () Bool)

(assert (=> b!116815 m!174961))

(declare-fun m!174963 () Bool)

(assert (=> b!116815 m!174963))

(declare-fun m!174965 () Bool)

(assert (=> b!116815 m!174965))

(declare-fun m!174967 () Bool)

(assert (=> b!116815 m!174967))

(declare-fun m!174969 () Bool)

(assert (=> b!116815 m!174969))

(declare-fun m!174971 () Bool)

(assert (=> b!116813 m!174971))

(declare-fun m!174973 () Bool)

(assert (=> b!116817 m!174973))

(declare-fun m!174975 () Bool)

(assert (=> b!116818 m!174975))

(declare-fun m!174977 () Bool)

(assert (=> b!116819 m!174977))

(declare-fun m!174979 () Bool)

(assert (=> b!116812 m!174979))

(declare-fun m!174981 () Bool)

(assert (=> b!116820 m!174981))

(assert (=> b!116820 m!174981))

(declare-fun m!174983 () Bool)

(assert (=> b!116820 m!174983))

(declare-fun m!174985 () Bool)

(assert (=> start!23004 m!174985))

(declare-fun m!174987 () Bool)

(assert (=> b!116816 m!174987))

(declare-fun m!174989 () Bool)

(assert (=> b!116810 m!174989))

(declare-fun m!174991 () Bool)

(assert (=> b!116810 m!174991))

(declare-fun m!174993 () Bool)

(assert (=> b!116811 m!174993))

(push 1)

(assert (not b!116819))

(assert (not b!116820))

(assert (not b!116818))

(assert (not b!116816))

(assert (not b!116817))

(assert (not start!23004))

(assert (not b!116813))

(assert (not b!116811))

(assert (not b!116812))

(assert (not b!116810))

(assert (not b!116815))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!37410 () Bool)

(declare-fun res!96693 () Bool)

(declare-fun e!76648 () Bool)

(assert (=> d!37410 (=> (not res!96693) (not e!76648))))

(assert (=> d!37410 (= res!96693 (= (size!2391 (buf!2801 thiss!1305)) (size!2391 (buf!2801 (_2!5129 lt!178465)))))))

(assert (=> d!37410 (= (isPrefixOf!0 thiss!1305 (_2!5129 lt!178465)) e!76648)))

(declare-fun b!116901 () Bool)

(declare-fun res!96694 () Bool)

(assert (=> b!116901 (=> (not res!96694) (not e!76648))))

(assert (=> b!116901 (= res!96694 (bvsle (bitIndex!0 (size!2391 (buf!2801 thiss!1305)) (currentByte!5438 thiss!1305) (currentBit!5433 thiss!1305)) (bitIndex!0 (size!2391 (buf!2801 (_2!5129 lt!178465))) (currentByte!5438 (_2!5129 lt!178465)) (currentBit!5433 (_2!5129 lt!178465)))))))

(declare-fun b!116902 () Bool)

(declare-fun e!76647 () Bool)

(assert (=> b!116902 (= e!76648 e!76647)))

(declare-fun res!96695 () Bool)

(assert (=> b!116902 (=> res!96695 e!76647)))

(assert (=> b!116902 (= res!96695 (= (size!2391 (buf!2801 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!116903 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5268 array!5268 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!116903 (= e!76647 (arrayBitRangesEq!0 (buf!2801 thiss!1305) (buf!2801 (_2!5129 lt!178465)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2391 (buf!2801 thiss!1305)) (currentByte!5438 thiss!1305) (currentBit!5433 thiss!1305))))))

(assert (= (and d!37410 res!96693) b!116901))

(assert (= (and b!116901 res!96694) b!116902))

(assert (= (and b!116902 (not res!96695)) b!116903))

(assert (=> b!116901 m!174991))

(assert (=> b!116901 m!174989))

(assert (=> b!116903 m!174991))

(assert (=> b!116903 m!174991))

(declare-fun m!175125 () Bool)

(assert (=> b!116903 m!175125))

(assert (=> b!116819 d!37410))

(declare-fun d!37418 () Bool)

(declare-datatypes ((tuple2!9744 0))(
  ( (tuple2!9745 (_1!5137 Bool) (_2!5137 BitStream!4256)) )
))
(declare-fun lt!178652 () tuple2!9744)

(declare-fun readBit!0 (BitStream!4256) tuple2!9744)

(assert (=> d!37418 (= lt!178652 (readBit!0 (readerFrom!0 (_2!5129 lt!178465) (currentBit!5433 thiss!1305) (currentByte!5438 thiss!1305))))))

(assert (=> d!37418 (= (readBitPure!0 (readerFrom!0 (_2!5129 lt!178465) (currentBit!5433 thiss!1305) (currentByte!5438 thiss!1305))) (tuple2!9731 (_2!5137 lt!178652) (_1!5137 lt!178652)))))

(declare-fun bs!9059 () Bool)

(assert (= bs!9059 d!37418))

(assert (=> bs!9059 m!174981))

(declare-fun m!175127 () Bool)

(assert (=> bs!9059 m!175127))

(assert (=> b!116820 d!37418))

(declare-fun d!37420 () Bool)

(declare-fun e!76654 () Bool)

(assert (=> d!37420 e!76654))

(declare-fun res!96702 () Bool)

(assert (=> d!37420 (=> (not res!96702) (not e!76654))))

(assert (=> d!37420 (= res!96702 (invariant!0 (currentBit!5433 (_2!5129 lt!178465)) (currentByte!5438 (_2!5129 lt!178465)) (size!2391 (buf!2801 (_2!5129 lt!178465)))))))

(assert (=> d!37420 (= (readerFrom!0 (_2!5129 lt!178465) (currentBit!5433 thiss!1305) (currentByte!5438 thiss!1305)) (BitStream!4257 (buf!2801 (_2!5129 lt!178465)) (currentByte!5438 thiss!1305) (currentBit!5433 thiss!1305)))))

(declare-fun b!116909 () Bool)

(assert (=> b!116909 (= e!76654 (invariant!0 (currentBit!5433 thiss!1305) (currentByte!5438 thiss!1305) (size!2391 (buf!2801 (_2!5129 lt!178465)))))))

(assert (= (and d!37420 res!96702) b!116909))

(declare-fun m!175139 () Bool)

(assert (=> d!37420 m!175139))

(assert (=> b!116909 m!174993))

(assert (=> b!116820 d!37420))

(declare-fun d!37424 () Bool)

(assert (=> d!37424 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5433 thiss!1305) (currentByte!5438 thiss!1305) (size!2391 (buf!2801 thiss!1305))))))

(declare-fun bs!9060 () Bool)

(assert (= bs!9060 d!37424))

(declare-fun m!175141 () Bool)

(assert (=> bs!9060 m!175141))

(assert (=> start!23004 d!37424))

(declare-fun d!37428 () Bool)

(assert (=> d!37428 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!116818 d!37428))

(declare-fun d!37430 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!37430 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2391 (buf!2801 thiss!1305))) ((_ sign_extend 32) (currentByte!5438 thiss!1305)) ((_ sign_extend 32) (currentBit!5433 thiss!1305)) lt!178470) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2391 (buf!2801 thiss!1305))) ((_ sign_extend 32) (currentByte!5438 thiss!1305)) ((_ sign_extend 32) (currentBit!5433 thiss!1305))) lt!178470))))

(declare-fun bs!9062 () Bool)

(assert (= bs!9062 d!37430))

(declare-fun m!175145 () Bool)

(assert (=> bs!9062 m!175145))

(assert (=> b!116813 d!37430))

(declare-fun d!37432 () Bool)

(assert (=> d!37432 (= (invariant!0 (currentBit!5433 thiss!1305) (currentByte!5438 thiss!1305) (size!2391 (buf!2801 (_2!5129 lt!178465)))) (and (bvsge (currentBit!5433 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5433 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5438 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5438 thiss!1305) (size!2391 (buf!2801 (_2!5129 lt!178465)))) (and (= (currentBit!5433 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5438 thiss!1305) (size!2391 (buf!2801 (_2!5129 lt!178465))))))))))

(assert (=> b!116811 d!37432))

(declare-fun d!37434 () Bool)

(assert (=> d!37434 (= (invariant!0 (currentBit!5433 thiss!1305) (currentByte!5438 thiss!1305) (size!2391 (buf!2801 (_2!5129 lt!178464)))) (and (bvsge (currentBit!5433 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5433 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5438 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5438 thiss!1305) (size!2391 (buf!2801 (_2!5129 lt!178464)))) (and (= (currentBit!5433 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5438 thiss!1305) (size!2391 (buf!2801 (_2!5129 lt!178464))))))))))

(assert (=> b!116817 d!37434))

(declare-fun d!37436 () Bool)

(declare-fun e!76661 () Bool)

(assert (=> d!37436 e!76661))

(declare-fun res!96715 () Bool)

(assert (=> d!37436 (=> (not res!96715) (not e!76661))))

(declare-fun lt!178680 () (_ BitVec 64))

(declare-fun lt!178683 () (_ BitVec 64))

(declare-fun lt!178682 () (_ BitVec 64))

(assert (=> d!37436 (= res!96715 (= lt!178682 (bvsub lt!178680 lt!178683)))))

(assert (=> d!37436 (or (= (bvand lt!178680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178683 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!178680 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!178680 lt!178683) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37436 (= lt!178683 (remainingBits!0 ((_ sign_extend 32) (size!2391 (buf!2801 (_1!5130 lt!178460)))) ((_ sign_extend 32) (currentByte!5438 (_1!5130 lt!178460))) ((_ sign_extend 32) (currentBit!5433 (_1!5130 lt!178460)))))))

(declare-fun lt!178684 () (_ BitVec 64))

(declare-fun lt!178681 () (_ BitVec 64))

(assert (=> d!37436 (= lt!178680 (bvmul lt!178684 lt!178681))))

(assert (=> d!37436 (or (= lt!178684 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!178681 (bvsdiv (bvmul lt!178684 lt!178681) lt!178684)))))

(assert (=> d!37436 (= lt!178681 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37436 (= lt!178684 ((_ sign_extend 32) (size!2391 (buf!2801 (_1!5130 lt!178460)))))))

(assert (=> d!37436 (= lt!178682 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5438 (_1!5130 lt!178460))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5433 (_1!5130 lt!178460)))))))

(assert (=> d!37436 (invariant!0 (currentBit!5433 (_1!5130 lt!178460)) (currentByte!5438 (_1!5130 lt!178460)) (size!2391 (buf!2801 (_1!5130 lt!178460))))))

(assert (=> d!37436 (= (bitIndex!0 (size!2391 (buf!2801 (_1!5130 lt!178460))) (currentByte!5438 (_1!5130 lt!178460)) (currentBit!5433 (_1!5130 lt!178460))) lt!178682)))

(declare-fun b!116923 () Bool)

(declare-fun res!96716 () Bool)

(assert (=> b!116923 (=> (not res!96716) (not e!76661))))

(assert (=> b!116923 (= res!96716 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!178682))))

(declare-fun b!116924 () Bool)

(declare-fun lt!178685 () (_ BitVec 64))

(assert (=> b!116924 (= e!76661 (bvsle lt!178682 (bvmul lt!178685 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!116924 (or (= lt!178685 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!178685 #b0000000000000000000000000000000000000000000000000000000000001000) lt!178685)))))

(assert (=> b!116924 (= lt!178685 ((_ sign_extend 32) (size!2391 (buf!2801 (_1!5130 lt!178460)))))))

(assert (= (and d!37436 res!96715) b!116923))

(assert (= (and b!116923 res!96716) b!116924))

(declare-fun m!175147 () Bool)

(assert (=> d!37436 m!175147))

(declare-fun m!175149 () Bool)

(assert (=> d!37436 m!175149))

(assert (=> b!116812 d!37436))

(declare-fun d!37438 () Bool)

(assert (=> d!37438 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!116815 d!37438))

(declare-fun d!37440 () Bool)

(declare-fun lt!178686 () tuple2!9744)

(assert (=> d!37440 (= lt!178686 (readBit!0 (_1!5132 lt!178456)))))

(assert (=> d!37440 (= (readBitPure!0 (_1!5132 lt!178456)) (tuple2!9731 (_2!5137 lt!178686) (_1!5137 lt!178686)))))

(declare-fun bs!9063 () Bool)

(assert (= bs!9063 d!37440))

(declare-fun m!175151 () Bool)

(assert (=> bs!9063 m!175151))

(assert (=> b!116815 d!37440))

(declare-fun d!37442 () Bool)

(declare-fun e!76666 () Bool)

(assert (=> d!37442 e!76666))

(declare-fun res!96723 () Bool)

(assert (=> d!37442 (=> (not res!96723) (not e!76666))))

(declare-fun lt!178700 () tuple2!9730)

(declare-fun lt!178702 () tuple2!9730)

(assert (=> d!37442 (= res!96723 (= (bitIndex!0 (size!2391 (buf!2801 (_1!5130 lt!178700))) (currentByte!5438 (_1!5130 lt!178700)) (currentBit!5433 (_1!5130 lt!178700))) (bitIndex!0 (size!2391 (buf!2801 (_1!5130 lt!178702))) (currentByte!5438 (_1!5130 lt!178702)) (currentBit!5433 (_1!5130 lt!178702)))))))

(declare-fun lt!178701 () Unit!7187)

(declare-fun lt!178699 () BitStream!4256)

(declare-fun choose!50 (BitStream!4256 BitStream!4256 BitStream!4256 tuple2!9730 tuple2!9730 BitStream!4256 Bool tuple2!9730 tuple2!9730 BitStream!4256 Bool) Unit!7187)

(assert (=> d!37442 (= lt!178701 (choose!50 lt!178461 (_2!5129 lt!178464) lt!178699 lt!178700 (tuple2!9731 (_1!5130 lt!178700) (_2!5130 lt!178700)) (_1!5130 lt!178700) (_2!5130 lt!178700) lt!178702 (tuple2!9731 (_1!5130 lt!178702) (_2!5130 lt!178702)) (_1!5130 lt!178702) (_2!5130 lt!178702)))))

(assert (=> d!37442 (= lt!178702 (readBitPure!0 lt!178699))))

(assert (=> d!37442 (= lt!178700 (readBitPure!0 lt!178461))))

(assert (=> d!37442 (= lt!178699 (BitStream!4257 (buf!2801 (_2!5129 lt!178464)) (currentByte!5438 lt!178461) (currentBit!5433 lt!178461)))))

(assert (=> d!37442 (invariant!0 (currentBit!5433 lt!178461) (currentByte!5438 lt!178461) (size!2391 (buf!2801 (_2!5129 lt!178464))))))

(assert (=> d!37442 (= (readBitPrefixLemma!0 lt!178461 (_2!5129 lt!178464)) lt!178701)))

(declare-fun b!116931 () Bool)

(assert (=> b!116931 (= e!76666 (= (_2!5130 lt!178700) (_2!5130 lt!178702)))))

(assert (= (and d!37442 res!96723) b!116931))

(declare-fun m!175167 () Bool)

(assert (=> d!37442 m!175167))

(assert (=> d!37442 m!174941))

(declare-fun m!175169 () Bool)

(assert (=> d!37442 m!175169))

(declare-fun m!175171 () Bool)

(assert (=> d!37442 m!175171))

(declare-fun m!175173 () Bool)

(assert (=> d!37442 m!175173))

(declare-fun m!175175 () Bool)

(assert (=> d!37442 m!175175))

(assert (=> b!116815 d!37442))

(declare-fun d!37446 () Bool)

(declare-fun e!76667 () Bool)

(assert (=> d!37446 e!76667))

(declare-fun res!96724 () Bool)

(assert (=> d!37446 (=> (not res!96724) (not e!76667))))

(declare-fun lt!178703 () (_ BitVec 64))

(declare-fun lt!178706 () (_ BitVec 64))

(declare-fun lt!178705 () (_ BitVec 64))

(assert (=> d!37446 (= res!96724 (= lt!178705 (bvsub lt!178703 lt!178706)))))

(assert (=> d!37446 (or (= (bvand lt!178703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178706 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!178703 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!178703 lt!178706) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37446 (= lt!178706 (remainingBits!0 ((_ sign_extend 32) (size!2391 (buf!2801 (_1!5130 lt!178468)))) ((_ sign_extend 32) (currentByte!5438 (_1!5130 lt!178468))) ((_ sign_extend 32) (currentBit!5433 (_1!5130 lt!178468)))))))

(declare-fun lt!178707 () (_ BitVec 64))

(declare-fun lt!178704 () (_ BitVec 64))

(assert (=> d!37446 (= lt!178703 (bvmul lt!178707 lt!178704))))

(assert (=> d!37446 (or (= lt!178707 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!178704 (bvsdiv (bvmul lt!178707 lt!178704) lt!178707)))))

(assert (=> d!37446 (= lt!178704 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37446 (= lt!178707 ((_ sign_extend 32) (size!2391 (buf!2801 (_1!5130 lt!178468)))))))

(assert (=> d!37446 (= lt!178705 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5438 (_1!5130 lt!178468))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5433 (_1!5130 lt!178468)))))))

(assert (=> d!37446 (invariant!0 (currentBit!5433 (_1!5130 lt!178468)) (currentByte!5438 (_1!5130 lt!178468)) (size!2391 (buf!2801 (_1!5130 lt!178468))))))

(assert (=> d!37446 (= (bitIndex!0 (size!2391 (buf!2801 (_1!5130 lt!178468))) (currentByte!5438 (_1!5130 lt!178468)) (currentBit!5433 (_1!5130 lt!178468))) lt!178705)))

(declare-fun b!116932 () Bool)

(declare-fun res!96725 () Bool)

(assert (=> b!116932 (=> (not res!96725) (not e!76667))))

(assert (=> b!116932 (= res!96725 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!178705))))

(declare-fun b!116933 () Bool)

(declare-fun lt!178708 () (_ BitVec 64))

(assert (=> b!116933 (= e!76667 (bvsle lt!178705 (bvmul lt!178708 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!116933 (or (= lt!178708 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!178708 #b0000000000000000000000000000000000000000000000000000000000001000) lt!178708)))))

(assert (=> b!116933 (= lt!178708 ((_ sign_extend 32) (size!2391 (buf!2801 (_1!5130 lt!178468)))))))

(assert (= (and d!37446 res!96724) b!116932))

(assert (= (and b!116932 res!96725) b!116933))

(declare-fun m!175177 () Bool)

(assert (=> d!37446 m!175177))

(declare-fun m!175179 () Bool)

(assert (=> d!37446 m!175179))

(assert (=> b!116815 d!37446))

(declare-fun d!37448 () Bool)

(assert (=> d!37448 (validate_offset_bits!1 ((_ sign_extend 32) (size!2391 (buf!2801 (_2!5129 lt!178464)))) ((_ sign_extend 32) (currentByte!5438 thiss!1305)) ((_ sign_extend 32) (currentBit!5433 thiss!1305)) lt!178470)))

(declare-fun lt!178711 () Unit!7187)

(declare-fun choose!9 (BitStream!4256 array!5268 (_ BitVec 64) BitStream!4256) Unit!7187)

(assert (=> d!37448 (= lt!178711 (choose!9 thiss!1305 (buf!2801 (_2!5129 lt!178464)) lt!178470 (BitStream!4257 (buf!2801 (_2!5129 lt!178464)) (currentByte!5438 thiss!1305) (currentBit!5433 thiss!1305))))))

(assert (=> d!37448 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2801 (_2!5129 lt!178464)) lt!178470) lt!178711)))

(declare-fun bs!9064 () Bool)

(assert (= bs!9064 d!37448))

(assert (=> bs!9064 m!174943))

(declare-fun m!175181 () Bool)

(assert (=> bs!9064 m!175181))

(assert (=> b!116815 d!37448))

(declare-fun d!37450 () Bool)

(assert (=> d!37450 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2391 (buf!2801 (_2!5129 lt!178464)))) ((_ sign_extend 32) (currentByte!5438 thiss!1305)) ((_ sign_extend 32) (currentBit!5433 thiss!1305)) lt!178470) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2391 (buf!2801 (_2!5129 lt!178464)))) ((_ sign_extend 32) (currentByte!5438 thiss!1305)) ((_ sign_extend 32) (currentBit!5433 thiss!1305))) lt!178470))))

(declare-fun bs!9065 () Bool)

(assert (= bs!9065 d!37450))

(declare-fun m!175183 () Bool)

(assert (=> bs!9065 m!175183))

(assert (=> b!116815 d!37450))

(declare-fun d!37452 () Bool)

(declare-fun lt!178712 () tuple2!9744)

(assert (=> d!37452 (= lt!178712 (readBit!0 (BitStream!4257 (buf!2801 (_2!5129 lt!178464)) (currentByte!5438 thiss!1305) (currentBit!5433 thiss!1305))))))

(assert (=> d!37452 (= (readBitPure!0 (BitStream!4257 (buf!2801 (_2!5129 lt!178464)) (currentByte!5438 thiss!1305) (currentBit!5433 thiss!1305))) (tuple2!9731 (_2!5137 lt!178712) (_1!5137 lt!178712)))))

(declare-fun bs!9066 () Bool)

(assert (= bs!9066 d!37452))

(declare-fun m!175185 () Bool)

(assert (=> bs!9066 m!175185))

(assert (=> b!116815 d!37452))

(declare-fun d!37454 () Bool)

(declare-fun e!76668 () Bool)

(assert (=> d!37454 e!76668))

(declare-fun res!96726 () Bool)

(assert (=> d!37454 (=> (not res!96726) (not e!76668))))

(declare-fun lt!178713 () (_ BitVec 64))

(declare-fun lt!178715 () (_ BitVec 64))

(declare-fun lt!178716 () (_ BitVec 64))

(assert (=> d!37454 (= res!96726 (= lt!178715 (bvsub lt!178713 lt!178716)))))

(assert (=> d!37454 (or (= (bvand lt!178713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178716 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!178713 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!178713 lt!178716) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!37454 (= lt!178716 (remainingBits!0 ((_ sign_extend 32) (size!2391 (buf!2801 (_1!5130 lt!178469)))) ((_ sign_extend 32) (currentByte!5438 (_1!5130 lt!178469))) ((_ sign_extend 32) (currentBit!5433 (_1!5130 lt!178469)))))))

(declare-fun lt!178717 () (_ BitVec 64))

(declare-fun lt!178714 () (_ BitVec 64))

(assert (=> d!37454 (= lt!178713 (bvmul lt!178717 lt!178714))))

(assert (=> d!37454 (or (= lt!178717 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!178714 (bvsdiv (bvmul lt!178717 lt!178714) lt!178717)))))

(assert (=> d!37454 (= lt!178714 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!37454 (= lt!178717 ((_ sign_extend 32) (size!2391 (buf!2801 (_1!5130 lt!178469)))))))

(assert (=> d!37454 (= lt!178715 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5438 (_1!5130 lt!178469))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5433 (_1!5130 lt!178469)))))))

(assert (=> d!37454 (invariant!0 (currentBit!5433 (_1!5130 lt!178469)) (currentByte!5438 (_1!5130 lt!178469)) (size!2391 (buf!2801 (_1!5130 lt!178469))))))

(assert (=> d!37454 (= (bitIndex!0 (size!2391 (buf!2801 (_1!5130 lt!178469))) (currentByte!5438 (_1!5130 lt!178469)) (currentBit!5433 (_1!5130 lt!178469))) lt!178715)))

(declare-fun b!116934 () Bool)

(declare-fun res!96727 () Bool)

(assert (=> b!116934 (=> (not res!96727) (not e!76668))))

(assert (=> b!116934 (= res!96727 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!178715))))

(declare-fun b!116935 () Bool)

(declare-fun lt!178718 () (_ BitVec 64))

(assert (=> b!116935 (= e!76668 (bvsle lt!178715 (bvmul lt!178718 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!116935 (or (= lt!178718 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!178718 #b0000000000000000000000000000000000000000000000000000000000001000) lt!178718)))))

(assert (=> b!116935 (= lt!178718 ((_ sign_extend 32) (size!2391 (buf!2801 (_1!5130 lt!178469)))))))

(assert (= (and d!37454 res!96726) b!116934))

(assert (= (and b!116934 res!96727) b!116935))

(declare-fun m!175187 () Bool)

(assert (=> d!37454 m!175187))

(declare-fun m!175189 () Bool)

(assert (=> d!37454 m!175189))

(assert (=> b!116815 d!37454))

(declare-fun d!37456 () Bool)

(declare-datatypes ((tuple2!9746 0))(
  ( (tuple2!9747 (_1!5138 (_ BitVec 64)) (_2!5138 BitStream!4256)) )
))
(declare-fun lt!178721 () tuple2!9746)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4256 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9746)

(assert (=> d!37456 (= lt!178721 (readNLeastSignificantBitsLoop!0 (_1!5132 lt!178456) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))))))

(assert (=> d!37456 (= (readNLeastSignificantBitsLoopPure!0 (_1!5132 lt!178456) nBits!396 i!615 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615))))) (tuple2!9733 (_2!5138 lt!178721) (_1!5138 lt!178721)))))

(declare-fun bs!9067 () Bool)

(assert (= bs!9067 d!37456))

(declare-fun m!175191 () Bool)

(assert (=> bs!9067 m!175191))

(assert (=> b!116815 d!37456))

(declare-fun d!37458 () Bool)

(assert (=> d!37458 (isPrefixOf!0 thiss!1305 (_2!5129 lt!178464))))

(declare-fun lt!178724 () Unit!7187)

(declare-fun choose!30 (BitStream!4256 BitStream!4256 BitStream!4256) Unit!7187)

(assert (=> d!37458 (= lt!178724 (choose!30 thiss!1305 (_2!5129 lt!178465) (_2!5129 lt!178464)))))

(assert (=> d!37458 (isPrefixOf!0 thiss!1305 (_2!5129 lt!178465))))

(assert (=> d!37458 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5129 lt!178465) (_2!5129 lt!178464)) lt!178724)))

(declare-fun bs!9068 () Bool)

(assert (= bs!9068 d!37458))

(assert (=> bs!9068 m!174963))

(declare-fun m!175193 () Bool)

(assert (=> bs!9068 m!175193))

(assert (=> bs!9068 m!174977))

(assert (=> b!116815 d!37458))

(declare-fun b!116970 () Bool)

(declare-fun e!76682 () Bool)

(declare-fun lt!178825 () tuple2!9730)

(declare-fun lt!178822 () tuple2!9728)

(assert (=> b!116970 (= e!76682 (= (bitIndex!0 (size!2391 (buf!2801 (_1!5130 lt!178825))) (currentByte!5438 (_1!5130 lt!178825)) (currentBit!5433 (_1!5130 lt!178825))) (bitIndex!0 (size!2391 (buf!2801 (_2!5129 lt!178822))) (currentByte!5438 (_2!5129 lt!178822)) (currentBit!5433 (_2!5129 lt!178822)))))))

(declare-fun b!116967 () Bool)

(declare-fun res!96751 () Bool)

(declare-fun e!76683 () Bool)

(assert (=> b!116967 (=> (not res!96751) (not e!76683))))

(declare-fun lt!178824 () (_ BitVec 64))

(declare-fun lt!178823 () (_ BitVec 64))

(assert (=> b!116967 (= res!96751 (= (bitIndex!0 (size!2391 (buf!2801 (_2!5129 lt!178822))) (currentByte!5438 (_2!5129 lt!178822)) (currentBit!5433 (_2!5129 lt!178822))) (bvadd lt!178824 lt!178823)))))

(assert (=> b!116967 (or (not (= (bvand lt!178824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178823 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!178824 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!178824 lt!178823) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!116967 (= lt!178823 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!116967 (= lt!178824 (bitIndex!0 (size!2391 (buf!2801 thiss!1305)) (currentByte!5438 thiss!1305) (currentBit!5433 thiss!1305)))))

(declare-fun b!116969 () Bool)

(assert (=> b!116969 (= e!76683 e!76682)))

(declare-fun res!96753 () Bool)

(assert (=> b!116969 (=> (not res!96753) (not e!76682))))

(assert (=> b!116969 (= res!96753 (and (= (_2!5130 lt!178825) lt!178455) (= (_1!5130 lt!178825) (_2!5129 lt!178822))))))

(assert (=> b!116969 (= lt!178825 (readBitPure!0 (readerFrom!0 (_2!5129 lt!178822) (currentBit!5433 thiss!1305) (currentByte!5438 thiss!1305))))))

(declare-fun d!37460 () Bool)

(assert (=> d!37460 e!76683))

(declare-fun res!96750 () Bool)

(assert (=> d!37460 (=> (not res!96750) (not e!76683))))

(assert (=> d!37460 (= res!96750 (= (size!2391 (buf!2801 thiss!1305)) (size!2391 (buf!2801 (_2!5129 lt!178822)))))))

(declare-fun choose!16 (BitStream!4256 Bool) tuple2!9728)

(assert (=> d!37460 (= lt!178822 (choose!16 thiss!1305 lt!178455))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!37460 (validate_offset_bit!0 ((_ sign_extend 32) (size!2391 (buf!2801 thiss!1305))) ((_ sign_extend 32) (currentByte!5438 thiss!1305)) ((_ sign_extend 32) (currentBit!5433 thiss!1305)))))

(assert (=> d!37460 (= (appendBit!0 thiss!1305 lt!178455) lt!178822)))

(declare-fun b!116968 () Bool)

(declare-fun res!96752 () Bool)

(assert (=> b!116968 (=> (not res!96752) (not e!76683))))

(assert (=> b!116968 (= res!96752 (isPrefixOf!0 thiss!1305 (_2!5129 lt!178822)))))

(assert (= (and d!37460 res!96750) b!116967))

(assert (= (and b!116967 res!96751) b!116968))

(assert (= (and b!116968 res!96752) b!116969))

(assert (= (and b!116969 res!96753) b!116970))

(declare-fun m!175259 () Bool)

(assert (=> b!116970 m!175259))

(declare-fun m!175261 () Bool)

(assert (=> b!116970 m!175261))

(declare-fun m!175263 () Bool)

(assert (=> b!116968 m!175263))

(declare-fun m!175265 () Bool)

(assert (=> b!116969 m!175265))

(assert (=> b!116969 m!175265))

(declare-fun m!175267 () Bool)

(assert (=> b!116969 m!175267))

(assert (=> b!116967 m!175261))

(assert (=> b!116967 m!174991))

(declare-fun m!175269 () Bool)

(assert (=> d!37460 m!175269))

(declare-fun m!175271 () Bool)

(assert (=> d!37460 m!175271))

(assert (=> b!116815 d!37460))

(declare-fun d!37470 () Bool)

(declare-fun lt!178829 () tuple2!9744)

(assert (=> d!37470 (= lt!178829 (readBit!0 lt!178461))))

(assert (=> d!37470 (= (readBitPure!0 lt!178461) (tuple2!9731 (_2!5137 lt!178829) (_1!5137 lt!178829)))))

(declare-fun bs!9071 () Bool)

(assert (= bs!9071 d!37470))

(declare-fun m!175273 () Bool)

(assert (=> bs!9071 m!175273))

(assert (=> b!116815 d!37470))

(declare-fun b!116983 () Bool)

(declare-fun res!96762 () Bool)

(declare-fun e!76689 () Bool)

(assert (=> b!116983 (=> (not res!96762) (not e!76689))))

(declare-fun lt!178876 () tuple2!9734)

(assert (=> b!116983 (= res!96762 (isPrefixOf!0 (_1!5132 lt!178876) (_2!5129 lt!178465)))))

(declare-fun d!37472 () Bool)

(assert (=> d!37472 e!76689))

(declare-fun res!96764 () Bool)

(assert (=> d!37472 (=> (not res!96764) (not e!76689))))

(assert (=> d!37472 (= res!96764 (isPrefixOf!0 (_1!5132 lt!178876) (_2!5132 lt!178876)))))

(declare-fun lt!178891 () BitStream!4256)

(assert (=> d!37472 (= lt!178876 (tuple2!9735 lt!178891 (_2!5129 lt!178464)))))

(declare-fun lt!178882 () Unit!7187)

(declare-fun lt!178895 () Unit!7187)

(assert (=> d!37472 (= lt!178882 lt!178895)))

(assert (=> d!37472 (isPrefixOf!0 lt!178891 (_2!5129 lt!178464))))

(assert (=> d!37472 (= lt!178895 (lemmaIsPrefixTransitive!0 lt!178891 (_2!5129 lt!178464) (_2!5129 lt!178464)))))

(declare-fun lt!178878 () Unit!7187)

(declare-fun lt!178885 () Unit!7187)

(assert (=> d!37472 (= lt!178878 lt!178885)))

(assert (=> d!37472 (isPrefixOf!0 lt!178891 (_2!5129 lt!178464))))

(assert (=> d!37472 (= lt!178885 (lemmaIsPrefixTransitive!0 lt!178891 (_2!5129 lt!178465) (_2!5129 lt!178464)))))

(declare-fun lt!178884 () Unit!7187)

(declare-fun e!76690 () Unit!7187)

(assert (=> d!37472 (= lt!178884 e!76690)))

(declare-fun c!7041 () Bool)

(assert (=> d!37472 (= c!7041 (not (= (size!2391 (buf!2801 (_2!5129 lt!178465))) #b00000000000000000000000000000000)))))

(declare-fun lt!178890 () Unit!7187)

(declare-fun lt!178887 () Unit!7187)

(assert (=> d!37472 (= lt!178890 lt!178887)))

(assert (=> d!37472 (isPrefixOf!0 (_2!5129 lt!178464) (_2!5129 lt!178464))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4256) Unit!7187)

(assert (=> d!37472 (= lt!178887 (lemmaIsPrefixRefl!0 (_2!5129 lt!178464)))))

(declare-fun lt!178889 () Unit!7187)

(declare-fun lt!178893 () Unit!7187)

(assert (=> d!37472 (= lt!178889 lt!178893)))

(assert (=> d!37472 (= lt!178893 (lemmaIsPrefixRefl!0 (_2!5129 lt!178464)))))

(declare-fun lt!178892 () Unit!7187)

(declare-fun lt!178880 () Unit!7187)

(assert (=> d!37472 (= lt!178892 lt!178880)))

(assert (=> d!37472 (isPrefixOf!0 lt!178891 lt!178891)))

(assert (=> d!37472 (= lt!178880 (lemmaIsPrefixRefl!0 lt!178891))))

(declare-fun lt!178879 () Unit!7187)

(declare-fun lt!178883 () Unit!7187)

(assert (=> d!37472 (= lt!178879 lt!178883)))

(assert (=> d!37472 (isPrefixOf!0 (_2!5129 lt!178465) (_2!5129 lt!178465))))

(assert (=> d!37472 (= lt!178883 (lemmaIsPrefixRefl!0 (_2!5129 lt!178465)))))

(assert (=> d!37472 (= lt!178891 (BitStream!4257 (buf!2801 (_2!5129 lt!178464)) (currentByte!5438 (_2!5129 lt!178465)) (currentBit!5433 (_2!5129 lt!178465))))))

(assert (=> d!37472 (isPrefixOf!0 (_2!5129 lt!178465) (_2!5129 lt!178464))))

(assert (=> d!37472 (= (reader!0 (_2!5129 lt!178465) (_2!5129 lt!178464)) lt!178876)))

(declare-fun lt!178894 () (_ BitVec 64))

(declare-fun b!116984 () Bool)

(declare-fun lt!178877 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4256 (_ BitVec 64)) BitStream!4256)

(assert (=> b!116984 (= e!76689 (= (_1!5132 lt!178876) (withMovedBitIndex!0 (_2!5132 lt!178876) (bvsub lt!178894 lt!178877))))))

(assert (=> b!116984 (or (= (bvand lt!178894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!178877 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!178894 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!178894 lt!178877) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!116984 (= lt!178877 (bitIndex!0 (size!2391 (buf!2801 (_2!5129 lt!178464))) (currentByte!5438 (_2!5129 lt!178464)) (currentBit!5433 (_2!5129 lt!178464))))))

(assert (=> b!116984 (= lt!178894 (bitIndex!0 (size!2391 (buf!2801 (_2!5129 lt!178465))) (currentByte!5438 (_2!5129 lt!178465)) (currentBit!5433 (_2!5129 lt!178465))))))

(declare-fun b!116985 () Bool)

(declare-fun lt!178888 () Unit!7187)

(assert (=> b!116985 (= e!76690 lt!178888)))

(declare-fun lt!178881 () (_ BitVec 64))

(assert (=> b!116985 (= lt!178881 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!178886 () (_ BitVec 64))

(assert (=> b!116985 (= lt!178886 (bitIndex!0 (size!2391 (buf!2801 (_2!5129 lt!178465))) (currentByte!5438 (_2!5129 lt!178465)) (currentBit!5433 (_2!5129 lt!178465))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5268 array!5268 (_ BitVec 64) (_ BitVec 64)) Unit!7187)

(assert (=> b!116985 (= lt!178888 (arrayBitRangesEqSymmetric!0 (buf!2801 (_2!5129 lt!178465)) (buf!2801 (_2!5129 lt!178464)) lt!178881 lt!178886))))

(assert (=> b!116985 (arrayBitRangesEq!0 (buf!2801 (_2!5129 lt!178464)) (buf!2801 (_2!5129 lt!178465)) lt!178881 lt!178886)))

(declare-fun b!116986 () Bool)

(declare-fun res!96763 () Bool)

(assert (=> b!116986 (=> (not res!96763) (not e!76689))))

(assert (=> b!116986 (= res!96763 (isPrefixOf!0 (_2!5132 lt!178876) (_2!5129 lt!178464)))))

(declare-fun b!116987 () Bool)

(declare-fun Unit!7205 () Unit!7187)

(assert (=> b!116987 (= e!76690 Unit!7205)))

(assert (= (and d!37472 c!7041) b!116985))

(assert (= (and d!37472 (not c!7041)) b!116987))

(assert (= (and d!37472 res!96764) b!116983))

(assert (= (and b!116983 res!96762) b!116986))

(assert (= (and b!116986 res!96763) b!116984))

(declare-fun m!175281 () Bool)

(assert (=> d!37472 m!175281))

(declare-fun m!175283 () Bool)

(assert (=> d!37472 m!175283))

(declare-fun m!175285 () Bool)

(assert (=> d!37472 m!175285))

(declare-fun m!175287 () Bool)

(assert (=> d!37472 m!175287))

(declare-fun m!175289 () Bool)

(assert (=> d!37472 m!175289))

(declare-fun m!175291 () Bool)

(assert (=> d!37472 m!175291))

(declare-fun m!175293 () Bool)

(assert (=> d!37472 m!175293))

(declare-fun m!175295 () Bool)

(assert (=> d!37472 m!175295))

(declare-fun m!175297 () Bool)

(assert (=> d!37472 m!175297))

(declare-fun m!175299 () Bool)

(assert (=> d!37472 m!175299))

(declare-fun m!175301 () Bool)

(assert (=> d!37472 m!175301))

(declare-fun m!175303 () Bool)

(assert (=> b!116983 m!175303))

(assert (=> b!116985 m!174989))

(declare-fun m!175305 () Bool)

(assert (=> b!116985 m!175305))

(declare-fun m!175307 () Bool)

(assert (=> b!116985 m!175307))

(declare-fun m!175309 () Bool)

(assert (=> b!116984 m!175309))

(declare-fun m!175311 () Bool)

(assert (=> b!116984 m!175311))

(assert (=> b!116984 m!174989))

(declare-fun m!175313 () Bool)

(assert (=> b!116986 m!175313))

(assert (=> b!116815 d!37472))

(declare-fun d!37478 () Bool)

(declare-fun res!96765 () Bool)

(declare-fun e!76692 () Bool)

(assert (=> d!37478 (=> (not res!96765) (not e!76692))))

(assert (=> d!37478 (= res!96765 (= (size!2391 (buf!2801 thiss!1305)) (size!2391 (buf!2801 (_2!5129 lt!178464)))))))

(assert (=> d!37478 (= (isPrefixOf!0 thiss!1305 (_2!5129 lt!178464)) e!76692)))

(declare-fun b!116988 () Bool)

(declare-fun res!96766 () Bool)

(assert (=> b!116988 (=> (not res!96766) (not e!76692))))

(assert (=> b!116988 (= res!96766 (bvsle (bitIndex!0 (size!2391 (buf!2801 thiss!1305)) (currentByte!5438 thiss!1305) (currentBit!5433 thiss!1305)) (bitIndex!0 (size!2391 (buf!2801 (_2!5129 lt!178464))) (currentByte!5438 (_2!5129 lt!178464)) (currentBit!5433 (_2!5129 lt!178464)))))))

(declare-fun b!116989 () Bool)

(declare-fun e!76691 () Bool)

(assert (=> b!116989 (= e!76692 e!76691)))

(declare-fun res!96767 () Bool)

(assert (=> b!116989 (=> res!96767 e!76691)))

(assert (=> b!116989 (= res!96767 (= (size!2391 (buf!2801 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!116990 () Bool)

(assert (=> b!116990 (= e!76691 (arrayBitRangesEq!0 (buf!2801 thiss!1305) (buf!2801 (_2!5129 lt!178464)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2391 (buf!2801 thiss!1305)) (currentByte!5438 thiss!1305) (currentBit!5433 thiss!1305))))))

(assert (= (and d!37478 res!96765) b!116988))

(assert (= (and b!116988 res!96766) b!116989))

(assert (= (and b!116989 (not res!96767)) b!116990))

(assert (=> b!116988 m!174991))

(assert (=> b!116988 m!175311))

(assert (=> b!116990 m!174991))

(assert (=> b!116990 m!174991))

(declare-fun m!175315 () Bool)

(assert (=> b!116990 m!175315))

(assert (=> b!116815 d!37478))

(declare-fun b!117112 () Bool)

(declare-fun e!76766 () Bool)

(declare-fun lt!179297 () tuple2!9730)

(declare-fun lt!179288 () tuple2!9730)

(assert (=> b!117112 (= e!76766 (= (_2!5130 lt!179297) (_2!5130 lt!179288)))))

(declare-fun d!37480 () Bool)

(declare-fun e!76765 () Bool)

(assert (=> d!37480 e!76765))

(declare-fun res!96866 () Bool)

(assert (=> d!37480 (=> (not res!96866) (not e!76765))))

(declare-fun lt!179287 () tuple2!9728)

(assert (=> d!37480 (= res!96866 (= (size!2391 (buf!2801 (_2!5129 lt!178465))) (size!2391 (buf!2801 (_2!5129 lt!179287)))))))

(declare-fun e!76762 () tuple2!9728)

(assert (=> d!37480 (= lt!179287 e!76762)))

(declare-fun c!7058 () Bool)

(assert (=> d!37480 (= c!7058 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!37480 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!37480 (= (appendNLeastSignificantBitsLoop!0 (_2!5129 lt!178465) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!179287)))

(declare-fun lt!179311 () tuple2!9732)

(declare-fun b!117113 () Bool)

(declare-fun lt!179319 () tuple2!9734)

(assert (=> b!117113 (= e!76765 (and (= (_2!5131 lt!179311) v!199) (= (_1!5131 lt!179311) (_2!5132 lt!179319))))))

(declare-fun lt!179315 () (_ BitVec 64))

(assert (=> b!117113 (= lt!179311 (readNLeastSignificantBitsLoopPure!0 (_1!5132 lt!179319) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!179315))))

(declare-fun lt!179294 () Unit!7187)

(declare-fun lt!179285 () Unit!7187)

(assert (=> b!117113 (= lt!179294 lt!179285)))

(declare-fun lt!179304 () (_ BitVec 64))

(assert (=> b!117113 (validate_offset_bits!1 ((_ sign_extend 32) (size!2391 (buf!2801 (_2!5129 lt!179287)))) ((_ sign_extend 32) (currentByte!5438 (_2!5129 lt!178465))) ((_ sign_extend 32) (currentBit!5433 (_2!5129 lt!178465))) lt!179304)))

(assert (=> b!117113 (= lt!179285 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5129 lt!178465) (buf!2801 (_2!5129 lt!179287)) lt!179304))))

(declare-fun e!76763 () Bool)

(assert (=> b!117113 e!76763))

(declare-fun res!96861 () Bool)

(assert (=> b!117113 (=> (not res!96861) (not e!76763))))

(assert (=> b!117113 (= res!96861 (and (= (size!2391 (buf!2801 (_2!5129 lt!178465))) (size!2391 (buf!2801 (_2!5129 lt!179287)))) (bvsge lt!179304 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117113 (= lt!179304 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!117113 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117113 (= lt!179315 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!117113 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!117113 (= lt!179319 (reader!0 (_2!5129 lt!178465) (_2!5129 lt!179287)))))

(declare-fun b!117114 () Bool)

(declare-fun e!76761 () (_ BitVec 64))

(assert (=> b!117114 (= e!76761 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!117115 () Bool)

(declare-fun lt!179318 () Unit!7187)

(assert (=> b!117115 (= e!76762 (tuple2!9729 lt!179318 (_2!5129 lt!178465)))))

(declare-fun lt!179291 () BitStream!4256)

(assert (=> b!117115 (= lt!179291 (_2!5129 lt!178465))))

(assert (=> b!117115 (= lt!179318 (lemmaIsPrefixRefl!0 lt!179291))))

(declare-fun call!1517 () Bool)

(assert (=> b!117115 call!1517))

(declare-fun b!117116 () Bool)

(declare-fun lt!179290 () tuple2!9730)

(declare-fun lt!179317 () tuple2!9728)

(assert (=> b!117116 (= lt!179290 (readBitPure!0 (readerFrom!0 (_2!5129 lt!179317) (currentBit!5433 (_2!5129 lt!178465)) (currentByte!5438 (_2!5129 lt!178465)))))))

(declare-fun lt!179286 () Bool)

(declare-fun res!96860 () Bool)

(assert (=> b!117116 (= res!96860 (and (= (_2!5130 lt!179290) lt!179286) (= (_1!5130 lt!179290) (_2!5129 lt!179317))))))

(declare-fun e!76760 () Bool)

(assert (=> b!117116 (=> (not res!96860) (not e!76760))))

(declare-fun e!76764 () Bool)

(assert (=> b!117116 (= e!76764 e!76760)))

(declare-fun b!117117 () Bool)

(declare-fun res!96858 () Bool)

(assert (=> b!117117 (= res!96858 (isPrefixOf!0 (_2!5129 lt!178465) (_2!5129 lt!179317)))))

(assert (=> b!117117 (=> (not res!96858) (not e!76764))))

(declare-fun bm!1514 () Bool)

(declare-fun lt!179303 () tuple2!9728)

(assert (=> bm!1514 (= call!1517 (isPrefixOf!0 (ite c!7058 (_2!5129 lt!178465) lt!179291) (ite c!7058 (_2!5129 lt!179303) lt!179291)))))

(declare-fun b!117118 () Bool)

(assert (=> b!117118 (= e!76760 (= (bitIndex!0 (size!2391 (buf!2801 (_1!5130 lt!179290))) (currentByte!5438 (_1!5130 lt!179290)) (currentBit!5433 (_1!5130 lt!179290))) (bitIndex!0 (size!2391 (buf!2801 (_2!5129 lt!179317))) (currentByte!5438 (_2!5129 lt!179317)) (currentBit!5433 (_2!5129 lt!179317)))))))

(declare-fun b!117119 () Bool)

(declare-fun res!96863 () Bool)

(assert (=> b!117119 (=> (not res!96863) (not e!76765))))

(assert (=> b!117119 (= res!96863 (isPrefixOf!0 (_2!5129 lt!178465) (_2!5129 lt!179287)))))

(declare-fun b!117120 () Bool)

(assert (=> b!117120 (= e!76763 (validate_offset_bits!1 ((_ sign_extend 32) (size!2391 (buf!2801 (_2!5129 lt!178465)))) ((_ sign_extend 32) (currentByte!5438 (_2!5129 lt!178465))) ((_ sign_extend 32) (currentBit!5433 (_2!5129 lt!178465))) lt!179304))))

(declare-fun b!117121 () Bool)

(declare-fun Unit!7206 () Unit!7187)

(assert (=> b!117121 (= e!76762 (tuple2!9729 Unit!7206 (_2!5129 lt!179303)))))

(assert (=> b!117121 (= lt!179286 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!117121 (= lt!179317 (appendBit!0 (_2!5129 lt!178465) lt!179286))))

(declare-fun res!96865 () Bool)

(assert (=> b!117121 (= res!96865 (= (size!2391 (buf!2801 (_2!5129 lt!178465))) (size!2391 (buf!2801 (_2!5129 lt!179317)))))))

(assert (=> b!117121 (=> (not res!96865) (not e!76764))))

(assert (=> b!117121 e!76764))

(declare-fun lt!179300 () tuple2!9728)

(assert (=> b!117121 (= lt!179300 lt!179317)))

(assert (=> b!117121 (= lt!179303 (appendNLeastSignificantBitsLoop!0 (_2!5129 lt!179300) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!179325 () Unit!7187)

(assert (=> b!117121 (= lt!179325 (lemmaIsPrefixTransitive!0 (_2!5129 lt!178465) (_2!5129 lt!179300) (_2!5129 lt!179303)))))

(assert (=> b!117121 call!1517))

(declare-fun lt!179324 () Unit!7187)

(assert (=> b!117121 (= lt!179324 lt!179325)))

(assert (=> b!117121 (invariant!0 (currentBit!5433 (_2!5129 lt!178465)) (currentByte!5438 (_2!5129 lt!178465)) (size!2391 (buf!2801 (_2!5129 lt!179300))))))

(declare-fun lt!179289 () BitStream!4256)

(assert (=> b!117121 (= lt!179289 (BitStream!4257 (buf!2801 (_2!5129 lt!179300)) (currentByte!5438 (_2!5129 lt!178465)) (currentBit!5433 (_2!5129 lt!178465))))))

(assert (=> b!117121 (invariant!0 (currentBit!5433 lt!179289) (currentByte!5438 lt!179289) (size!2391 (buf!2801 (_2!5129 lt!179303))))))

(declare-fun lt!179295 () BitStream!4256)

(assert (=> b!117121 (= lt!179295 (BitStream!4257 (buf!2801 (_2!5129 lt!179303)) (currentByte!5438 lt!179289) (currentBit!5433 lt!179289)))))

(assert (=> b!117121 (= lt!179297 (readBitPure!0 lt!179289))))

(assert (=> b!117121 (= lt!179288 (readBitPure!0 lt!179295))))

(declare-fun lt!179316 () Unit!7187)

(assert (=> b!117121 (= lt!179316 (readBitPrefixLemma!0 lt!179289 (_2!5129 lt!179303)))))

(declare-fun res!96862 () Bool)

(assert (=> b!117121 (= res!96862 (= (bitIndex!0 (size!2391 (buf!2801 (_1!5130 lt!179297))) (currentByte!5438 (_1!5130 lt!179297)) (currentBit!5433 (_1!5130 lt!179297))) (bitIndex!0 (size!2391 (buf!2801 (_1!5130 lt!179288))) (currentByte!5438 (_1!5130 lt!179288)) (currentBit!5433 (_1!5130 lt!179288)))))))

(assert (=> b!117121 (=> (not res!96862) (not e!76766))))

(assert (=> b!117121 e!76766))

(declare-fun lt!179298 () Unit!7187)

