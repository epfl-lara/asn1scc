; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22458 () Bool)

(assert start!22458)

(declare-fun b!113617 () Bool)

(declare-fun e!74539 () Bool)

(declare-fun e!74538 () Bool)

(assert (=> b!113617 (= e!74539 e!74538)))

(declare-fun res!93848 () Bool)

(assert (=> b!113617 (=> (not res!93848) (not e!74538))))

(declare-fun lt!172639 () Bool)

(declare-datatypes ((array!5165 0))(
  ( (array!5166 (arr!2940 (Array (_ BitVec 32) (_ BitVec 8))) (size!2347 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4168 0))(
  ( (BitStream!4169 (buf!2755 array!5165) (currentByte!5341 (_ BitVec 32)) (currentBit!5336 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!9366 0))(
  ( (tuple2!9367 (_1!4945 BitStream!4168) (_2!4945 Bool)) )
))
(declare-fun lt!172638 () tuple2!9366)

(declare-datatypes ((Unit!6979 0))(
  ( (Unit!6980) )
))
(declare-datatypes ((tuple2!9368 0))(
  ( (tuple2!9369 (_1!4946 Unit!6979) (_2!4946 BitStream!4168)) )
))
(declare-fun lt!172640 () tuple2!9368)

(assert (=> b!113617 (= res!93848 (and (= (_2!4945 lt!172638) lt!172639) (= (_1!4945 lt!172638) (_2!4946 lt!172640))))))

(declare-fun thiss!1305 () BitStream!4168)

(declare-fun readBitPure!0 (BitStream!4168) tuple2!9366)

(declare-fun readerFrom!0 (BitStream!4168 (_ BitVec 32) (_ BitVec 32)) BitStream!4168)

(assert (=> b!113617 (= lt!172638 (readBitPure!0 (readerFrom!0 (_2!4946 lt!172640) (currentBit!5336 thiss!1305) (currentByte!5341 thiss!1305))))))

(declare-fun b!113618 () Bool)

(declare-fun res!93842 () Bool)

(assert (=> b!113618 (=> (not res!93842) (not e!74539))))

(declare-fun isPrefixOf!0 (BitStream!4168 BitStream!4168) Bool)

(assert (=> b!113618 (= res!93842 (isPrefixOf!0 thiss!1305 (_2!4946 lt!172640)))))

(declare-fun b!113619 () Bool)

(declare-fun e!74535 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!113619 (= e!74535 (invariant!0 (currentBit!5336 thiss!1305) (currentByte!5341 thiss!1305) (size!2347 (buf!2755 (_2!4946 lt!172640)))))))

(declare-fun res!93846 () Bool)

(declare-fun e!74536 () Bool)

(assert (=> start!22458 (=> (not res!93846) (not e!74536))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!22458 (= res!93846 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22458 e!74536))

(assert (=> start!22458 true))

(declare-fun e!74540 () Bool)

(declare-fun inv!12 (BitStream!4168) Bool)

(assert (=> start!22458 (and (inv!12 thiss!1305) e!74540)))

(declare-fun b!113620 () Bool)

(declare-fun res!93841 () Bool)

(assert (=> b!113620 (=> (not res!93841) (not e!74536))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113620 (= res!93841 (validate_offset_bits!1 ((_ sign_extend 32) (size!2347 (buf!2755 thiss!1305))) ((_ sign_extend 32) (currentByte!5341 thiss!1305)) ((_ sign_extend 32) (currentBit!5336 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!113621 () Bool)

(declare-fun array_inv!2149 (array!5165) Bool)

(assert (=> b!113621 (= e!74540 (array_inv!2149 (buf!2755 thiss!1305)))))

(declare-fun b!113622 () Bool)

(declare-fun lt!172641 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113622 (= e!74538 (= (bitIndex!0 (size!2347 (buf!2755 (_1!4945 lt!172638))) (currentByte!5341 (_1!4945 lt!172638)) (currentBit!5336 (_1!4945 lt!172638))) lt!172641))))

(declare-fun b!113623 () Bool)

(declare-fun res!93843 () Bool)

(assert (=> b!113623 (=> (not res!93843) (not e!74536))))

(assert (=> b!113623 (= res!93843 (bvslt i!615 nBits!396))))

(declare-fun b!113624 () Bool)

(declare-fun lt!172637 () tuple2!9368)

(assert (=> b!113624 (= e!74536 (not (= (size!2347 (buf!2755 (_2!4946 lt!172640))) (size!2347 (buf!2755 (_2!4946 lt!172637))))))))

(assert (=> b!113624 e!74535))

(declare-fun res!93845 () Bool)

(assert (=> b!113624 (=> (not res!93845) (not e!74535))))

(assert (=> b!113624 (= res!93845 (isPrefixOf!0 thiss!1305 (_2!4946 lt!172637)))))

(declare-fun lt!172642 () Unit!6979)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4168 BitStream!4168 BitStream!4168) Unit!6979)

(assert (=> b!113624 (= lt!172642 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4946 lt!172640) (_2!4946 lt!172637)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4168 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9368)

(assert (=> b!113624 (= lt!172637 (appendNLeastSignificantBitsLoop!0 (_2!4946 lt!172640) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!74541 () Bool)

(assert (=> b!113624 e!74541))

(declare-fun res!93847 () Bool)

(assert (=> b!113624 (=> (not res!93847) (not e!74541))))

(assert (=> b!113624 (= res!93847 (= (size!2347 (buf!2755 thiss!1305)) (size!2347 (buf!2755 (_2!4946 lt!172640)))))))

(declare-fun appendBit!0 (BitStream!4168 Bool) tuple2!9368)

(assert (=> b!113624 (= lt!172640 (appendBit!0 thiss!1305 lt!172639))))

(assert (=> b!113624 (= lt!172639 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113625 () Bool)

(declare-fun res!93844 () Bool)

(assert (=> b!113625 (=> (not res!93844) (not e!74536))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113625 (= res!93844 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113626 () Bool)

(assert (=> b!113626 (= e!74541 e!74539)))

(declare-fun res!93840 () Bool)

(assert (=> b!113626 (=> (not res!93840) (not e!74539))))

(declare-fun lt!172643 () (_ BitVec 64))

(assert (=> b!113626 (= res!93840 (= lt!172641 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!172643)))))

(assert (=> b!113626 (= lt!172641 (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!172640))) (currentByte!5341 (_2!4946 lt!172640)) (currentBit!5336 (_2!4946 lt!172640))))))

(assert (=> b!113626 (= lt!172643 (bitIndex!0 (size!2347 (buf!2755 thiss!1305)) (currentByte!5341 thiss!1305) (currentBit!5336 thiss!1305)))))

(assert (= (and start!22458 res!93846) b!113620))

(assert (= (and b!113620 res!93841) b!113625))

(assert (= (and b!113625 res!93844) b!113623))

(assert (= (and b!113623 res!93843) b!113624))

(assert (= (and b!113624 res!93847) b!113626))

(assert (= (and b!113626 res!93840) b!113618))

(assert (= (and b!113618 res!93842) b!113617))

(assert (= (and b!113617 res!93848) b!113622))

(assert (= (and b!113624 res!93845) b!113619))

(assert (= start!22458 b!113621))

(declare-fun m!169747 () Bool)

(assert (=> b!113621 m!169747))

(declare-fun m!169749 () Bool)

(assert (=> b!113624 m!169749))

(declare-fun m!169751 () Bool)

(assert (=> b!113624 m!169751))

(declare-fun m!169753 () Bool)

(assert (=> b!113624 m!169753))

(declare-fun m!169755 () Bool)

(assert (=> b!113624 m!169755))

(declare-fun m!169757 () Bool)

(assert (=> b!113618 m!169757))

(declare-fun m!169759 () Bool)

(assert (=> b!113620 m!169759))

(declare-fun m!169761 () Bool)

(assert (=> b!113622 m!169761))

(declare-fun m!169763 () Bool)

(assert (=> b!113619 m!169763))

(declare-fun m!169765 () Bool)

(assert (=> b!113626 m!169765))

(declare-fun m!169767 () Bool)

(assert (=> b!113626 m!169767))

(declare-fun m!169769 () Bool)

(assert (=> b!113625 m!169769))

(declare-fun m!169771 () Bool)

(assert (=> start!22458 m!169771))

(declare-fun m!169773 () Bool)

(assert (=> b!113617 m!169773))

(assert (=> b!113617 m!169773))

(declare-fun m!169775 () Bool)

(assert (=> b!113617 m!169775))

(push 1)

(assert (not b!113618))

(assert (not b!113621))

(assert (not b!113625))

(assert (not b!113617))

(assert (not b!113622))

(assert (not b!113626))

(assert (not start!22458))

(assert (not b!113624))

(assert (not b!113619))

(assert (not b!113620))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!36502 () Bool)

(declare-fun res!93922 () Bool)

(declare-fun e!74597 () Bool)

(assert (=> d!36502 (=> (not res!93922) (not e!74597))))

(assert (=> d!36502 (= res!93922 (= (size!2347 (buf!2755 thiss!1305)) (size!2347 (buf!2755 (_2!4946 lt!172640)))))))

(assert (=> d!36502 (= (isPrefixOf!0 thiss!1305 (_2!4946 lt!172640)) e!74597)))

(declare-fun b!113705 () Bool)

(declare-fun res!93923 () Bool)

(assert (=> b!113705 (=> (not res!93923) (not e!74597))))

(assert (=> b!113705 (= res!93923 (bvsle (bitIndex!0 (size!2347 (buf!2755 thiss!1305)) (currentByte!5341 thiss!1305) (currentBit!5336 thiss!1305)) (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!172640))) (currentByte!5341 (_2!4946 lt!172640)) (currentBit!5336 (_2!4946 lt!172640)))))))

(declare-fun b!113706 () Bool)

(declare-fun e!74598 () Bool)

(assert (=> b!113706 (= e!74597 e!74598)))

(declare-fun res!93924 () Bool)

(assert (=> b!113706 (=> res!93924 e!74598)))

(assert (=> b!113706 (= res!93924 (= (size!2347 (buf!2755 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!113707 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5165 array!5165 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113707 (= e!74598 (arrayBitRangesEq!0 (buf!2755 thiss!1305) (buf!2755 (_2!4946 lt!172640)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2347 (buf!2755 thiss!1305)) (currentByte!5341 thiss!1305) (currentBit!5336 thiss!1305))))))

(assert (= (and d!36502 res!93922) b!113705))

(assert (= (and b!113705 res!93923) b!113706))

(assert (= (and b!113706 (not res!93924)) b!113707))

(assert (=> b!113705 m!169767))

(assert (=> b!113705 m!169765))

(assert (=> b!113707 m!169767))

(assert (=> b!113707 m!169767))

(declare-fun m!169849 () Bool)

(assert (=> b!113707 m!169849))

(assert (=> b!113618 d!36502))

(declare-fun d!36504 () Bool)

(assert (=> d!36504 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5336 thiss!1305) (currentByte!5341 thiss!1305) (size!2347 (buf!2755 thiss!1305))))))

(declare-fun bs!8874 () Bool)

(assert (= bs!8874 d!36504))

(declare-fun m!169851 () Bool)

(assert (=> bs!8874 m!169851))

(assert (=> start!22458 d!36504))

(declare-fun d!36506 () Bool)

(declare-datatypes ((tuple2!9386 0))(
  ( (tuple2!9387 (_1!4955 Bool) (_2!4955 BitStream!4168)) )
))
(declare-fun lt!172694 () tuple2!9386)

(declare-fun readBit!0 (BitStream!4168) tuple2!9386)

(assert (=> d!36506 (= lt!172694 (readBit!0 (readerFrom!0 (_2!4946 lt!172640) (currentBit!5336 thiss!1305) (currentByte!5341 thiss!1305))))))

(assert (=> d!36506 (= (readBitPure!0 (readerFrom!0 (_2!4946 lt!172640) (currentBit!5336 thiss!1305) (currentByte!5341 thiss!1305))) (tuple2!9367 (_2!4955 lt!172694) (_1!4955 lt!172694)))))

(declare-fun bs!8875 () Bool)

(assert (= bs!8875 d!36506))

(assert (=> bs!8875 m!169773))

(declare-fun m!169853 () Bool)

(assert (=> bs!8875 m!169853))

(assert (=> b!113617 d!36506))

(declare-fun d!36508 () Bool)

(declare-fun e!74601 () Bool)

(assert (=> d!36508 e!74601))

(declare-fun res!93928 () Bool)

(assert (=> d!36508 (=> (not res!93928) (not e!74601))))

(assert (=> d!36508 (= res!93928 (invariant!0 (currentBit!5336 (_2!4946 lt!172640)) (currentByte!5341 (_2!4946 lt!172640)) (size!2347 (buf!2755 (_2!4946 lt!172640)))))))

(assert (=> d!36508 (= (readerFrom!0 (_2!4946 lt!172640) (currentBit!5336 thiss!1305) (currentByte!5341 thiss!1305)) (BitStream!4169 (buf!2755 (_2!4946 lt!172640)) (currentByte!5341 thiss!1305) (currentBit!5336 thiss!1305)))))

(declare-fun b!113710 () Bool)

(assert (=> b!113710 (= e!74601 (invariant!0 (currentBit!5336 thiss!1305) (currentByte!5341 thiss!1305) (size!2347 (buf!2755 (_2!4946 lt!172640)))))))

(assert (= (and d!36508 res!93928) b!113710))

(declare-fun m!169855 () Bool)

(assert (=> d!36508 m!169855))

(assert (=> b!113710 m!169763))

(assert (=> b!113617 d!36508))

(declare-fun d!36510 () Bool)

(assert (=> d!36510 (= (invariant!0 (currentBit!5336 thiss!1305) (currentByte!5341 thiss!1305) (size!2347 (buf!2755 (_2!4946 lt!172640)))) (and (bvsge (currentBit!5336 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5336 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5341 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5341 thiss!1305) (size!2347 (buf!2755 (_2!4946 lt!172640)))) (and (= (currentBit!5336 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5341 thiss!1305) (size!2347 (buf!2755 (_2!4946 lt!172640))))))))))

(assert (=> b!113619 d!36510))

(declare-fun d!36512 () Bool)

(declare-fun res!93929 () Bool)

(declare-fun e!74602 () Bool)

(assert (=> d!36512 (=> (not res!93929) (not e!74602))))

(assert (=> d!36512 (= res!93929 (= (size!2347 (buf!2755 thiss!1305)) (size!2347 (buf!2755 (_2!4946 lt!172637)))))))

(assert (=> d!36512 (= (isPrefixOf!0 thiss!1305 (_2!4946 lt!172637)) e!74602)))

(declare-fun b!113711 () Bool)

(declare-fun res!93930 () Bool)

(assert (=> b!113711 (=> (not res!93930) (not e!74602))))

(assert (=> b!113711 (= res!93930 (bvsle (bitIndex!0 (size!2347 (buf!2755 thiss!1305)) (currentByte!5341 thiss!1305) (currentBit!5336 thiss!1305)) (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!172637))) (currentByte!5341 (_2!4946 lt!172637)) (currentBit!5336 (_2!4946 lt!172637)))))))

(declare-fun b!113712 () Bool)

(declare-fun e!74603 () Bool)

(assert (=> b!113712 (= e!74602 e!74603)))

(declare-fun res!93931 () Bool)

(assert (=> b!113712 (=> res!93931 e!74603)))

(assert (=> b!113712 (= res!93931 (= (size!2347 (buf!2755 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!113713 () Bool)

(assert (=> b!113713 (= e!74603 (arrayBitRangesEq!0 (buf!2755 thiss!1305) (buf!2755 (_2!4946 lt!172637)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2347 (buf!2755 thiss!1305)) (currentByte!5341 thiss!1305) (currentBit!5336 thiss!1305))))))

(assert (= (and d!36512 res!93929) b!113711))

(assert (= (and b!113711 res!93930) b!113712))

(assert (= (and b!113712 (not res!93931)) b!113713))

(assert (=> b!113711 m!169767))

(declare-fun m!169857 () Bool)

(assert (=> b!113711 m!169857))

(assert (=> b!113713 m!169767))

(assert (=> b!113713 m!169767))

(declare-fun m!169859 () Bool)

(assert (=> b!113713 m!169859))

(assert (=> b!113624 d!36512))

(declare-fun d!36516 () Bool)

(assert (=> d!36516 (isPrefixOf!0 thiss!1305 (_2!4946 lt!172637))))

(declare-fun lt!172699 () Unit!6979)

(declare-fun choose!30 (BitStream!4168 BitStream!4168 BitStream!4168) Unit!6979)

(assert (=> d!36516 (= lt!172699 (choose!30 thiss!1305 (_2!4946 lt!172640) (_2!4946 lt!172637)))))

(assert (=> d!36516 (isPrefixOf!0 thiss!1305 (_2!4946 lt!172640))))

(assert (=> d!36516 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4946 lt!172640) (_2!4946 lt!172637)) lt!172699)))

(declare-fun bs!8876 () Bool)

(assert (= bs!8876 d!36516))

(assert (=> bs!8876 m!169749))

(declare-fun m!169861 () Bool)

(assert (=> bs!8876 m!169861))

(assert (=> bs!8876 m!169757))

(assert (=> b!113624 d!36516))

(declare-fun b!113869 () Bool)

(declare-fun res!94059 () Bool)

(declare-fun lt!173163 () tuple2!9368)

(assert (=> b!113869 (= res!94059 (= (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!173163))) (currentByte!5341 (_2!4946 lt!173163)) (currentBit!5336 (_2!4946 lt!173163))) (bvadd (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!172640))) (currentByte!5341 (_2!4946 lt!172640)) (currentBit!5336 (_2!4946 lt!172640))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun e!74695 () Bool)

(assert (=> b!113869 (=> (not res!94059) (not e!74695))))

(declare-fun b!113870 () Bool)

(declare-fun e!74692 () Bool)

(declare-fun lt!173141 () (_ BitVec 64))

(assert (=> b!113870 (= e!74692 (validate_offset_bits!1 ((_ sign_extend 32) (size!2347 (buf!2755 (_2!4946 lt!172640)))) ((_ sign_extend 32) (currentByte!5341 (_2!4946 lt!172640))) ((_ sign_extend 32) (currentBit!5336 (_2!4946 lt!172640))) lt!173141))))

(declare-fun b!113871 () Bool)

(declare-datatypes ((tuple2!9388 0))(
  ( (tuple2!9389 (_1!4956 BitStream!4168) (_2!4956 (_ BitVec 64))) )
))
(declare-fun lt!173166 () tuple2!9388)

(declare-fun e!74694 () Bool)

(declare-datatypes ((tuple2!9390 0))(
  ( (tuple2!9391 (_1!4957 BitStream!4168) (_2!4957 BitStream!4168)) )
))
(declare-fun lt!173153 () tuple2!9390)

(assert (=> b!113871 (= e!74694 (and (= (_2!4956 lt!173166) v!199) (= (_1!4956 lt!173166) (_2!4957 lt!173153))))))

(declare-fun lt!173138 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4168 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!9388)

(assert (=> b!113871 (= lt!173166 (readNLeastSignificantBitsLoopPure!0 (_1!4957 lt!173153) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173138))))

(declare-fun lt!173171 () Unit!6979)

(declare-fun lt!173144 () Unit!6979)

(assert (=> b!113871 (= lt!173171 lt!173144)))

(declare-fun lt!173137 () tuple2!9368)

(assert (=> b!113871 (validate_offset_bits!1 ((_ sign_extend 32) (size!2347 (buf!2755 (_2!4946 lt!173137)))) ((_ sign_extend 32) (currentByte!5341 (_2!4946 lt!172640))) ((_ sign_extend 32) (currentBit!5336 (_2!4946 lt!172640))) lt!173141)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4168 array!5165 (_ BitVec 64)) Unit!6979)

(assert (=> b!113871 (= lt!173144 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4946 lt!172640) (buf!2755 (_2!4946 lt!173137)) lt!173141))))

