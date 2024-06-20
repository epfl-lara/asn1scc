; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2016 () Bool)

(assert start!2016)

(declare-fun b!9611 () Bool)

(declare-fun e!5937 () Bool)

(declare-fun e!5939 () Bool)

(assert (=> b!9611 (= e!5937 (not e!5939))))

(declare-fun res!9826 () Bool)

(assert (=> b!9611 (=> res!9826 e!5939)))

(declare-datatypes ((array!583 0))(
  ( (array!584 (arr!663 (Array (_ BitVec 32) (_ BitVec 8))) (size!252 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!476 0))(
  ( (BitStream!477 (buf!591 array!583) (currentByte!1636 (_ BitVec 32)) (currentBit!1631 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!821 0))(
  ( (Unit!822) )
))
(declare-datatypes ((tuple2!1204 0))(
  ( (tuple2!1205 (_1!639 Unit!821) (_2!639 BitStream!476)) )
))
(declare-fun lt!14524 () tuple2!1204)

(declare-datatypes ((tuple2!1206 0))(
  ( (tuple2!1207 (_1!640 array!583) (_2!640 BitStream!476)) )
))
(declare-fun lt!14525 () tuple2!1206)

(declare-datatypes ((List!146 0))(
  ( (Nil!143) (Cons!142 (h!261 Bool) (t!896 List!146)) )
))
(declare-fun lt!14523 () List!146)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun byteArrayBitContentToList!0 (BitStream!476 array!583 (_ BitVec 64) (_ BitVec 64)) List!146)

(assert (=> b!9611 (= res!9826 (not (= (byteArrayBitContentToList!0 (_2!639 lt!14524) (_1!640 lt!14525) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!14523)))))

(declare-datatypes ((tuple2!1208 0))(
  ( (tuple2!1209 (_1!641 BitStream!476) (_2!641 BitStream!476)) )
))
(declare-fun lt!14522 () tuple2!1208)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!476 BitStream!476 (_ BitVec 64)) List!146)

(assert (=> b!9611 (= lt!14523 (bitStreamReadBitsIntoList!0 (_2!639 lt!14524) (_1!641 lt!14522) nBits!460))))

(declare-fun readBits!0 (BitStream!476 (_ BitVec 64)) tuple2!1206)

(assert (=> b!9611 (= lt!14525 (readBits!0 (_1!641 lt!14522) nBits!460))))

(declare-fun thiss!1486 () BitStream!476)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9611 (validate_offset_bits!1 ((_ sign_extend 32) (size!252 (buf!591 (_2!639 lt!14524)))) ((_ sign_extend 32) (currentByte!1636 thiss!1486)) ((_ sign_extend 32) (currentBit!1631 thiss!1486)) nBits!460)))

(declare-fun lt!14521 () Unit!821)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!476 array!583 (_ BitVec 64)) Unit!821)

(assert (=> b!9611 (= lt!14521 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!591 (_2!639 lt!14524)) nBits!460))))

(declare-fun reader!0 (BitStream!476 BitStream!476) tuple2!1208)

(assert (=> b!9611 (= lt!14522 (reader!0 thiss!1486 (_2!639 lt!14524)))))

(declare-fun res!9827 () Bool)

(declare-fun e!5942 () Bool)

(assert (=> start!2016 (=> (not res!9827) (not e!5942))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!583)

(assert (=> start!2016 (= res!9827 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!252 srcBuffer!6))))))))

(assert (=> start!2016 e!5942))

(assert (=> start!2016 true))

(declare-fun array_inv!244 (array!583) Bool)

(assert (=> start!2016 (array_inv!244 srcBuffer!6)))

(declare-fun e!5938 () Bool)

(declare-fun inv!12 (BitStream!476) Bool)

(assert (=> start!2016 (and (inv!12 thiss!1486) e!5938)))

(declare-fun b!9612 () Bool)

(declare-fun res!9830 () Bool)

(assert (=> b!9612 (=> (not res!9830) (not e!5937))))

(declare-fun isPrefixOf!0 (BitStream!476 BitStream!476) Bool)

(assert (=> b!9612 (= res!9830 (isPrefixOf!0 thiss!1486 (_2!639 lt!14524)))))

(declare-fun b!9613 () Bool)

(declare-fun res!9829 () Bool)

(assert (=> b!9613 (=> (not res!9829) (not e!5937))))

(assert (=> b!9613 (= res!9829 (= (size!252 (buf!591 thiss!1486)) (size!252 (buf!591 (_2!639 lt!14524)))))))

(declare-fun b!9614 () Bool)

(assert (=> b!9614 (= e!5942 e!5937)))

(declare-fun res!9828 () Bool)

(assert (=> b!9614 (=> (not res!9828) (not e!5937))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9614 (= res!9828 (invariant!0 (currentBit!1631 (_2!639 lt!14524)) (currentByte!1636 (_2!639 lt!14524)) (size!252 (buf!591 (_2!639 lt!14524)))))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!476 array!583 (_ BitVec 64) (_ BitVec 64)) tuple2!1204)