(assert (=> b!113871 e!74692))

(declare-fun res!94057 () Bool)

(assert (=> b!113871 (=> (not res!94057) (not e!74692))))

(assert (=> b!113871 (= res!94057 (and (= (size!2347 (buf!2755 (_2!4946 lt!172640))) (size!2347 (buf!2755 (_2!4946 lt!173137)))) (bvsge lt!173141 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113871 (= lt!173141 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!113871 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113871 (= lt!173138 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!113871 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!4168 BitStream!4168) tuple2!9390)

(assert (=> b!113871 (= lt!173153 (reader!0 (_2!4946 lt!172640) (_2!4946 lt!173137)))))

(declare-fun b!113872 () Bool)

(declare-fun e!74689 () (_ BitVec 64))

(assert (=> b!113872 (= e!74689 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(declare-fun b!113873 () Bool)

(declare-fun e!74690 () Bool)

(declare-fun lt!173179 () tuple2!9366)

(declare-fun lt!173170 () tuple2!9366)

(assert (=> b!113873 (= e!74690 (= (_2!4945 lt!173179) (_2!4945 lt!173170)))))

(declare-fun b!113874 () Bool)

(declare-fun res!94058 () Bool)

(assert (=> b!113874 (= res!94058 (isPrefixOf!0 (_2!4946 lt!172640) (_2!4946 lt!173163)))))

(assert (=> b!113874 (=> (not res!94058) (not e!74695))))

(declare-fun b!113875 () Bool)

(declare-fun res!94063 () Bool)

(assert (=> b!113875 (=> (not res!94063) (not e!74694))))

(declare-fun lt!173151 () (_ BitVec 64))

(declare-fun lt!173173 () (_ BitVec 64))

(assert (=> b!113875 (= res!94063 (= (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!173137))) (currentByte!5341 (_2!4946 lt!173137)) (currentBit!5336 (_2!4946 lt!173137))) (bvadd lt!173173 lt!173151)))))

(assert (=> b!113875 (or (not (= (bvand lt!173173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173151 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!173173 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!173173 lt!173151) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113875 (= lt!173151 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!113875 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!113875 (= lt!173173 (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!172640))) (currentByte!5341 (_2!4946 lt!172640)) (currentBit!5336 (_2!4946 lt!172640))))))

(declare-fun d!36520 () Bool)

(assert (=> d!36520 e!74694))

(declare-fun res!94061 () Bool)

(assert (=> d!36520 (=> (not res!94061) (not e!74694))))

(assert (=> d!36520 (= res!94061 (= (size!2347 (buf!2755 (_2!4946 lt!172640))) (size!2347 (buf!2755 (_2!4946 lt!173137)))))))

(declare-fun e!74691 () tuple2!9368)

(assert (=> d!36520 (= lt!173137 e!74691)))

(declare-fun c!6906 () Bool)

(assert (=> d!36520 (= c!6906 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!36520 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!36520 (= (appendNLeastSignificantBitsLoop!0 (_2!4946 lt!172640) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!173137)))

(declare-fun b!113876 () Bool)

(declare-fun lt!173142 () Unit!6979)

(assert (=> b!113876 (= e!74691 (tuple2!9369 lt!173142 (_2!4946 lt!172640)))))

(declare-fun lt!173147 () BitStream!4168)

(assert (=> b!113876 (= lt!173147 (_2!4946 lt!172640))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4168) Unit!6979)

(assert (=> b!113876 (= lt!173142 (lemmaIsPrefixRefl!0 lt!173147))))

(declare-fun call!1457 () Bool)

(assert (=> b!113876 call!1457))

(declare-fun bm!1454 () Bool)

(declare-fun lt!173164 () tuple2!9368)

(assert (=> bm!1454 (= call!1457 (isPrefixOf!0 (ite c!6906 (_2!4946 lt!172640) lt!173147) (ite c!6906 (_2!4946 lt!173164) lt!173147)))))

(declare-fun b!113877 () Bool)

(assert (=> b!113877 (= e!74689 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!113878 () Bool)

(declare-fun res!94060 () Bool)

(assert (=> b!113878 (=> (not res!94060) (not e!74694))))

(assert (=> b!113878 (= res!94060 (isPrefixOf!0 (_2!4946 lt!172640) (_2!4946 lt!173137)))))

(declare-fun b!113879 () Bool)

(declare-fun e!74693 () Bool)

(declare-fun lt!173143 () tuple2!9366)

(assert (=> b!113879 (= e!74693 (= (bitIndex!0 (size!2347 (buf!2755 (_1!4945 lt!173143))) (currentByte!5341 (_1!4945 lt!173143)) (currentBit!5336 (_1!4945 lt!173143))) (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!173163))) (currentByte!5341 (_2!4946 lt!173163)) (currentBit!5336 (_2!4946 lt!173163)))))))

(declare-fun b!113880 () Bool)

(declare-fun Unit!6991 () Unit!6979)

(assert (=> b!113880 (= e!74691 (tuple2!9369 Unit!6991 (_2!4946 lt!173164)))))

(declare-fun lt!173168 () Bool)

(assert (=> b!113880 (= lt!173168 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113880 (= lt!173163 (appendBit!0 (_2!4946 lt!172640) lt!173168))))

(declare-fun res!94055 () Bool)

(assert (=> b!113880 (= res!94055 (= (size!2347 (buf!2755 (_2!4946 lt!172640))) (size!2347 (buf!2755 (_2!4946 lt!173163)))))))

(assert (=> b!113880 (=> (not res!94055) (not e!74695))))

(assert (=> b!113880 e!74695))

(declare-fun lt!173158 () tuple2!9368)

(assert (=> b!113880 (= lt!173158 lt!173163)))

(assert (=> b!113880 (= lt!173164 (appendNLeastSignificantBitsLoop!0 (_2!4946 lt!173158) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!173152 () Unit!6979)

(assert (=> b!113880 (= lt!173152 (lemmaIsPrefixTransitive!0 (_2!4946 lt!172640) (_2!4946 lt!173158) (_2!4946 lt!173164)))))

(assert (=> b!113880 call!1457))

(declare-fun lt!173149 () Unit!6979)

(assert (=> b!113880 (= lt!173149 lt!173152)))

(assert (=> b!113880 (invariant!0 (currentBit!5336 (_2!4946 lt!172640)) (currentByte!5341 (_2!4946 lt!172640)) (size!2347 (buf!2755 (_2!4946 lt!173158))))))

(declare-fun lt!173157 () BitStream!4168)

(assert (=> b!113880 (= lt!173157 (BitStream!4169 (buf!2755 (_2!4946 lt!173158)) (currentByte!5341 (_2!4946 lt!172640)) (currentBit!5336 (_2!4946 lt!172640))))))

(assert (=> b!113880 (invariant!0 (currentBit!5336 lt!173157) (currentByte!5341 lt!173157) (size!2347 (buf!2755 (_2!4946 lt!173164))))))

(declare-fun lt!173154 () BitStream!4168)

(assert (=> b!113880 (= lt!173154 (BitStream!4169 (buf!2755 (_2!4946 lt!173164)) (currentByte!5341 lt!173157) (currentBit!5336 lt!173157)))))

(assert (=> b!113880 (= lt!173179 (readBitPure!0 lt!173157))))

(assert (=> b!113880 (= lt!173170 (readBitPure!0 lt!173154))))

(declare-fun lt!173140 () Unit!6979)

(declare-fun readBitPrefixLemma!0 (BitStream!4168 BitStream!4168) Unit!6979)

(assert (=> b!113880 (= lt!173140 (readBitPrefixLemma!0 lt!173157 (_2!4946 lt!173164)))))

(declare-fun res!94056 () Bool)

(assert (=> b!113880 (= res!94056 (= (bitIndex!0 (size!2347 (buf!2755 (_1!4945 lt!173179))) (currentByte!5341 (_1!4945 lt!173179)) (currentBit!5336 (_1!4945 lt!173179))) (bitIndex!0 (size!2347 (buf!2755 (_1!4945 lt!173170))) (currentByte!5341 (_1!4945 lt!173170)) (currentBit!5336 (_1!4945 lt!173170)))))))

(assert (=> b!113880 (=> (not res!94056) (not e!74690))))

(assert (=> b!113880 e!74690))

(declare-fun lt!173160 () Unit!6979)

(assert (=> b!113880 (= lt!173160 lt!173140)))

(declare-fun lt!173172 () tuple2!9390)

(assert (=> b!113880 (= lt!173172 (reader!0 (_2!4946 lt!172640) (_2!4946 lt!173164)))))

(declare-fun lt!173165 () tuple2!9390)

(assert (=> b!113880 (= lt!173165 (reader!0 (_2!4946 lt!173158) (_2!4946 lt!173164)))))

(declare-fun lt!173156 () tuple2!9366)

(assert (=> b!113880 (= lt!173156 (readBitPure!0 (_1!4957 lt!173172)))))

(assert (=> b!113880 (= (_2!4945 lt!173156) lt!173168)))

(declare-fun lt!173175 () Unit!6979)

(declare-fun Unit!6992 () Unit!6979)

(assert (=> b!113880 (= lt!173175 Unit!6992)))

(declare-fun lt!173155 () (_ BitVec 64))

(assert (=> b!113880 (= lt!173155 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!173169 () (_ BitVec 64))

(assert (=> b!113880 (= lt!173169 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!173162 () Unit!6979)

(assert (=> b!113880 (= lt!173162 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4946 lt!172640) (buf!2755 (_2!4946 lt!173164)) lt!173169))))

(assert (=> b!113880 (validate_offset_bits!1 ((_ sign_extend 32) (size!2347 (buf!2755 (_2!4946 lt!173164)))) ((_ sign_extend 32) (currentByte!5341 (_2!4946 lt!172640))) ((_ sign_extend 32) (currentBit!5336 (_2!4946 lt!172640))) lt!173169)))

(declare-fun lt!173146 () Unit!6979)

(assert (=> b!113880 (= lt!173146 lt!173162)))

(declare-fun lt!173180 () tuple2!9388)

(assert (=> b!113880 (= lt!173180 (readNLeastSignificantBitsLoopPure!0 (_1!4957 lt!173172) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173155))))

(declare-fun lt!173150 () (_ BitVec 64))

(assert (=> b!113880 (= lt!173150 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!173145 () Unit!6979)

(assert (=> b!113880 (= lt!173145 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!4946 lt!173158) (buf!2755 (_2!4946 lt!173164)) lt!173150))))

(assert (=> b!113880 (validate_offset_bits!1 ((_ sign_extend 32) (size!2347 (buf!2755 (_2!4946 lt!173164)))) ((_ sign_extend 32) (currentByte!5341 (_2!4946 lt!173158))) ((_ sign_extend 32) (currentBit!5336 (_2!4946 lt!173158))) lt!173150)))

(declare-fun lt!173136 () Unit!6979)

(assert (=> b!113880 (= lt!173136 lt!173145)))

(declare-fun lt!173174 () tuple2!9388)

(assert (=> b!113880 (= lt!173174 (readNLeastSignificantBitsLoopPure!0 (_1!4957 lt!173165) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!173155 (ite (_2!4945 lt!173156) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!173178 () tuple2!9388)

(assert (=> b!113880 (= lt!173178 (readNLeastSignificantBitsLoopPure!0 (_1!4957 lt!173172) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173155))))

(declare-fun c!6907 () Bool)

(assert (=> b!113880 (= c!6907 (_2!4945 (readBitPure!0 (_1!4957 lt!173172))))))

(declare-fun lt!173161 () tuple2!9388)

(declare-fun withMovedBitIndex!0 (BitStream!4168 (_ BitVec 64)) BitStream!4168)

(assert (=> b!113880 (= lt!173161 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!4957 lt!173172) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!173155 e!74689)))))

(declare-fun lt!173176 () Unit!6979)

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4168 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!6979)

(assert (=> b!113880 (= lt!173176 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!4957 lt!173172) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!173155))))

(assert (=> b!113880 (and (= (_2!4956 lt!173178) (_2!4956 lt!173161)) (= (_1!4956 lt!173178) (_1!4956 lt!173161)))))

(declare-fun lt!173177 () Unit!6979)

(assert (=> b!113880 (= lt!173177 lt!173176)))

(assert (=> b!113880 (= (_1!4957 lt!173172) (withMovedBitIndex!0 (_2!4957 lt!173172) (bvsub (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!172640))) (currentByte!5341 (_2!4946 lt!172640)) (currentBit!5336 (_2!4946 lt!172640))) (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!173164))) (currentByte!5341 (_2!4946 lt!173164)) (currentBit!5336 (_2!4946 lt!173164))))))))

(declare-fun lt!173167 () Unit!6979)

(declare-fun Unit!6994 () Unit!6979)

(assert (=> b!113880 (= lt!173167 Unit!6994)))

(assert (=> b!113880 (= (_1!4957 lt!173165) (withMovedBitIndex!0 (_2!4957 lt!173165) (bvsub (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!173158))) (currentByte!5341 (_2!4946 lt!173158)) (currentBit!5336 (_2!4946 lt!173158))) (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!173164))) (currentByte!5341 (_2!4946 lt!173164)) (currentBit!5336 (_2!4946 lt!173164))))))))

(declare-fun lt!173159 () Unit!6979)

(declare-fun Unit!6995 () Unit!6979)

(assert (=> b!113880 (= lt!173159 Unit!6995)))

(assert (=> b!113880 (= (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!172640))) (currentByte!5341 (_2!4946 lt!172640)) (currentBit!5336 (_2!4946 lt!172640))) (bvsub (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!173158))) (currentByte!5341 (_2!4946 lt!173158)) (currentBit!5336 (_2!4946 lt!173158))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!173148 () Unit!6979)

(declare-fun Unit!6996 () Unit!6979)

(assert (=> b!113880 (= lt!173148 Unit!6996)))

(assert (=> b!113880 (= (_2!4956 lt!173180) (_2!4956 lt!173174))))

(declare-fun lt!173139 () Unit!6979)

(declare-fun Unit!6997 () Unit!6979)

(assert (=> b!113880 (= lt!173139 Unit!6997)))

(assert (=> b!113880 (= (_1!4956 lt!173180) (_2!4957 lt!173172))))

(declare-fun b!113881 () Bool)

(assert (=> b!113881 (= lt!173143 (readBitPure!0 (readerFrom!0 (_2!4946 lt!173163) (currentBit!5336 (_2!4946 lt!172640)) (currentByte!5341 (_2!4946 lt!172640)))))))