(assert (=> b!9614 (= lt!14524 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!9615 () Bool)

(assert (=> b!9615 (= e!5939 (= lt!14523 (byteArrayBitContentToList!0 (_2!639 lt!14524) srcBuffer!6 from!367 nBits!460)))))

(declare-fun b!9616 () Bool)

(declare-fun res!9832 () Bool)

(assert (=> b!9616 (=> (not res!9832) (not e!5942))))

(assert (=> b!9616 (= res!9832 (validate_offset_bits!1 ((_ sign_extend 32) (size!252 (buf!591 thiss!1486))) ((_ sign_extend 32) (currentByte!1636 thiss!1486)) ((_ sign_extend 32) (currentBit!1631 thiss!1486)) nBits!460))))

(declare-fun b!9617 () Bool)

(declare-fun res!9831 () Bool)

(assert (=> b!9617 (=> (not res!9831) (not e!5937))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!9617 (= res!9831 (= (bitIndex!0 (size!252 (buf!591 (_2!639 lt!14524))) (currentByte!1636 (_2!639 lt!14524)) (currentBit!1631 (_2!639 lt!14524))) (bvadd (bitIndex!0 (size!252 (buf!591 thiss!1486)) (currentByte!1636 thiss!1486) (currentBit!1631 thiss!1486)) nBits!460)))))

(declare-fun b!9618 () Bool)

(assert (=> b!9618 (= e!5938 (array_inv!244 (buf!591 thiss!1486)))))

(assert (= (and start!2016 res!9827) b!9616))

(assert (= (and b!9616 res!9832) b!9614))

(assert (= (and b!9614 res!9828) b!9613))

(assert (= (and b!9613 res!9829) b!9617))

(assert (= (and b!9617 res!9831) b!9612))

(assert (= (and b!9612 res!9830) b!9611))

(assert (= (and b!9611 (not res!9826)) b!9615))

(assert (= start!2016 b!9618))

(declare-fun m!13899 () Bool)

(assert (=> b!9618 m!13899))

(declare-fun m!13901 () Bool)

(assert (=> b!9614 m!13901))

(declare-fun m!13903 () Bool)

(assert (=> b!9614 m!13903))

(declare-fun m!13905 () Bool)

(assert (=> b!9616 m!13905))

(declare-fun m!13907 () Bool)

(assert (=> b!9611 m!13907))

(declare-fun m!13909 () Bool)

(assert (=> b!9611 m!13909))

(declare-fun m!13911 () Bool)

(assert (=> b!9611 m!13911))

(declare-fun m!13913 () Bool)

(assert (=> b!9611 m!13913))

(declare-fun m!13915 () Bool)

(assert (=> b!9611 m!13915))

(declare-fun m!13917 () Bool)

(assert (=> b!9611 m!13917))

(declare-fun m!13919 () Bool)

(assert (=> b!9612 m!13919))

(declare-fun m!13921 () Bool)

(assert (=> b!9617 m!13921))

(declare-fun m!13923 () Bool)

(assert (=> b!9617 m!13923))

(declare-fun m!13925 () Bool)

(assert (=> start!2016 m!13925))

(declare-fun m!13927 () Bool)

(assert (=> start!2016 m!13927))

(declare-fun m!13929 () Bool)

(assert (=> b!9615 m!13929))

(push 1)

(assert (not b!9611))

(assert (not start!2016))

(assert (not b!9618))

(assert (not b!9616))

(assert (not b!9612))

(assert (not b!9614))

(assert (not b!9615))

(assert (not b!9617))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3082 () Bool)

(assert (=> d!3082 (= (array_inv!244 (buf!591 thiss!1486)) (bvsge (size!252 (buf!591 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!9618 d!3082))

(declare-fun d!3084 () Bool)

(declare-fun res!9849 () Bool)

(declare-fun e!5954 () Bool)

(assert (=> d!3084 (=> (not res!9849) (not e!5954))))

(assert (=> d!3084 (= res!9849 (= (size!252 (buf!591 thiss!1486)) (size!252 (buf!591 (_2!639 lt!14524)))))))

(assert (=> d!3084 (= (isPrefixOf!0 thiss!1486 (_2!639 lt!14524)) e!5954)))

(declare-fun b!9634 () Bool)

(declare-fun res!9848 () Bool)

(assert (=> b!9634 (=> (not res!9848) (not e!5954))))

(assert (=> b!9634 (= res!9848 (bvsle (bitIndex!0 (size!252 (buf!591 thiss!1486)) (currentByte!1636 thiss!1486) (currentBit!1631 thiss!1486)) (bitIndex!0 (size!252 (buf!591 (_2!639 lt!14524))) (currentByte!1636 (_2!639 lt!14524)) (currentBit!1631 (_2!639 lt!14524)))))))

(declare-fun b!9635 () Bool)

(declare-fun e!5953 () Bool)

(assert (=> b!9635 (= e!5954 e!5953)))

(declare-fun res!9850 () Bool)

(assert (=> b!9635 (=> res!9850 e!5953)))

(assert (=> b!9635 (= res!9850 (= (size!252 (buf!591 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!9636 () Bool)

(declare-fun arrayBitRangesEq!0 (array!583 array!583 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9636 (= e!5953 (arrayBitRangesEq!0 (buf!591 thiss!1486) (buf!591 (_2!639 lt!14524)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!252 (buf!591 thiss!1486)) (currentByte!1636 thiss!1486) (currentBit!1631 thiss!1486))))))

(assert (= (and d!3084 res!9849) b!9634))

(assert (= (and b!9634 res!9848) b!9635))

(assert (= (and b!9635 (not res!9850)) b!9636))

(assert (=> b!9634 m!13923))

(assert (=> b!9634 m!13921))

(assert (=> b!9636 m!13923))

(assert (=> b!9636 m!13923))

(declare-fun m!13937 () Bool)

(assert (=> b!9636 m!13937))

(assert (=> b!9612 d!3084))

(declare-fun d!3092 () Bool)

(declare-fun e!5960 () Bool)

(assert (=> d!3092 e!5960))

(declare-fun res!9856 () Bool)

(assert (=> d!3092 (=> (not res!9856) (not e!5960))))

(declare-fun lt!14538 () (_ BitVec 64))

(declare-fun lt!14539 () (_ BitVec 64))

(declare-fun lt!14540 () (_ BitVec 64))

(assert (=> d!3092 (= res!9856 (= lt!14538 (bvsub lt!14540 lt!14539)))))

(assert (=> d!3092 (or (= (bvand lt!14540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14539 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14540 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14540 lt!14539) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3092 (= lt!14539 (remainingBits!0 ((_ sign_extend 32) (size!252 (buf!591 (_2!639 lt!14524)))) ((_ sign_extend 32) (currentByte!1636 (_2!639 lt!14524))) ((_ sign_extend 32) (currentBit!1631 (_2!639 lt!14524)))))))

(declare-fun lt!14541 () (_ BitVec 64))

(declare-fun lt!14543 () (_ BitVec 64))

(assert (=> d!3092 (= lt!14540 (bvmul lt!14541 lt!14543))))

(assert (=> d!3092 (or (= lt!14541 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!14543 (bvsdiv (bvmul lt!14541 lt!14543) lt!14541)))))

(assert (=> d!3092 (= lt!14543 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3092 (= lt!14541 ((_ sign_extend 32) (size!252 (buf!591 (_2!639 lt!14524)))))))

(assert (=> d!3092 (= lt!14538 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1636 (_2!639 lt!14524))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1631 (_2!639 lt!14524)))))))

(assert (=> d!3092 (invariant!0 (currentBit!1631 (_2!639 lt!14524)) (currentByte!1636 (_2!639 lt!14524)) (size!252 (buf!591 (_2!639 lt!14524))))))

(assert (=> d!3092 (= (bitIndex!0 (size!252 (buf!591 (_2!639 lt!14524))) (currentByte!1636 (_2!639 lt!14524)) (currentBit!1631 (_2!639 lt!14524))) lt!14538)))

(declare-fun b!9647 () Bool)

(declare-fun res!9855 () Bool)

(assert (=> b!9647 (=> (not res!9855) (not e!5960))))

(assert (=> b!9647 (= res!9855 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!14538))))

(declare-fun b!9648 () Bool)

(declare-fun lt!14542 () (_ BitVec 64))

(assert (=> b!9648 (= e!5960 (bvsle lt!14538 (bvmul lt!14542 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9648 (or (= lt!14542 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!14542 #b0000000000000000000000000000000000000000000000000000000000001000) lt!14542)))))

(assert (=> b!9648 (= lt!14542 ((_ sign_extend 32) (size!252 (buf!591 (_2!639 lt!14524)))))))

(assert (= (and d!3092 res!9856) b!9647))

(assert (= (and b!9647 res!9855) b!9648))

(declare-fun m!13947 () Bool)

(assert (=> d!3092 m!13947))

(assert (=> d!3092 m!13901))

(assert (=> b!9617 d!3092))

(declare-fun d!3100 () Bool)

(declare-fun e!5961 () Bool)

(assert (=> d!3100 e!5961))

(declare-fun res!9858 () Bool)

(assert (=> d!3100 (=> (not res!9858) (not e!5961))))

(declare-fun lt!14545 () (_ BitVec 64))

(declare-fun lt!14544 () (_ BitVec 64))

(declare-fun lt!14546 () (_ BitVec 64))

(assert (=> d!3100 (= res!9858 (= lt!14544 (bvsub lt!14546 lt!14545)))))

(assert (=> d!3100 (or (= (bvand lt!14546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14545 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14546 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14546 lt!14545) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3100 (= lt!14545 (remainingBits!0 ((_ sign_extend 32) (size!252 (buf!591 thiss!1486))) ((_ sign_extend 32) (currentByte!1636 thiss!1486)) ((_ sign_extend 32) (currentBit!1631 thiss!1486))))))

(declare-fun lt!14547 () (_ BitVec 64))

(declare-fun lt!14549 () (_ BitVec 64))

(assert (=> d!3100 (= lt!14546 (bvmul lt!14547 lt!14549))))

(assert (=> d!3100 (or (= lt!14547 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!14549 (bvsdiv (bvmul lt!14547 lt!14549) lt!14547)))))

(assert (=> d!3100 (= lt!14549 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3100 (= lt!14547 ((_ sign_extend 32) (size!252 (buf!591 thiss!1486))))))

(assert (=> d!3100 (= lt!14544 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1636 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1631 thiss!1486))))))

(assert (=> d!3100 (invariant!0 (currentBit!1631 thiss!1486) (currentByte!1636 thiss!1486) (size!252 (buf!591 thiss!1486)))))

(assert (=> d!3100 (= (bitIndex!0 (size!252 (buf!591 thiss!1486)) (currentByte!1636 thiss!1486) (currentBit!1631 thiss!1486)) lt!14544)))

(declare-fun b!9649 () Bool)

(declare-fun res!9857 () Bool)

(assert (=> b!9649 (=> (not res!9857) (not e!5961))))

(assert (=> b!9649 (= res!9857 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!14544))))

(declare-fun b!9650 () Bool)

(declare-fun lt!14548 () (_ BitVec 64))

(assert (=> b!9650 (= e!5961 (bvsle lt!14544 (bvmul lt!14548 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9650 (or (= lt!14548 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!14548 #b0000000000000000000000000000000000000000000000000000000000001000) lt!14548)))))

(assert (=> b!9650 (= lt!14548 ((_ sign_extend 32) (size!252 (buf!591 thiss!1486))))))

(assert (= (and d!3100 res!9858) b!9649))

(assert (= (and b!9649 res!9857) b!9650))

(declare-fun m!13949 () Bool)

(assert (=> d!3100 m!13949))

(declare-fun m!13951 () Bool)

(assert (=> d!3100 m!13951))

(assert (=> b!9617 d!3100))

(declare-fun d!3102 () Bool)

(assert (=> d!3102 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!252 (buf!591 thiss!1486))) ((_ sign_extend 32) (currentByte!1636 thiss!1486)) ((_ sign_extend 32) (currentBit!1631 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!252 (buf!591 thiss!1486))) ((_ sign_extend 32) (currentByte!1636 thiss!1486)) ((_ sign_extend 32) (currentBit!1631 thiss!1486))) nBits!460))))

(declare-fun bs!935 () Bool)

(assert (= bs!935 d!3102))

(assert (=> bs!935 m!13949))

(assert (=> b!9616 d!3102))

(declare-fun d!3104 () Bool)

(declare-fun c!620 () Bool)

(assert (=> d!3104 (= c!620 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5966 () List!146)

(assert (=> d!3104 (= (byteArrayBitContentToList!0 (_2!639 lt!14524) (_1!640 lt!14525) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!5966)))

(declare-fun b!9659 () Bool)

(assert (=> b!9659 (= e!5966 Nil!143)))

(declare-fun b!9660 () Bool)

(assert (=> b!9660 (= e!5966 (Cons!142 (not (= (bvand ((_ sign_extend 24) (select (arr!663 (_1!640 lt!14525)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!639 lt!14524) (_1!640 lt!14525) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3104 c!620) b!9659))

(assert (= (and d!3104 (not c!620)) b!9660))

(declare-fun m!13953 () Bool)

(assert (=> b!9660 m!13953))

(declare-fun m!13955 () Bool)

(assert (=> b!9660 m!13955))

(declare-fun m!13957 () Bool)

(assert (=> b!9660 m!13957))

(assert (=> b!9611 d!3104))

(declare-fun d!3106 () Bool)

(assert (=> d!3106 (validate_offset_bits!1 ((_ sign_extend 32) (size!252 (buf!591 (_2!639 lt!14524)))) ((_ sign_extend 32) (currentByte!1636 thiss!1486)) ((_ sign_extend 32) (currentBit!1631 thiss!1486)) nBits!460)))

(declare-fun lt!14576 () Unit!821)

(declare-fun choose!9 (BitStream!476 array!583 (_ BitVec 64) BitStream!476) Unit!821)

(assert (=> d!3106 (= lt!14576 (choose!9 thiss!1486 (buf!591 (_2!639 lt!14524)) nBits!460 (BitStream!477 (buf!591 (_2!639 lt!14524)) (currentByte!1636 thiss!1486) (currentBit!1631 thiss!1486))))))

(assert (=> d!3106 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!591 (_2!639 lt!14524)) nBits!460) lt!14576)))

(declare-fun bs!936 () Bool)

(assert (= bs!936 d!3106))

(assert (=> bs!936 m!13911))

(declare-fun m!13963 () Bool)

(assert (=> bs!936 m!13963))

(assert (=> b!9611 d!3106))

(declare-fun b!9690 () Bool)

(declare-fun e!5979 () Bool)

(declare-fun lt!14643 () List!146)

(declare-fun isEmpty!28 (List!146) Bool)

(assert (=> b!9690 (= e!5979 (isEmpty!28 lt!14643))))

(declare-fun b!9689 () Bool)

(declare-datatypes ((tuple2!1210 0))(
  ( (tuple2!1211 (_1!642 Bool) (_2!642 BitStream!476)) )
))
(declare-fun lt!14644 () tuple2!1210)

(declare-datatypes ((tuple2!1212 0))(
  ( (tuple2!1213 (_1!643 List!146) (_2!643 BitStream!476)) )
))
(declare-fun e!5980 () tuple2!1212)

(declare-fun lt!14645 () (_ BitVec 64))

(assert (=> b!9689 (= e!5980 (tuple2!1213 (Cons!142 (_1!642 lt!14644) (bitStreamReadBitsIntoList!0 (_2!639 lt!14524) (_2!642 lt!14644) (bvsub nBits!460 lt!14645))) (_2!642 lt!14644)))))

(declare-fun readBit!0 (BitStream!476) tuple2!1210)

(assert (=> b!9689 (= lt!14644 (readBit!0 (_1!641 lt!14522)))))

(assert (=> b!9689 (= lt!14645 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!9688 () Bool)

(assert (=> b!9688 (= e!5980 (tuple2!1213 Nil!143 (_1!641 lt!14522)))))

(declare-fun d!3114 () Bool)

(assert (=> d!3114 e!5979))

(declare-fun c!629 () Bool)

(assert (=> d!3114 (= c!629 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3114 (= lt!14643 (_1!643 e!5980))))

(declare-fun c!628 () Bool)

(assert (=> d!3114 (= c!628 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3114 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3114 (= (bitStreamReadBitsIntoList!0 (_2!639 lt!14524) (_1!641 lt!14522) nBits!460) lt!14643)))

(declare-fun b!9691 () Bool)

(declare-fun length!23 (List!146) Int)

(assert (=> b!9691 (= e!5979 (> (length!23 lt!14643) 0))))

(assert (= (and d!3114 c!628) b!9688))

(assert (= (and d!3114 (not c!628)) b!9689))

(assert (= (and d!3114 c!629) b!9690))

(assert (= (and d!3114 (not c!629)) b!9691))

(declare-fun m!13995 () Bool)

(assert (=> b!9690 m!13995))

(declare-fun m!13997 () Bool)

(assert (=> b!9689 m!13997))

(declare-fun m!13999 () Bool)

(assert (=> b!9689 m!13999))

(declare-fun m!14001 () Bool)

(assert (=> b!9691 m!14001))

(assert (=> b!9611 d!3114))

(declare-fun d!3120 () Bool)

(declare-fun e!5988 () Bool)

(assert (=> d!3120 e!5988))

(declare-fun res!9882 () Bool)

(assert (=> d!3120 (=> (not res!9882) (not e!5988))))

(declare-fun lt!14693 () tuple2!1208)

(assert (=> d!3120 (= res!9882 (isPrefixOf!0 (_1!641 lt!14693) (_2!641 lt!14693)))))

(declare-fun lt!14689 () BitStream!476)

(assert (=> d!3120 (= lt!14693 (tuple2!1209 lt!14689 (_2!639 lt!14524)))))

(declare-fun lt!14698 () Unit!821)

(declare-fun lt!14701 () Unit!821)

(assert (=> d!3120 (= lt!14698 lt!14701)))

(assert (=> d!3120 (isPrefixOf!0 lt!14689 (_2!639 lt!14524))))

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!476 BitStream!476 BitStream!476) Unit!821)

(assert (=> d!3120 (= lt!14701 (lemmaIsPrefixTransitive!0 lt!14689 (_2!639 lt!14524) (_2!639 lt!14524)))))

(declare-fun lt!14704 () Unit!821)

(declare-fun lt!14703 () Unit!821)

(assert (=> d!3120 (= lt!14704 lt!14703)))

(assert (=> d!3120 (isPrefixOf!0 lt!14689 (_2!639 lt!14524))))

(assert (=> d!3120 (= lt!14703 (lemmaIsPrefixTransitive!0 lt!14689 thiss!1486 (_2!639 lt!14524)))))

(declare-fun lt!14690 () Unit!821)

(declare-fun e!5989 () Unit!821)

(assert (=> d!3120 (= lt!14690 e!5989)))

(declare-fun c!635 () Bool)

(assert (=> d!3120 (= c!635 (not (= (size!252 (buf!591 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!14700 () Unit!821)

(declare-fun lt!14694 () Unit!821)

(assert (=> d!3120 (= lt!14700 lt!14694)))

(assert (=> d!3120 (isPrefixOf!0 (_2!639 lt!14524) (_2!639 lt!14524))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!476) Unit!821)

(assert (=> d!3120 (= lt!14694 (lemmaIsPrefixRefl!0 (_2!639 lt!14524)))))

(declare-fun lt!14697 () Unit!821)

(declare-fun lt!14691 () Unit!821)

(assert (=> d!3120 (= lt!14697 lt!14691)))

(assert (=> d!3120 (= lt!14691 (lemmaIsPrefixRefl!0 (_2!639 lt!14524)))))

(declare-fun lt!14696 () Unit!821)

(declare-fun lt!14705 () Unit!821)

(assert (=> d!3120 (= lt!14696 lt!14705)))

(assert (=> d!3120 (isPrefixOf!0 lt!14689 lt!14689)))

(assert (=> d!3120 (= lt!14705 (lemmaIsPrefixRefl!0 lt!14689))))

(declare-fun lt!14687 () Unit!821)

(declare-fun lt!14692 () Unit!821)

(assert (=> d!3120 (= lt!14687 lt!14692)))

(assert (=> d!3120 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3120 (= lt!14692 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3120 (= lt!14689 (BitStream!477 (buf!591 (_2!639 lt!14524)) (currentByte!1636 thiss!1486) (currentBit!1631 thiss!1486)))))

(assert (=> d!3120 (isPrefixOf!0 thiss!1486 (_2!639 lt!14524))))

(assert (=> d!3120 (= (reader!0 thiss!1486 (_2!639 lt!14524)) lt!14693)))

(declare-fun b!9708 () Bool)

(declare-fun res!9883 () Bool)

(assert (=> b!9708 (=> (not res!9883) (not e!5988))))

(assert (=> b!9708 (= res!9883 (isPrefixOf!0 (_1!641 lt!14693) thiss!1486))))

(declare-fun b!9709 () Bool)

(declare-fun res!9884 () Bool)

(assert (=> b!9709 (=> (not res!9884) (not e!5988))))

(assert (=> b!9709 (= res!9884 (isPrefixOf!0 (_2!641 lt!14693) (_2!639 lt!14524)))))

(declare-fun b!9710 () Bool)

(declare-fun lt!14699 () Unit!821)

(assert (=> b!9710 (= e!5989 lt!14699)))

(declare-fun lt!14695 () (_ BitVec 64))

(assert (=> b!9710 (= lt!14695 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!14688 () (_ BitVec 64))

(assert (=> b!9710 (= lt!14688 (bitIndex!0 (size!252 (buf!591 thiss!1486)) (currentByte!1636 thiss!1486) (currentBit!1631 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!583 array!583 (_ BitVec 64) (_ BitVec 64)) Unit!821)

(assert (=> b!9710 (= lt!14699 (arrayBitRangesEqSymmetric!0 (buf!591 thiss!1486) (buf!591 (_2!639 lt!14524)) lt!14695 lt!14688))))

(assert (=> b!9710 (arrayBitRangesEq!0 (buf!591 (_2!639 lt!14524)) (buf!591 thiss!1486) lt!14695 lt!14688)))

(declare-fun lt!14702 () (_ BitVec 64))

(declare-fun lt!14686 () (_ BitVec 64))

(declare-fun b!9711 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!476 (_ BitVec 64)) BitStream!476)

(assert (=> b!9711 (= e!5988 (= (_1!641 lt!14693) (withMovedBitIndex!0 (_2!641 lt!14693) (bvsub lt!14702 lt!14686))))))

(assert (=> b!9711 (or (= (bvand lt!14702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14686 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14702 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14702 lt!14686) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9711 (= lt!14686 (bitIndex!0 (size!252 (buf!591 (_2!639 lt!14524))) (currentByte!1636 (_2!639 lt!14524)) (currentBit!1631 (_2!639 lt!14524))))))

(assert (=> b!9711 (= lt!14702 (bitIndex!0 (size!252 (buf!591 thiss!1486)) (currentByte!1636 thiss!1486) (currentBit!1631 thiss!1486)))))

(declare-fun b!9712 () Bool)

(declare-fun Unit!835 () Unit!821)

(assert (=> b!9712 (= e!5989 Unit!835)))

(assert (= (and d!3120 c!635) b!9710))

(assert (= (and d!3120 (not c!635)) b!9712))

(assert (= (and d!3120 res!9882) b!9708))

(assert (= (and b!9708 res!9883) b!9709))

(assert (= (and b!9709 res!9884) b!9711))

(declare-fun m!14009 () Bool)

(assert (=> b!9709 m!14009))

(declare-fun m!14011 () Bool)

(assert (=> b!9708 m!14011))

(assert (=> b!9710 m!13923))

(declare-fun m!14013 () Bool)

(assert (=> b!9710 m!14013))

(declare-fun m!14015 () Bool)

(assert (=> b!9710 m!14015))

(declare-fun m!14017 () Bool)

(assert (=> d!3120 m!14017))

(declare-fun m!14019 () Bool)

(assert (=> d!3120 m!14019))

(declare-fun m!14021 () Bool)

(assert (=> d!3120 m!14021))

(declare-fun m!14023 () Bool)

(assert (=> d!3120 m!14023))

(declare-fun m!14025 () Bool)

(assert (=> d!3120 m!14025))

(declare-fun m!14027 () Bool)

(assert (=> d!3120 m!14027))

(declare-fun m!14029 () Bool)

(assert (=> d!3120 m!14029))

(declare-fun m!14031 () Bool)

(assert (=> d!3120 m!14031))

(declare-fun m!14033 () Bool)

(assert (=> d!3120 m!14033))

(assert (=> d!3120 m!13919))

(declare-fun m!14035 () Bool)

(assert (=> d!3120 m!14035))

(declare-fun m!14037 () Bool)

(assert (=> b!9711 m!14037))

(assert (=> b!9711 m!13921))

(assert (=> b!9711 m!13923))

(assert (=> b!9611 d!3120))

(declare-fun b!9750 () Bool)

(declare-fun res!9911 () Bool)

(declare-fun e!6001 () Bool)

(assert (=> b!9750 (=> (not res!9911) (not e!6001))))

(declare-fun lt!14764 () tuple2!1206)

(declare-fun lt!14770 () (_ BitVec 64))

(assert (=> b!9750 (= res!9911 (= (size!252 (_1!640 lt!14764)) ((_ extract 31 0) lt!14770)))))

(assert (=> b!9750 (and (bvslt lt!14770 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!14770 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!14767 () (_ BitVec 64))

(declare-fun lt!14768 () (_ BitVec 64))

(assert (=> b!9750 (= lt!14770 (bvsdiv lt!14767 lt!14768))))

(assert (=> b!9750 (and (not (= lt!14768 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!14767 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!14768 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!9750 (= lt!14768 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!14765 () (_ BitVec 64))

(declare-fun lt!14771 () (_ BitVec 64))

(assert (=> b!9750 (= lt!14767 (bvsub lt!14765 lt!14771))))

(assert (=> b!9750 (or (= (bvand lt!14765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14771 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14765 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14765 lt!14771) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9750 (= lt!14771 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!14766 () (_ BitVec 64))

(assert (=> b!9750 (= lt!14765 (bvadd nBits!460 lt!14766))))

(assert (=> b!9750 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14766 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!14766) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9750 (= lt!14766 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun b!9751 () Bool)

(declare-fun res!9914 () Bool)

(assert (=> b!9751 (=> (not res!9914) (not e!6001))))

(assert (=> b!9751 (= res!9914 (bvsle (currentByte!1636 (_1!641 lt!14522)) (currentByte!1636 (_2!640 lt!14764))))))

(declare-fun d!3124 () Bool)

(assert (=> d!3124 e!6001))

(declare-fun res!9910 () Bool)

(assert (=> d!3124 (=> (not res!9910) (not e!6001))))

(assert (=> d!3124 (= res!9910 (= (buf!591 (_2!640 lt!14764)) (buf!591 (_1!641 lt!14522))))))

(declare-datatypes ((tuple3!72 0))(
  ( (tuple3!73 (_1!648 Unit!821) (_2!648 BitStream!476) (_3!39 array!583)) )
))
(declare-fun lt!14769 () tuple3!72)

(assert (=> d!3124 (= lt!14764 (tuple2!1207 (_3!39 lt!14769) (_2!648 lt!14769)))))

(declare-fun readBitsLoop!0 (BitStream!476 (_ BitVec 64) array!583 (_ BitVec 64) (_ BitVec 64)) tuple3!72)

(assert (=> d!3124 (= lt!14769 (readBitsLoop!0 (_1!641 lt!14522) nBits!460 (array!584 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3124 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3124 (= (readBits!0 (_1!641 lt!14522) nBits!460) lt!14764)))

(declare-fun b!9752 () Bool)

(declare-fun res!9912 () Bool)

(assert (=> b!9752 (=> (not res!9912) (not e!6001))))

(assert (=> b!9752 (= res!9912 (invariant!0 (currentBit!1631 (_2!640 lt!14764)) (currentByte!1636 (_2!640 lt!14764)) (size!252 (buf!591 (_2!640 lt!14764)))))))

(declare-fun b!9753 () Bool)

(declare-fun res!9913 () Bool)

(assert (=> b!9753 (=> (not res!9913) (not e!6001))))

(declare-fun lt!14763 () (_ BitVec 64))

(assert (=> b!9753 (= res!9913 (= (bvadd lt!14763 nBits!460) (bitIndex!0 (size!252 (buf!591 (_2!640 lt!14764))) (currentByte!1636 (_2!640 lt!14764)) (currentBit!1631 (_2!640 lt!14764)))))))

(assert (=> b!9753 (or (not (= (bvand lt!14763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!14763 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!14763 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9753 (= lt!14763 (bitIndex!0 (size!252 (buf!591 (_1!641 lt!14522))) (currentByte!1636 (_1!641 lt!14522)) (currentBit!1631 (_1!641 lt!14522))))))

(declare-fun b!9754 () Bool)

(assert (=> b!9754 (= e!6001 (= (byteArrayBitContentToList!0 (_2!640 lt!14764) (_1!640 lt!14764) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!640 lt!14764) (_1!641 lt!14522) nBits!460)))))

(assert (= (and d!3124 res!9910) b!9753))

(assert (= (and b!9753 res!9913) b!9752))

(assert (= (and b!9752 res!9912) b!9750))

(assert (= (and b!9750 res!9911) b!9751))

(assert (= (and b!9751 res!9914) b!9754))

(declare-fun m!14063 () Bool)

(assert (=> d!3124 m!14063))

(declare-fun m!14065 () Bool)

(assert (=> b!9752 m!14065))

(declare-fun m!14067 () Bool)

(assert (=> b!9753 m!14067))

(declare-fun m!14069 () Bool)

(assert (=> b!9753 m!14069))

(declare-fun m!14071 () Bool)

(assert (=> b!9754 m!14071))

(declare-fun m!14073 () Bool)

(assert (=> b!9754 m!14073))

(assert (=> b!9611 d!3124))

(declare-fun d!3138 () Bool)

(assert (=> d!3138 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!252 (buf!591 (_2!639 lt!14524)))) ((_ sign_extend 32) (currentByte!1636 thiss!1486)) ((_ sign_extend 32) (currentBit!1631 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!252 (buf!591 (_2!639 lt!14524)))) ((_ sign_extend 32) (currentByte!1636 thiss!1486)) ((_ sign_extend 32) (currentBit!1631 thiss!1486))) nBits!460))))

(declare-fun bs!939 () Bool)

(assert (= bs!939 d!3138))

(declare-fun m!14075 () Bool)

(assert (=> bs!939 m!14075))

(assert (=> b!9611 d!3138))

(declare-fun d!3140 () Bool)

(assert (=> d!3140 (= (array_inv!244 srcBuffer!6) (bvsge (size!252 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2016 d!3140))

(declare-fun d!3142 () Bool)

(assert (=> d!3142 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1631 thiss!1486) (currentByte!1636 thiss!1486) (size!252 (buf!591 thiss!1486))))))

(declare-fun bs!940 () Bool)

(assert (= bs!940 d!3142))

(assert (=> bs!940 m!13951))

(assert (=> start!2016 d!3142))

(declare-fun d!3144 () Bool)

(declare-fun c!642 () Bool)

(assert (=> d!3144 (= c!642 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6002 () List!146)

(assert (=> d!3144 (= (byteArrayBitContentToList!0 (_2!639 lt!14524) srcBuffer!6 from!367 nBits!460) e!6002)))

(declare-fun b!9755 () Bool)

(assert (=> b!9755 (= e!6002 Nil!143)))

(declare-fun b!9756 () Bool)

(assert (=> b!9756 (= e!6002 (Cons!142 (not (= (bvand ((_ sign_extend 24) (select (arr!663 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!639 lt!14524) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3144 c!642) b!9755))

(assert (= (and d!3144 (not c!642)) b!9756))

(declare-fun m!14077 () Bool)

(assert (=> b!9756 m!14077))

(declare-fun m!14079 () Bool)

(assert (=> b!9756 m!14079))

(declare-fun m!14081 () Bool)

(assert (=> b!9756 m!14081))

(assert (=> b!9615 d!3144))

(declare-fun d!3146 () Bool)

(assert (=> d!3146 (= (invariant!0 (currentBit!1631 (_2!639 lt!14524)) (currentByte!1636 (_2!639 lt!14524)) (size!252 (buf!591 (_2!639 lt!14524)))) (and (bvsge (currentBit!1631 (_2!639 lt!14524)) #b00000000000000000000000000000000) (bvslt (currentBit!1631 (_2!639 lt!14524)) #b00000000000000000000000000001000) (bvsge (currentByte!1636 (_2!639 lt!14524)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1636 (_2!639 lt!14524)) (size!252 (buf!591 (_2!639 lt!14524)))) (and (= (currentBit!1631 (_2!639 lt!14524)) #b00000000000000000000000000000000) (= (currentByte!1636 (_2!639 lt!14524)) (size!252 (buf!591 (_2!639 lt!14524))))))))))

(assert (=> b!9614 d!3146))

(declare-fun b!9874 () Bool)

(declare-fun e!6050 () tuple2!1204)

(declare-fun lt!15227 () tuple2!1204)

(declare-fun Unit!840 () Unit!821)

(assert (=> b!9874 (= e!6050 (tuple2!1205 Unit!840 (_2!639 lt!15227)))))

(declare-fun lt!15231 () tuple2!1204)

(declare-fun appendBitFromByte!0 (BitStream!476 (_ BitVec 8) (_ BitVec 32)) tuple2!1204)

(assert (=> b!9874 (= lt!15231 (appendBitFromByte!0 thiss!1486 (select (arr!663 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!15263 () (_ BitVec 64))

(assert (=> b!9874 (= lt!15263 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15247 () (_ BitVec 64))

(assert (=> b!9874 (= lt!15247 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!15223 () Unit!821)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!476 BitStream!476 (_ BitVec 64) (_ BitVec 64)) Unit!821)

(assert (=> b!9874 (= lt!15223 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!639 lt!15231) lt!15263 lt!15247))))

(assert (=> b!9874 (validate_offset_bits!1 ((_ sign_extend 32) (size!252 (buf!591 (_2!639 lt!15231)))) ((_ sign_extend 32) (currentByte!1636 (_2!639 lt!15231))) ((_ sign_extend 32) (currentBit!1631 (_2!639 lt!15231))) (bvsub lt!15263 lt!15247))))

(declare-fun lt!15233 () Unit!821)

(assert (=> b!9874 (= lt!15233 lt!15223)))

(declare-fun lt!15244 () tuple2!1208)

(assert (=> b!9874 (= lt!15244 (reader!0 thiss!1486 (_2!639 lt!15231)))))

(declare-fun lt!15239 () (_ BitVec 64))

(assert (=> b!9874 (= lt!15239 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!15225 () Unit!821)

(assert (=> b!9874 (= lt!15225 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!591 (_2!639 lt!15231)) lt!15239))))

(assert (=> b!9874 (validate_offset_bits!1 ((_ sign_extend 32) (size!252 (buf!591 (_2!639 lt!15231)))) ((_ sign_extend 32) (currentByte!1636 thiss!1486)) ((_ sign_extend 32) (currentBit!1631 thiss!1486)) lt!15239)))

(declare-fun lt!15259 () Unit!821)

(assert (=> b!9874 (= lt!15259 lt!15225)))

(declare-fun head!52 (List!146) Bool)

(assert (=> b!9874 (= (head!52 (byteArrayBitContentToList!0 (_2!639 lt!15231) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!52 (bitStreamReadBitsIntoList!0 (_2!639 lt!15231) (_1!641 lt!15244) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15254 () Unit!821)

(declare-fun Unit!841 () Unit!821)

(assert (=> b!9874 (= lt!15254 Unit!841)))

(assert (=> b!9874 (= lt!15227 (appendBitsMSBFirstLoop!0 (_2!639 lt!15231) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!15264 () Unit!821)

(assert (=> b!9874 (= lt!15264 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!639 lt!15231) (_2!639 lt!15227)))))

(assert (=> b!9874 (isPrefixOf!0 thiss!1486 (_2!639 lt!15227))))

(declare-fun lt!15266 () Unit!821)

(assert (=> b!9874 (= lt!15266 lt!15264)))

(assert (=> b!9874 (= (size!252 (buf!591 (_2!639 lt!15227))) (size!252 (buf!591 thiss!1486)))))

(declare-fun lt!15238 () Unit!821)

(declare-fun Unit!842 () Unit!821)

(assert (=> b!9874 (= lt!15238 Unit!842)))

(assert (=> b!9874 (= (bitIndex!0 (size!252 (buf!591 (_2!639 lt!15227))) (currentByte!1636 (_2!639 lt!15227)) (currentBit!1631 (_2!639 lt!15227))) (bvsub (bvadd (bitIndex!0 (size!252 (buf!591 thiss!1486)) (currentByte!1636 thiss!1486) (currentBit!1631 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!15258 () Unit!821)

(declare-fun Unit!843 () Unit!821)

(assert (=> b!9874 (= lt!15258 Unit!843)))

(assert (=> b!9874 (= (bitIndex!0 (size!252 (buf!591 (_2!639 lt!15227))) (currentByte!1636 (_2!639 lt!15227)) (currentBit!1631 (_2!639 lt!15227))) (bvsub (bvsub (bvadd (bitIndex!0 (size!252 (buf!591 (_2!639 lt!15231))) (currentByte!1636 (_2!639 lt!15231)) (currentBit!1631 (_2!639 lt!15231))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!15261 () Unit!821)

(declare-fun Unit!844 () Unit!821)

(assert (=> b!9874 (= lt!15261 Unit!844)))

(declare-fun lt!15243 () tuple2!1208)

(assert (=> b!9874 (= lt!15243 (reader!0 thiss!1486 (_2!639 lt!15227)))))

(declare-fun lt!15250 () (_ BitVec 64))

(assert (=> b!9874 (= lt!15250 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15251 () Unit!821)

(assert (=> b!9874 (= lt!15251 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!591 (_2!639 lt!15227)) lt!15250))))

(assert (=> b!9874 (validate_offset_bits!1 ((_ sign_extend 32) (size!252 (buf!591 (_2!639 lt!15227)))) ((_ sign_extend 32) (currentByte!1636 thiss!1486)) ((_ sign_extend 32) (currentBit!1631 thiss!1486)) lt!15250)))

(declare-fun lt!15230 () Unit!821)

(assert (=> b!9874 (= lt!15230 lt!15251)))

(declare-fun lt!15257 () tuple2!1208)

(declare-fun call!179 () tuple2!1208)

(assert (=> b!9874 (= lt!15257 call!179)))

(declare-fun lt!15241 () (_ BitVec 64))

(assert (=> b!9874 (= lt!15241 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!15236 () Unit!821)

(assert (=> b!9874 (= lt!15236 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!639 lt!15231) (buf!591 (_2!639 lt!15227)) lt!15241))))

(assert (=> b!9874 (validate_offset_bits!1 ((_ sign_extend 32) (size!252 (buf!591 (_2!639 lt!15227)))) ((_ sign_extend 32) (currentByte!1636 (_2!639 lt!15231))) ((_ sign_extend 32) (currentBit!1631 (_2!639 lt!15231))) lt!15241)))

(declare-fun lt!15245 () Unit!821)

(assert (=> b!9874 (= lt!15245 lt!15236)))

(declare-fun lt!15260 () List!146)

(assert (=> b!9874 (= lt!15260 (byteArrayBitContentToList!0 (_2!639 lt!15227) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!15246 () List!146)

(assert (=> b!9874 (= lt!15246 (byteArrayBitContentToList!0 (_2!639 lt!15227) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15229 () List!146)

(assert (=> b!9874 (= lt!15229 (bitStreamReadBitsIntoList!0 (_2!639 lt!15227) (_1!641 lt!15243) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!15249 () List!146)

(assert (=> b!9874 (= lt!15249 (bitStreamReadBitsIntoList!0 (_2!639 lt!15227) (_1!641 lt!15257) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!15262 () (_ BitVec 64))

(assert (=> b!9874 (= lt!15262 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!15224 () Unit!821)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!476 BitStream!476 BitStream!476 BitStream!476 (_ BitVec 64) List!146) Unit!821)

(assert (=> b!9874 (= lt!15224 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!639 lt!15227) (_2!639 lt!15227) (_1!641 lt!15243) (_1!641 lt!15257) lt!15262 lt!15229))))

(declare-fun tail!60 (List!146) List!146)

(assert (=> b!9874 (= (bitStreamReadBitsIntoList!0 (_2!639 lt!15227) (_1!641 lt!15257) (bvsub lt!15262 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!60 lt!15229))))

(declare-fun lt!15248 () Unit!821)

(assert (=> b!9874 (= lt!15248 lt!15224)))

(declare-fun lt!15232 () Unit!821)

(declare-fun lt!15226 () (_ BitVec 64))

(declare-fun arrayBitRangesEqImpliesEq!0 (array!583 array!583 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!821)

(assert (=> b!9874 (= lt!15232 (arrayBitRangesEqImpliesEq!0 (buf!591 (_2!639 lt!15231)) (buf!591 (_2!639 lt!15227)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!15226 (bitIndex!0 (size!252 (buf!591 (_2!639 lt!15231))) (currentByte!1636 (_2!639 lt!15231)) (currentBit!1631 (_2!639 lt!15231)))))))

(declare-fun bitAt!0 (array!583 (_ BitVec 64)) Bool)

(assert (=> b!9874 (= (bitAt!0 (buf!591 (_2!639 lt!15231)) lt!15226) (bitAt!0 (buf!591 (_2!639 lt!15227)) lt!15226))))

(declare-fun lt!15240 () Unit!821)

(assert (=> b!9874 (= lt!15240 lt!15232)))

(declare-fun b!9875 () Bool)

(declare-fun res!10000 () Bool)

(declare-fun e!6049 () Bool)

(assert (=> b!9875 (=> (not res!10000) (not e!6049))))

(declare-fun lt!15242 () tuple2!1204)

(assert (=> b!9875 (= res!10000 (isPrefixOf!0 thiss!1486 (_2!639 lt!15242)))))

(declare-fun b!9876 () Bool)

(declare-fun res!9996 () Bool)

(assert (=> b!9876 (=> (not res!9996) (not e!6049))))

(assert (=> b!9876 (= res!9996 (= (size!252 (buf!591 thiss!1486)) (size!252 (buf!591 (_2!639 lt!15242)))))))

(declare-fun c!661 () Bool)

(declare-fun bm!176 () Bool)

(assert (=> bm!176 (= call!179 (reader!0 (ite c!661 (_2!639 lt!15231) thiss!1486) (ite c!661 (_2!639 lt!15227) thiss!1486)))))

(declare-fun lt!15255 () tuple2!1208)

(declare-fun b!9877 () Bool)

(assert (=> b!9877 (= e!6049 (= (bitStreamReadBitsIntoList!0 (_2!639 lt!15242) (_1!641 lt!15255) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!639 lt!15242) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!9877 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9877 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!15235 () Unit!821)

(declare-fun lt!15228 () Unit!821)

(assert (=> b!9877 (= lt!15235 lt!15228)))

(declare-fun lt!15234 () (_ BitVec 64))

(assert (=> b!9877 (validate_offset_bits!1 ((_ sign_extend 32) (size!252 (buf!591 (_2!639 lt!15242)))) ((_ sign_extend 32) (currentByte!1636 thiss!1486)) ((_ sign_extend 32) (currentBit!1631 thiss!1486)) lt!15234)))

(assert (=> b!9877 (= lt!15228 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!591 (_2!639 lt!15242)) lt!15234))))

(declare-fun e!6051 () Bool)

(assert (=> b!9877 e!6051))

(declare-fun res!9999 () Bool)

(assert (=> b!9877 (=> (not res!9999) (not e!6051))))

(assert (=> b!9877 (= res!9999 (and (= (size!252 (buf!591 thiss!1486)) (size!252 (buf!591 (_2!639 lt!15242)))) (bvsge lt!15234 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9877 (= lt!15234 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!9877 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9877 (= lt!15255 (reader!0 thiss!1486 (_2!639 lt!15242)))))

(declare-fun d!3148 () Bool)

(assert (=> d!3148 e!6049))

(declare-fun res!10001 () Bool)

(assert (=> d!3148 (=> (not res!10001) (not e!6049))))

(declare-fun lt!15256 () (_ BitVec 64))

(assert (=> d!3148 (= res!10001 (= (bitIndex!0 (size!252 (buf!591 (_2!639 lt!15242))) (currentByte!1636 (_2!639 lt!15242)) (currentBit!1631 (_2!639 lt!15242))) (bvsub lt!15256 from!367)))))

(assert (=> d!3148 (or (= (bvand lt!15256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15256 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15256 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