(declare-fun res!94062 () Bool)

(assert (=> b!113881 (= res!94062 (and (= (_2!4945 lt!173143) lt!173168) (= (_1!4945 lt!173143) (_2!4946 lt!173163))))))

(assert (=> b!113881 (=> (not res!94062) (not e!74693))))

(assert (=> b!113881 (= e!74695 e!74693)))

(assert (= (and d!36520 c!6906) b!113880))

(assert (= (and d!36520 (not c!6906)) b!113876))

(assert (= (and b!113880 res!94055) b!113869))

(assert (= (and b!113869 res!94059) b!113874))

(assert (= (and b!113874 res!94058) b!113881))

(assert (= (and b!113881 res!94062) b!113879))

(assert (= (and b!113880 res!94056) b!113873))

(assert (= (and b!113880 c!6907) b!113872))

(assert (= (and b!113880 (not c!6907)) b!113877))

(assert (= (or b!113880 b!113876) bm!1454))

(assert (= (and d!36520 res!94061) b!113875))

(assert (= (and b!113875 res!94063) b!113878))

(assert (= (and b!113878 res!94060) b!113871))

(assert (= (and b!113871 res!94057) b!113870))

(declare-fun m!170073 () Bool)

(assert (=> b!113875 m!170073))

(assert (=> b!113875 m!169765))

(declare-fun m!170075 () Bool)

(assert (=> b!113870 m!170075))

(declare-fun m!170077 () Bool)

(assert (=> b!113876 m!170077))

(declare-fun m!170079 () Bool)

(assert (=> b!113881 m!170079))

(assert (=> b!113881 m!170079))

(declare-fun m!170081 () Bool)

(assert (=> b!113881 m!170081))

(declare-fun m!170083 () Bool)

(assert (=> b!113874 m!170083))

(declare-fun m!170085 () Bool)

(assert (=> b!113871 m!170085))

(declare-fun m!170087 () Bool)

(assert (=> b!113871 m!170087))

(declare-fun m!170089 () Bool)

(assert (=> b!113871 m!170089))

(declare-fun m!170091 () Bool)

(assert (=> b!113871 m!170091))

(declare-fun m!170093 () Bool)

(assert (=> b!113871 m!170093))

(declare-fun m!170095 () Bool)

(assert (=> b!113880 m!170095))

(declare-fun m!170097 () Bool)

(assert (=> b!113880 m!170097))

(declare-fun m!170099 () Bool)

(assert (=> b!113880 m!170099))

(declare-fun m!170101 () Bool)

(assert (=> b!113880 m!170101))

(assert (=> b!113880 m!169765))

(declare-fun m!170103 () Bool)

(assert (=> b!113880 m!170103))

(assert (=> b!113880 m!170087))

(declare-fun m!170105 () Bool)

(assert (=> b!113880 m!170105))

(declare-fun m!170107 () Bool)

(assert (=> b!113880 m!170107))

(declare-fun m!170109 () Bool)

(assert (=> b!113880 m!170109))

(declare-fun m!170111 () Bool)

(assert (=> b!113880 m!170111))

(declare-fun m!170113 () Bool)

(assert (=> b!113880 m!170113))

(declare-fun m!170115 () Bool)

(assert (=> b!113880 m!170115))

(declare-fun m!170117 () Bool)

(assert (=> b!113880 m!170117))

(declare-fun m!170119 () Bool)

(assert (=> b!113880 m!170119))

(declare-fun m!170121 () Bool)

(assert (=> b!113880 m!170121))

(declare-fun m!170123 () Bool)

(assert (=> b!113880 m!170123))

(declare-fun m!170125 () Bool)

(assert (=> b!113880 m!170125))

(declare-fun m!170127 () Bool)

(assert (=> b!113880 m!170127))

(declare-fun m!170129 () Bool)

(assert (=> b!113880 m!170129))

(declare-fun m!170131 () Bool)

(assert (=> b!113880 m!170131))

(declare-fun m!170133 () Bool)

(assert (=> b!113880 m!170133))

(declare-fun m!170135 () Bool)

(assert (=> b!113880 m!170135))

(declare-fun m!170137 () Bool)

(assert (=> b!113880 m!170137))

(assert (=> b!113880 m!170105))

(declare-fun m!170139 () Bool)

(assert (=> b!113880 m!170139))

(declare-fun m!170141 () Bool)

(assert (=> b!113880 m!170141))

(declare-fun m!170143 () Bool)

(assert (=> b!113880 m!170143))

(declare-fun m!170145 () Bool)

(assert (=> b!113880 m!170145))

(declare-fun m!170147 () Bool)

(assert (=> bm!1454 m!170147))

(declare-fun m!170149 () Bool)

(assert (=> b!113869 m!170149))

(assert (=> b!113869 m!169765))

(declare-fun m!170151 () Bool)

(assert (=> b!113878 m!170151))

(declare-fun m!170153 () Bool)

(assert (=> b!113879 m!170153))

(assert (=> b!113879 m!170149))

(assert (=> b!113624 d!36520))

(declare-fun b!113905 () Bool)

(declare-fun res!94084 () Bool)

(declare-fun e!74707 () Bool)

(assert (=> b!113905 (=> (not res!94084) (not e!74707))))

(declare-fun lt!173203 () tuple2!9368)

(assert (=> b!113905 (= res!94084 (isPrefixOf!0 thiss!1305 (_2!4946 lt!173203)))))

(declare-fun b!113907 () Bool)

(declare-fun e!74706 () Bool)

(declare-fun lt!173202 () tuple2!9366)

(assert (=> b!113907 (= e!74706 (= (bitIndex!0 (size!2347 (buf!2755 (_1!4945 lt!173202))) (currentByte!5341 (_1!4945 lt!173202)) (currentBit!5336 (_1!4945 lt!173202))) (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!173203))) (currentByte!5341 (_2!4946 lt!173203)) (currentBit!5336 (_2!4946 lt!173203)))))))

(declare-fun d!36560 () Bool)

(assert (=> d!36560 e!74707))

(declare-fun res!94086 () Bool)

(assert (=> d!36560 (=> (not res!94086) (not e!74707))))

(assert (=> d!36560 (= res!94086 (= (size!2347 (buf!2755 thiss!1305)) (size!2347 (buf!2755 (_2!4946 lt!173203)))))))

(declare-fun choose!16 (BitStream!4168 Bool) tuple2!9368)

(assert (=> d!36560 (= lt!173203 (choose!16 thiss!1305 lt!172639))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!36560 (validate_offset_bit!0 ((_ sign_extend 32) (size!2347 (buf!2755 thiss!1305))) ((_ sign_extend 32) (currentByte!5341 thiss!1305)) ((_ sign_extend 32) (currentBit!5336 thiss!1305)))))

(assert (=> d!36560 (= (appendBit!0 thiss!1305 lt!172639) lt!173203)))

(declare-fun b!113906 () Bool)

(assert (=> b!113906 (= e!74707 e!74706)))

(declare-fun res!94087 () Bool)

(assert (=> b!113906 (=> (not res!94087) (not e!74706))))

(assert (=> b!113906 (= res!94087 (and (= (_2!4945 lt!173202) lt!172639) (= (_1!4945 lt!173202) (_2!4946 lt!173203))))))

(assert (=> b!113906 (= lt!173202 (readBitPure!0 (readerFrom!0 (_2!4946 lt!173203) (currentBit!5336 thiss!1305) (currentByte!5341 thiss!1305))))))

(declare-fun b!113904 () Bool)

(declare-fun res!94085 () Bool)

(assert (=> b!113904 (=> (not res!94085) (not e!74707))))

(declare-fun lt!173204 () (_ BitVec 64))

(declare-fun lt!173201 () (_ BitVec 64))

(assert (=> b!113904 (= res!94085 (= (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!173203))) (currentByte!5341 (_2!4946 lt!173203)) (currentBit!5336 (_2!4946 lt!173203))) (bvadd lt!173204 lt!173201)))))

(assert (=> b!113904 (or (not (= (bvand lt!173204 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173201 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!173204 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!173204 lt!173201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!113904 (= lt!173201 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!113904 (= lt!173204 (bitIndex!0 (size!2347 (buf!2755 thiss!1305)) (currentByte!5341 thiss!1305) (currentBit!5336 thiss!1305)))))

(assert (= (and d!36560 res!94086) b!113904))

(assert (= (and b!113904 res!94085) b!113905))

(assert (= (and b!113905 res!94084) b!113906))

(assert (= (and b!113906 res!94087) b!113907))

(declare-fun m!170169 () Bool)

(assert (=> d!36560 m!170169))

(declare-fun m!170171 () Bool)

(assert (=> d!36560 m!170171))

(declare-fun m!170173 () Bool)

(assert (=> b!113906 m!170173))

(assert (=> b!113906 m!170173))

(declare-fun m!170175 () Bool)

(assert (=> b!113906 m!170175))

(declare-fun m!170177 () Bool)

(assert (=> b!113904 m!170177))

(assert (=> b!113904 m!169767))

(declare-fun m!170179 () Bool)

(assert (=> b!113905 m!170179))

(declare-fun m!170181 () Bool)

(assert (=> b!113907 m!170181))

(assert (=> b!113907 m!170177))

(assert (=> b!113624 d!36560))

(declare-fun d!36564 () Bool)

(declare-fun e!74710 () Bool)

(assert (=> d!36564 e!74710))

(declare-fun res!94092 () Bool)

(assert (=> d!36564 (=> (not res!94092) (not e!74710))))

(declare-fun lt!173220 () (_ BitVec 64))

(declare-fun lt!173222 () (_ BitVec 64))

(declare-fun lt!173219 () (_ BitVec 64))

(assert (=> d!36564 (= res!94092 (= lt!173219 (bvsub lt!173222 lt!173220)))))

(assert (=> d!36564 (or (= (bvand lt!173222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173220 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173222 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173222 lt!173220) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!36564 (= lt!173220 (remainingBits!0 ((_ sign_extend 32) (size!2347 (buf!2755 (_2!4946 lt!172640)))) ((_ sign_extend 32) (currentByte!5341 (_2!4946 lt!172640))) ((_ sign_extend 32) (currentBit!5336 (_2!4946 lt!172640)))))))

(declare-fun lt!173221 () (_ BitVec 64))

(declare-fun lt!173218 () (_ BitVec 64))

(assert (=> d!36564 (= lt!173222 (bvmul lt!173221 lt!173218))))

(assert (=> d!36564 (or (= lt!173221 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173218 (bvsdiv (bvmul lt!173221 lt!173218) lt!173221)))))

(assert (=> d!36564 (= lt!173218 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36564 (= lt!173221 ((_ sign_extend 32) (size!2347 (buf!2755 (_2!4946 lt!172640)))))))

(assert (=> d!36564 (= lt!173219 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5341 (_2!4946 lt!172640))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5336 (_2!4946 lt!172640)))))))

(assert (=> d!36564 (invariant!0 (currentBit!5336 (_2!4946 lt!172640)) (currentByte!5341 (_2!4946 lt!172640)) (size!2347 (buf!2755 (_2!4946 lt!172640))))))

(assert (=> d!36564 (= (bitIndex!0 (size!2347 (buf!2755 (_2!4946 lt!172640))) (currentByte!5341 (_2!4946 lt!172640)) (currentBit!5336 (_2!4946 lt!172640))) lt!173219)))

(declare-fun b!113912 () Bool)

(declare-fun res!94093 () Bool)

(assert (=> b!113912 (=> (not res!94093) (not e!74710))))

(assert (=> b!113912 (= res!94093 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173219))))

(declare-fun b!113913 () Bool)

(declare-fun lt!173217 () (_ BitVec 64))

(assert (=> b!113913 (= e!74710 (bvsle lt!173219 (bvmul lt!173217 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113913 (or (= lt!173217 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173217 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173217)))))

(assert (=> b!113913 (= lt!173217 ((_ sign_extend 32) (size!2347 (buf!2755 (_2!4946 lt!172640)))))))

(assert (= (and d!36564 res!94092) b!113912))

(assert (= (and b!113912 res!94093) b!113913))

(declare-fun m!170183 () Bool)

(assert (=> d!36564 m!170183))

(assert (=> d!36564 m!169855))

(assert (=> b!113626 d!36564))

(declare-fun d!36566 () Bool)

(declare-fun e!74711 () Bool)

(assert (=> d!36566 e!74711))

(declare-fun res!94094 () Bool)

(assert (=> d!36566 (=> (not res!94094) (not e!74711))))

(declare-fun lt!173225 () (_ BitVec 64))

(declare-fun lt!173226 () (_ BitVec 64))

(declare-fun lt!173228 () (_ BitVec 64))

(assert (=> d!36566 (= res!94094 (= lt!173225 (bvsub lt!173228 lt!173226)))))

(assert (=> d!36566 (or (= (bvand lt!173228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173226 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173228 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173228 lt!173226) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36566 (= lt!173226 (remainingBits!0 ((_ sign_extend 32) (size!2347 (buf!2755 thiss!1305))) ((_ sign_extend 32) (currentByte!5341 thiss!1305)) ((_ sign_extend 32) (currentBit!5336 thiss!1305))))))

(declare-fun lt!173227 () (_ BitVec 64))

(declare-fun lt!173224 () (_ BitVec 64))

(assert (=> d!36566 (= lt!173228 (bvmul lt!173227 lt!173224))))

(assert (=> d!36566 (or (= lt!173227 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173224 (bvsdiv (bvmul lt!173227 lt!173224) lt!173227)))))

(assert (=> d!36566 (= lt!173224 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36566 (= lt!173227 ((_ sign_extend 32) (size!2347 (buf!2755 thiss!1305))))))

(assert (=> d!36566 (= lt!173225 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5341 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5336 thiss!1305))))))

(assert (=> d!36566 (invariant!0 (currentBit!5336 thiss!1305) (currentByte!5341 thiss!1305) (size!2347 (buf!2755 thiss!1305)))))

(assert (=> d!36566 (= (bitIndex!0 (size!2347 (buf!2755 thiss!1305)) (currentByte!5341 thiss!1305) (currentBit!5336 thiss!1305)) lt!173225)))

(declare-fun b!113914 () Bool)

(declare-fun res!94095 () Bool)

(assert (=> b!113914 (=> (not res!94095) (not e!74711))))

(assert (=> b!113914 (= res!94095 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173225))))

(declare-fun b!113915 () Bool)

(declare-fun lt!173223 () (_ BitVec 64))

(assert (=> b!113915 (= e!74711 (bvsle lt!173225 (bvmul lt!173223 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113915 (or (= lt!173223 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173223 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173223)))))

(assert (=> b!113915 (= lt!173223 ((_ sign_extend 32) (size!2347 (buf!2755 thiss!1305))))))

(assert (= (and d!36566 res!94094) b!113914))

(assert (= (and b!113914 res!94095) b!113915))

(declare-fun m!170185 () Bool)

(assert (=> d!36566 m!170185))

(assert (=> d!36566 m!169851))

(assert (=> b!113626 d!36566))

(declare-fun d!36568 () Bool)

(assert (=> d!36568 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2347 (buf!2755 thiss!1305))) ((_ sign_extend 32) (currentByte!5341 thiss!1305)) ((_ sign_extend 32) (currentBit!5336 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2347 (buf!2755 thiss!1305))) ((_ sign_extend 32) (currentByte!5341 thiss!1305)) ((_ sign_extend 32) (currentBit!5336 thiss!1305))) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun bs!8882 () Bool)

(assert (= bs!8882 d!36568))

(assert (=> bs!8882 m!170185))

(assert (=> b!113620 d!36568))

(declare-fun d!36570 () Bool)

(assert (=> d!36570 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!113625 d!36570))

(declare-fun d!36572 () Bool)

(declare-fun e!74712 () Bool)

(assert (=> d!36572 e!74712))

(declare-fun res!94096 () Bool)

(assert (=> d!36572 (=> (not res!94096) (not e!74712))))

(declare-fun lt!173234 () (_ BitVec 64))

(declare-fun lt!173231 () (_ BitVec 64))

(declare-fun lt!173232 () (_ BitVec 64))

(assert (=> d!36572 (= res!94096 (= lt!173231 (bvsub lt!173234 lt!173232)))))

(assert (=> d!36572 (or (= (bvand lt!173234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!173232 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!173234 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!173234 lt!173232) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!36572 (= lt!173232 (remainingBits!0 ((_ sign_extend 32) (size!2347 (buf!2755 (_1!4945 lt!172638)))) ((_ sign_extend 32) (currentByte!5341 (_1!4945 lt!172638))) ((_ sign_extend 32) (currentBit!5336 (_1!4945 lt!172638)))))))

(declare-fun lt!173233 () (_ BitVec 64))

(declare-fun lt!173230 () (_ BitVec 64))

(assert (=> d!36572 (= lt!173234 (bvmul lt!173233 lt!173230))))

(assert (=> d!36572 (or (= lt!173233 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!173230 (bvsdiv (bvmul lt!173233 lt!173230) lt!173233)))))

(assert (=> d!36572 (= lt!173230 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!36572 (= lt!173233 ((_ sign_extend 32) (size!2347 (buf!2755 (_1!4945 lt!172638)))))))

(assert (=> d!36572 (= lt!173231 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5341 (_1!4945 lt!172638))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5336 (_1!4945 lt!172638)))))))

(assert (=> d!36572 (invariant!0 (currentBit!5336 (_1!4945 lt!172638)) (currentByte!5341 (_1!4945 lt!172638)) (size!2347 (buf!2755 (_1!4945 lt!172638))))))

(assert (=> d!36572 (= (bitIndex!0 (size!2347 (buf!2755 (_1!4945 lt!172638))) (currentByte!5341 (_1!4945 lt!172638)) (currentBit!5336 (_1!4945 lt!172638))) lt!173231)))

(declare-fun b!113916 () Bool)

(declare-fun res!94097 () Bool)

(assert (=> b!113916 (=> (not res!94097) (not e!74712))))

(assert (=> b!113916 (= res!94097 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!173231))))

(declare-fun b!113917 () Bool)

(declare-fun lt!173229 () (_ BitVec 64))

(assert (=> b!113917 (= e!74712 (bvsle lt!173231 (bvmul lt!173229 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!113917 (or (= lt!173229 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!173229 #b0000000000000000000000000000000000000000000000000000000000001000) lt!173229)))))

(assert (=> b!113917 (= lt!173229 ((_ sign_extend 32) (size!2347 (buf!2755 (_1!4945 lt!172638)))))))

(assert (= (and d!36572 res!94096) b!113916))

(assert (= (and b!113916 res!94097) b!113917))

(declare-fun m!170187 () Bool)

(assert (=> d!36572 m!170187))

(declare-fun m!170189 () Bool)

(assert (=> d!36572 m!170189))

(assert (=> b!113622 d!36572))

(declare-fun d!36574 () Bool)

(assert (=> d!36574 (= (array_inv!2149 (buf!2755 thiss!1305)) (bvsge (size!2347 (buf!2755 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!113621 d!36574))

(push 1)

(assert (not b!113705))

(assert (not d!36568))

(assert (not b!113874))

(assert (not d!36516))

(assert (not d!36506))

(assert (not d!36566))

(assert (not b!113904))

(assert (not b!113711))

(assert (not b!113907))

(assert (not d!36504))

(assert (not b!113710))

(assert (not bm!1454))

(assert (not d!36564))

(assert (not b!113879))

(assert (not b!113875))

(assert (not b!113881))

(assert (not b!113878))

(assert (not b!113876))

(assert (not b!113713))

(assert (not d!36572))

(assert (not b!113871))

(assert (not d!36508))

(assert (not b!113869))

(assert (not b!113906))

(assert (not b!113870))

(assert (not d!36560))

(assert (not b!113880))

(assert (not b!113707))

(assert (not b!113905))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

