; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!2012 () Bool)

(assert start!2012)

(declare-fun b!9563 () Bool)

(declare-fun e!5902 () Bool)

(declare-fun e!5905 () Bool)

(assert (=> b!9563 (= e!5902 e!5905)))

(declare-fun res!9790 () Bool)

(assert (=> b!9563 (=> (not res!9790) (not e!5905))))

(declare-datatypes ((array!579 0))(
  ( (array!580 (arr!661 (Array (_ BitVec 32) (_ BitVec 8))) (size!250 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!472 0))(
  ( (BitStream!473 (buf!589 array!579) (currentByte!1634 (_ BitVec 32)) (currentBit!1629 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!817 0))(
  ( (Unit!818) )
))
(declare-datatypes ((tuple2!1192 0))(
  ( (tuple2!1193 (_1!633 Unit!817) (_2!633 BitStream!472)) )
))
(declare-fun lt!14494 () tuple2!1192)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!9563 (= res!9790 (invariant!0 (currentBit!1629 (_2!633 lt!14494)) (currentByte!1634 (_2!633 lt!14494)) (size!250 (buf!589 (_2!633 lt!14494)))))))

(declare-fun from!367 () (_ BitVec 64))

(declare-fun srcBuffer!6 () array!579)

(declare-fun nBits!460 () (_ BitVec 64))

(declare-fun thiss!1486 () BitStream!472)

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!472 array!579 (_ BitVec 64) (_ BitVec 64)) tuple2!1192)

(assert (=> b!9563 (= lt!14494 (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)))))

(declare-fun b!9564 () Bool)

(declare-fun res!9786 () Bool)

(assert (=> b!9564 (=> (not res!9786) (not e!5905))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!9564 (= res!9786 (= (bitIndex!0 (size!250 (buf!589 (_2!633 lt!14494))) (currentByte!1634 (_2!633 lt!14494)) (currentBit!1629 (_2!633 lt!14494))) (bvadd (bitIndex!0 (size!250 (buf!589 thiss!1486)) (currentByte!1634 thiss!1486) (currentBit!1629 thiss!1486)) nBits!460)))))

(declare-fun b!9565 () Bool)

(declare-fun e!5903 () Bool)

(declare-datatypes ((List!144 0))(
  ( (Nil!141) (Cons!140 (h!259 Bool) (t!894 List!144)) )
))
(declare-fun lt!14491 () List!144)

(declare-fun byteArrayBitContentToList!0 (BitStream!472 array!579 (_ BitVec 64) (_ BitVec 64)) List!144)

(assert (=> b!9565 (= e!5903 (= lt!14491 (byteArrayBitContentToList!0 (_2!633 lt!14494) srcBuffer!6 from!367 nBits!460)))))

(declare-fun b!9566 () Bool)

(declare-fun res!9787 () Bool)

(assert (=> b!9566 (=> (not res!9787) (not e!5905))))

(assert (=> b!9566 (= res!9787 (= (size!250 (buf!589 thiss!1486)) (size!250 (buf!589 (_2!633 lt!14494)))))))

(declare-fun b!9567 () Bool)

(declare-fun res!9788 () Bool)

(assert (=> b!9567 (=> (not res!9788) (not e!5905))))

(declare-fun isPrefixOf!0 (BitStream!472 BitStream!472) Bool)

(assert (=> b!9567 (= res!9788 (isPrefixOf!0 thiss!1486 (_2!633 lt!14494)))))

(declare-fun b!9568 () Bool)

(assert (=> b!9568 (= e!5905 (not e!5903))))

(declare-fun res!9789 () Bool)

(assert (=> b!9568 (=> res!9789 e!5903)))

(declare-datatypes ((tuple2!1194 0))(
  ( (tuple2!1195 (_1!634 array!579) (_2!634 BitStream!472)) )
))
(declare-fun lt!14493 () tuple2!1194)

(assert (=> b!9568 (= res!9789 (not (= (byteArrayBitContentToList!0 (_2!633 lt!14494) (_1!634 lt!14493) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) lt!14491)))))

(declare-datatypes ((tuple2!1196 0))(
  ( (tuple2!1197 (_1!635 BitStream!472) (_2!635 BitStream!472)) )
))
(declare-fun lt!14495 () tuple2!1196)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!472 BitStream!472 (_ BitVec 64)) List!144)

(assert (=> b!9568 (= lt!14491 (bitStreamReadBitsIntoList!0 (_2!633 lt!14494) (_1!635 lt!14495) nBits!460))))

(declare-fun readBits!0 (BitStream!472 (_ BitVec 64)) tuple2!1194)

(assert (=> b!9568 (= lt!14493 (readBits!0 (_1!635 lt!14495) nBits!460))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9568 (validate_offset_bits!1 ((_ sign_extend 32) (size!250 (buf!589 (_2!633 lt!14494)))) ((_ sign_extend 32) (currentByte!1634 thiss!1486)) ((_ sign_extend 32) (currentBit!1629 thiss!1486)) nBits!460)))

(declare-fun lt!14492 () Unit!817)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!472 array!579 (_ BitVec 64)) Unit!817)

(assert (=> b!9568 (= lt!14492 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!589 (_2!633 lt!14494)) nBits!460))))

(declare-fun reader!0 (BitStream!472 BitStream!472) tuple2!1196)

(assert (=> b!9568 (= lt!14495 (reader!0 thiss!1486 (_2!633 lt!14494)))))

(declare-fun res!9784 () Bool)

(assert (=> start!2012 (=> (not res!9784) (not e!5902))))

(assert (=> start!2012 (= res!9784 (and (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge from!367 #b0000000000000000000000000000000000000000000000000000000000000000) (bvslt from!367 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 nBits!460)) (bvsle (bvadd nBits!460 from!367) (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!250 srcBuffer!6))))))))

(assert (=> start!2012 e!5902))

(assert (=> start!2012 true))

(declare-fun array_inv!242 (array!579) Bool)

(assert (=> start!2012 (array_inv!242 srcBuffer!6)))

(declare-fun e!5901 () Bool)

(declare-fun inv!12 (BitStream!472) Bool)

(assert (=> start!2012 (and (inv!12 thiss!1486) e!5901)))

(declare-fun b!9569 () Bool)

(assert (=> b!9569 (= e!5901 (array_inv!242 (buf!589 thiss!1486)))))

(declare-fun b!9570 () Bool)

(declare-fun res!9785 () Bool)

(assert (=> b!9570 (=> (not res!9785) (not e!5902))))

(assert (=> b!9570 (= res!9785 (validate_offset_bits!1 ((_ sign_extend 32) (size!250 (buf!589 thiss!1486))) ((_ sign_extend 32) (currentByte!1634 thiss!1486)) ((_ sign_extend 32) (currentBit!1629 thiss!1486)) nBits!460))))

(assert (= (and start!2012 res!9784) b!9570))

(assert (= (and b!9570 res!9785) b!9563))

(assert (= (and b!9563 res!9790) b!9566))

(assert (= (and b!9566 res!9787) b!9564))

(assert (= (and b!9564 res!9786) b!9567))

(assert (= (and b!9567 res!9788) b!9568))

(assert (= (and b!9568 (not res!9789)) b!9565))

(assert (= start!2012 b!9569))

(declare-fun m!13835 () Bool)

(assert (=> b!9570 m!13835))

(declare-fun m!13837 () Bool)

(assert (=> b!9565 m!13837))

(declare-fun m!13839 () Bool)

(assert (=> b!9569 m!13839))

(declare-fun m!13841 () Bool)

(assert (=> b!9568 m!13841))

(declare-fun m!13843 () Bool)

(assert (=> b!9568 m!13843))

(declare-fun m!13845 () Bool)

(assert (=> b!9568 m!13845))

(declare-fun m!13847 () Bool)

(assert (=> b!9568 m!13847))

(declare-fun m!13849 () Bool)

(assert (=> b!9568 m!13849))

(declare-fun m!13851 () Bool)

(assert (=> b!9568 m!13851))

(declare-fun m!13853 () Bool)

(assert (=> b!9564 m!13853))

(declare-fun m!13855 () Bool)

(assert (=> b!9564 m!13855))

(declare-fun m!13857 () Bool)

(assert (=> b!9563 m!13857))

(declare-fun m!13859 () Bool)

(assert (=> b!9563 m!13859))

(declare-fun m!13861 () Bool)

(assert (=> start!2012 m!13861))

(declare-fun m!13863 () Bool)

(assert (=> start!2012 m!13863))

(declare-fun m!13865 () Bool)

(assert (=> b!9567 m!13865))

(push 1)

(assert (not b!9568))

(assert (not b!9565))

(assert (not b!9564))

(assert (not b!9563))

(assert (not b!9567))

(assert (not b!9570))

(assert (not start!2012))

(assert (not b!9569))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!3094 () Bool)

(declare-fun c!617 () Bool)

(assert (=> d!3094 (= c!617 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!5957 () List!144)

(assert (=> d!3094 (= (byteArrayBitContentToList!0 (_2!633 lt!14494) srcBuffer!6 from!367 nBits!460) e!5957)))

(declare-fun b!9641 () Bool)

(assert (=> b!9641 (= e!5957 Nil!141)))

(declare-fun b!9642 () Bool)

(assert (=> b!9642 (= e!5957 (Cons!140 (not (= (bvand ((_ sign_extend 24) (select (arr!661 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!633 lt!14494) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3094 c!617) b!9641))

(assert (= (and d!3094 (not c!617)) b!9642))

(declare-fun m!13939 () Bool)

(assert (=> b!9642 m!13939))

(declare-fun m!13941 () Bool)

(assert (=> b!9642 m!13941))

(declare-fun m!13943 () Bool)

(assert (=> b!9642 m!13943))

(assert (=> b!9565 d!3094))

(declare-fun d!3096 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!3096 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!250 (buf!589 thiss!1486))) ((_ sign_extend 32) (currentByte!1634 thiss!1486)) ((_ sign_extend 32) (currentBit!1629 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!250 (buf!589 thiss!1486))) ((_ sign_extend 32) (currentByte!1634 thiss!1486)) ((_ sign_extend 32) (currentBit!1629 thiss!1486))) nBits!460))))

(declare-fun bs!934 () Bool)

(assert (= bs!934 d!3096))

(declare-fun m!13945 () Bool)

(assert (=> bs!934 m!13945))

(assert (=> b!9570 d!3096))

(declare-fun d!3098 () Bool)

(declare-fun e!5967 () Bool)

(assert (=> d!3098 e!5967))

(declare-fun res!9863 () Bool)

(assert (=> d!3098 (=> (not res!9863) (not e!5967))))

(declare-fun lt!14566 () (_ BitVec 64))

(declare-fun lt!14565 () (_ BitVec 64))

(declare-fun lt!14563 () (_ BitVec 64))

(assert (=> d!3098 (= res!9863 (= lt!14565 (bvsub lt!14566 lt!14563)))))

(assert (=> d!3098 (or (= (bvand lt!14566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14563 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14566 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14566 lt!14563) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3098 (= lt!14563 (remainingBits!0 ((_ sign_extend 32) (size!250 (buf!589 (_2!633 lt!14494)))) ((_ sign_extend 32) (currentByte!1634 (_2!633 lt!14494))) ((_ sign_extend 32) (currentBit!1629 (_2!633 lt!14494)))))))

(declare-fun lt!14567 () (_ BitVec 64))

(declare-fun lt!14564 () (_ BitVec 64))

(assert (=> d!3098 (= lt!14566 (bvmul lt!14567 lt!14564))))

(assert (=> d!3098 (or (= lt!14567 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!14564 (bvsdiv (bvmul lt!14567 lt!14564) lt!14567)))))

(assert (=> d!3098 (= lt!14564 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3098 (= lt!14567 ((_ sign_extend 32) (size!250 (buf!589 (_2!633 lt!14494)))))))

(assert (=> d!3098 (= lt!14565 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1634 (_2!633 lt!14494))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1629 (_2!633 lt!14494)))))))

(assert (=> d!3098 (invariant!0 (currentBit!1629 (_2!633 lt!14494)) (currentByte!1634 (_2!633 lt!14494)) (size!250 (buf!589 (_2!633 lt!14494))))))

(assert (=> d!3098 (= (bitIndex!0 (size!250 (buf!589 (_2!633 lt!14494))) (currentByte!1634 (_2!633 lt!14494)) (currentBit!1629 (_2!633 lt!14494))) lt!14565)))

(declare-fun b!9661 () Bool)

(declare-fun res!9864 () Bool)

(assert (=> b!9661 (=> (not res!9864) (not e!5967))))

(assert (=> b!9661 (= res!9864 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!14565))))

(declare-fun b!9662 () Bool)

(declare-fun lt!14562 () (_ BitVec 64))

(assert (=> b!9662 (= e!5967 (bvsle lt!14565 (bvmul lt!14562 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9662 (or (= lt!14562 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!14562 #b0000000000000000000000000000000000000000000000000000000000001000) lt!14562)))))

(assert (=> b!9662 (= lt!14562 ((_ sign_extend 32) (size!250 (buf!589 (_2!633 lt!14494)))))))

(assert (= (and d!3098 res!9863) b!9661))

(assert (= (and b!9661 res!9864) b!9662))

(declare-fun m!13959 () Bool)

(assert (=> d!3098 m!13959))

(assert (=> d!3098 m!13857))

(assert (=> b!9564 d!3098))

(declare-fun d!3108 () Bool)

(declare-fun e!5968 () Bool)

(assert (=> d!3108 e!5968))

(declare-fun res!9865 () Bool)

(assert (=> d!3108 (=> (not res!9865) (not e!5968))))

(declare-fun lt!14572 () (_ BitVec 64))

(declare-fun lt!14569 () (_ BitVec 64))

(declare-fun lt!14571 () (_ BitVec 64))

(assert (=> d!3108 (= res!9865 (= lt!14571 (bvsub lt!14572 lt!14569)))))

(assert (=> d!3108 (or (= (bvand lt!14572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14569 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14572 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14572 lt!14569) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3108 (= lt!14569 (remainingBits!0 ((_ sign_extend 32) (size!250 (buf!589 thiss!1486))) ((_ sign_extend 32) (currentByte!1634 thiss!1486)) ((_ sign_extend 32) (currentBit!1629 thiss!1486))))))

(declare-fun lt!14573 () (_ BitVec 64))

(declare-fun lt!14570 () (_ BitVec 64))

(assert (=> d!3108 (= lt!14572 (bvmul lt!14573 lt!14570))))

(assert (=> d!3108 (or (= lt!14573 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!14570 (bvsdiv (bvmul lt!14573 lt!14570) lt!14573)))))

(assert (=> d!3108 (= lt!14570 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!3108 (= lt!14573 ((_ sign_extend 32) (size!250 (buf!589 thiss!1486))))))

(assert (=> d!3108 (= lt!14571 (bvadd (bvmul ((_ sign_extend 32) (currentByte!1634 thiss!1486)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!1629 thiss!1486))))))

(assert (=> d!3108 (invariant!0 (currentBit!1629 thiss!1486) (currentByte!1634 thiss!1486) (size!250 (buf!589 thiss!1486)))))

(assert (=> d!3108 (= (bitIndex!0 (size!250 (buf!589 thiss!1486)) (currentByte!1634 thiss!1486) (currentBit!1629 thiss!1486)) lt!14571)))

(declare-fun b!9663 () Bool)

(declare-fun res!9866 () Bool)

(assert (=> b!9663 (=> (not res!9866) (not e!5968))))

(assert (=> b!9663 (= res!9866 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!14571))))

(declare-fun b!9664 () Bool)

(declare-fun lt!14568 () (_ BitVec 64))

(assert (=> b!9664 (= e!5968 (bvsle lt!14571 (bvmul lt!14568 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!9664 (or (= lt!14568 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!14568 #b0000000000000000000000000000000000000000000000000000000000001000) lt!14568)))))

(assert (=> b!9664 (= lt!14568 ((_ sign_extend 32) (size!250 (buf!589 thiss!1486))))))

(assert (= (and d!3108 res!9865) b!9663))

(assert (= (and b!9663 res!9866) b!9664))

(assert (=> d!3108 m!13945))

(declare-fun m!13961 () Bool)

(assert (=> d!3108 m!13961))

(assert (=> b!9564 d!3108))

(declare-fun d!3110 () Bool)

(assert (=> d!3110 (= (array_inv!242 (buf!589 thiss!1486)) (bvsge (size!250 (buf!589 thiss!1486)) #b00000000000000000000000000000000))))

(assert (=> b!9569 d!3110))

(declare-fun d!3112 () Bool)

(assert (=> d!3112 (= (invariant!0 (currentBit!1629 (_2!633 lt!14494)) (currentByte!1634 (_2!633 lt!14494)) (size!250 (buf!589 (_2!633 lt!14494)))) (and (bvsge (currentBit!1629 (_2!633 lt!14494)) #b00000000000000000000000000000000) (bvslt (currentBit!1629 (_2!633 lt!14494)) #b00000000000000000000000000001000) (bvsge (currentByte!1634 (_2!633 lt!14494)) #b00000000000000000000000000000000) (or (bvslt (currentByte!1634 (_2!633 lt!14494)) (size!250 (buf!589 (_2!633 lt!14494)))) (and (= (currentBit!1629 (_2!633 lt!14494)) #b00000000000000000000000000000000) (= (currentByte!1634 (_2!633 lt!14494)) (size!250 (buf!589 (_2!633 lt!14494))))))))))

(assert (=> b!9563 d!3112))

(declare-fun b!9773 () Bool)

(declare-fun lt!14884 () tuple2!1196)

(declare-fun e!6010 () Bool)

(declare-fun lt!14886 () tuple2!1192)

(assert (=> b!9773 (= e!6010 (= (bitStreamReadBitsIntoList!0 (_2!633 lt!14886) (_1!635 lt!14884) (bvsub (bvadd from!367 nBits!460) from!367)) (byteArrayBitContentToList!0 (_2!633 lt!14886) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367))))))

(assert (=> b!9773 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9773 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!14879 () Unit!817)

(declare-fun lt!14897 () Unit!817)

(assert (=> b!9773 (= lt!14879 lt!14897)))

(declare-fun lt!14872 () (_ BitVec 64))

(assert (=> b!9773 (validate_offset_bits!1 ((_ sign_extend 32) (size!250 (buf!589 (_2!633 lt!14886)))) ((_ sign_extend 32) (currentByte!1634 thiss!1486)) ((_ sign_extend 32) (currentBit!1629 thiss!1486)) lt!14872)))

(assert (=> b!9773 (= lt!14897 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!589 (_2!633 lt!14886)) lt!14872))))

(declare-fun e!6009 () Bool)

(assert (=> b!9773 e!6009))

(declare-fun res!9931 () Bool)

(assert (=> b!9773 (=> (not res!9931) (not e!6009))))

(assert (=> b!9773 (= res!9931 (and (= (size!250 (buf!589 thiss!1486)) (size!250 (buf!589 (_2!633 lt!14886)))) (bvsge lt!14872 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9773 (= lt!14872 (bvsub (bvadd from!367 nBits!460) from!367))))

(assert (=> b!9773 (or (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvadd from!367 nBits!460) from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9773 (= lt!14884 (reader!0 thiss!1486 (_2!633 lt!14886)))))

(declare-fun b!9775 () Bool)

(declare-fun e!6011 () tuple2!1192)

(declare-fun lt!14898 () tuple2!1192)

(declare-fun Unit!823 () Unit!817)

(assert (=> b!9775 (= e!6011 (tuple2!1193 Unit!823 (_2!633 lt!14898)))))

(declare-fun lt!14893 () tuple2!1192)

(declare-fun appendBitFromByte!0 (BitStream!472 (_ BitVec 8) (_ BitVec 32)) tuple2!1192)

(assert (=> b!9775 (= lt!14893 (appendBitFromByte!0 thiss!1486 (select (arr!661 srcBuffer!6) ((_ extract 31 0) (bvsdiv from!367 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem from!367 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!14873 () (_ BitVec 64))

(assert (=> b!9775 (= lt!14873 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!14890 () (_ BitVec 64))

(assert (=> b!9775 (= lt!14890 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!14903 () Unit!817)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!472 BitStream!472 (_ BitVec 64) (_ BitVec 64)) Unit!817)

(assert (=> b!9775 (= lt!14903 (validateOffsetBitsIneqLemma!0 thiss!1486 (_2!633 lt!14893) lt!14873 lt!14890))))

(assert (=> b!9775 (validate_offset_bits!1 ((_ sign_extend 32) (size!250 (buf!589 (_2!633 lt!14893)))) ((_ sign_extend 32) (currentByte!1634 (_2!633 lt!14893))) ((_ sign_extend 32) (currentBit!1629 (_2!633 lt!14893))) (bvsub lt!14873 lt!14890))))

(declare-fun lt!14871 () Unit!817)

(assert (=> b!9775 (= lt!14871 lt!14903)))

(declare-fun lt!14875 () tuple2!1196)

(assert (=> b!9775 (= lt!14875 (reader!0 thiss!1486 (_2!633 lt!14893)))))

(declare-fun lt!14902 () (_ BitVec 64))

(assert (=> b!9775 (= lt!14902 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!14901 () Unit!817)

(assert (=> b!9775 (= lt!14901 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!589 (_2!633 lt!14893)) lt!14902))))

(assert (=> b!9775 (validate_offset_bits!1 ((_ sign_extend 32) (size!250 (buf!589 (_2!633 lt!14893)))) ((_ sign_extend 32) (currentByte!1634 thiss!1486)) ((_ sign_extend 32) (currentBit!1629 thiss!1486)) lt!14902)))

(declare-fun lt!14870 () Unit!817)

(assert (=> b!9775 (= lt!14870 lt!14901)))

(declare-fun head!50 (List!144) Bool)

(assert (=> b!9775 (= (head!50 (byteArrayBitContentToList!0 (_2!633 lt!14893) srcBuffer!6 from!367 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!50 (bitStreamReadBitsIntoList!0 (_2!633 lt!14893) (_1!635 lt!14875) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14860 () Unit!817)

(declare-fun Unit!824 () Unit!817)

(assert (=> b!9775 (= lt!14860 Unit!824)))

(assert (=> b!9775 (= lt!14898 (appendBitsMSBFirstLoop!0 (_2!633 lt!14893) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvadd from!367 nBits!460)))))

(declare-fun lt!14866 () Unit!817)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!472 BitStream!472 BitStream!472) Unit!817)

(assert (=> b!9775 (= lt!14866 (lemmaIsPrefixTransitive!0 thiss!1486 (_2!633 lt!14893) (_2!633 lt!14898)))))

(assert (=> b!9775 (isPrefixOf!0 thiss!1486 (_2!633 lt!14898))))

(declare-fun lt!14895 () Unit!817)

(assert (=> b!9775 (= lt!14895 lt!14866)))

(assert (=> b!9775 (= (size!250 (buf!589 (_2!633 lt!14898))) (size!250 (buf!589 thiss!1486)))))

(declare-fun lt!14885 () Unit!817)

(declare-fun Unit!825 () Unit!817)

(assert (=> b!9775 (= lt!14885 Unit!825)))

(assert (=> b!9775 (= (bitIndex!0 (size!250 (buf!589 (_2!633 lt!14898))) (currentByte!1634 (_2!633 lt!14898)) (currentBit!1629 (_2!633 lt!14898))) (bvsub (bvadd (bitIndex!0 (size!250 (buf!589 thiss!1486)) (currentByte!1634 thiss!1486) (currentBit!1629 thiss!1486)) from!367 nBits!460) from!367))))

(declare-fun lt!14869 () Unit!817)

(declare-fun Unit!826 () Unit!817)

(assert (=> b!9775 (= lt!14869 Unit!826)))

(assert (=> b!9775 (= (bitIndex!0 (size!250 (buf!589 (_2!633 lt!14898))) (currentByte!1634 (_2!633 lt!14898)) (currentBit!1629 (_2!633 lt!14898))) (bvsub (bvsub (bvadd (bitIndex!0 (size!250 (buf!589 (_2!633 lt!14893))) (currentByte!1634 (_2!633 lt!14893)) (currentBit!1629 (_2!633 lt!14893))) from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!14865 () Unit!817)

(declare-fun Unit!827 () Unit!817)

(assert (=> b!9775 (= lt!14865 Unit!827)))

(declare-fun lt!14878 () tuple2!1196)

(assert (=> b!9775 (= lt!14878 (reader!0 thiss!1486 (_2!633 lt!14898)))))

(declare-fun lt!14877 () (_ BitVec 64))

(assert (=> b!9775 (= lt!14877 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!14891 () Unit!817)

(assert (=> b!9775 (= lt!14891 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!589 (_2!633 lt!14898)) lt!14877))))

(assert (=> b!9775 (validate_offset_bits!1 ((_ sign_extend 32) (size!250 (buf!589 (_2!633 lt!14898)))) ((_ sign_extend 32) (currentByte!1634 thiss!1486)) ((_ sign_extend 32) (currentBit!1629 thiss!1486)) lt!14877)))

(declare-fun lt!14894 () Unit!817)

(assert (=> b!9775 (= lt!14894 lt!14891)))

(declare-fun lt!14899 () tuple2!1196)

(declare-fun call!173 () tuple2!1196)

(assert (=> b!9775 (= lt!14899 call!173)))

(declare-fun lt!14867 () (_ BitVec 64))

(assert (=> b!9775 (= lt!14867 (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!14868 () Unit!817)

(assert (=> b!9775 (= lt!14868 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!633 lt!14893) (buf!589 (_2!633 lt!14898)) lt!14867))))

(assert (=> b!9775 (validate_offset_bits!1 ((_ sign_extend 32) (size!250 (buf!589 (_2!633 lt!14898)))) ((_ sign_extend 32) (currentByte!1634 (_2!633 lt!14893))) ((_ sign_extend 32) (currentBit!1629 (_2!633 lt!14893))) lt!14867)))

(declare-fun lt!14888 () Unit!817)

(assert (=> b!9775 (= lt!14888 lt!14868)))

(declare-fun lt!14887 () List!144)

(assert (=> b!9775 (= lt!14887 (byteArrayBitContentToList!0 (_2!633 lt!14898) srcBuffer!6 from!367 (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!14861 () List!144)

(assert (=> b!9775 (= lt!14861 (byteArrayBitContentToList!0 (_2!633 lt!14898) srcBuffer!6 (bvadd from!367 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14862 () List!144)

(assert (=> b!9775 (= lt!14862 (bitStreamReadBitsIntoList!0 (_2!633 lt!14898) (_1!635 lt!14878) (bvsub (bvadd from!367 nBits!460) from!367)))))

(declare-fun lt!14874 () List!144)

(assert (=> b!9775 (= lt!14874 (bitStreamReadBitsIntoList!0 (_2!633 lt!14898) (_1!635 lt!14899) (bvsub (bvsub (bvadd from!367 nBits!460) from!367) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!14863 () (_ BitVec 64))

(assert (=> b!9775 (= lt!14863 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun lt!14883 () Unit!817)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!472 BitStream!472 BitStream!472 BitStream!472 (_ BitVec 64) List!144) Unit!817)

(assert (=> b!9775 (= lt!14883 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!633 lt!14898) (_2!633 lt!14898) (_1!635 lt!14878) (_1!635 lt!14899) lt!14863 lt!14862))))

(declare-fun tail!58 (List!144) List!144)

(assert (=> b!9775 (= (bitStreamReadBitsIntoList!0 (_2!633 lt!14898) (_1!635 lt!14899) (bvsub lt!14863 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!58 lt!14862))))

(declare-fun lt!14889 () Unit!817)

(assert (=> b!9775 (= lt!14889 lt!14883)))

(declare-fun lt!14880 () (_ BitVec 64))

(declare-fun lt!14900 () Unit!817)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!579 array!579 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!817)

(assert (=> b!9775 (= lt!14900 (arrayBitRangesEqImpliesEq!0 (buf!589 (_2!633 lt!14893)) (buf!589 (_2!633 lt!14898)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!14880 (bitIndex!0 (size!250 (buf!589 (_2!633 lt!14893))) (currentByte!1634 (_2!633 lt!14893)) (currentBit!1629 (_2!633 lt!14893)))))))

(declare-fun bitAt!0 (array!579 (_ BitVec 64)) Bool)

(assert (=> b!9775 (= (bitAt!0 (buf!589 (_2!633 lt!14893)) lt!14880) (bitAt!0 (buf!589 (_2!633 lt!14898)) lt!14880))))

(declare-fun lt!14882 () Unit!817)

(assert (=> b!9775 (= lt!14882 lt!14900)))

(declare-fun b!9776 () Bool)

(assert (=> b!9776 (= e!6009 (validate_offset_bits!1 ((_ sign_extend 32) (size!250 (buf!589 thiss!1486))) ((_ sign_extend 32) (currentByte!1634 thiss!1486)) ((_ sign_extend 32) (currentBit!1629 thiss!1486)) lt!14872))))

(declare-fun b!9777 () Bool)

(declare-fun res!9929 () Bool)

(assert (=> b!9777 (=> (not res!9929) (not e!6010))))

(assert (=> b!9777 (= res!9929 (= (size!250 (buf!589 (_2!633 lt!14886))) (size!250 (buf!589 thiss!1486))))))

(declare-fun b!9778 () Bool)

(declare-fun res!9930 () Bool)

(assert (=> b!9778 (=> (not res!9930) (not e!6010))))

(assert (=> b!9778 (= res!9930 (= (size!250 (buf!589 thiss!1486)) (size!250 (buf!589 (_2!633 lt!14886)))))))

(declare-fun c!645 () Bool)

(declare-fun bm!170 () Bool)

(assert (=> bm!170 (= call!173 (reader!0 (ite c!645 (_2!633 lt!14893) thiss!1486) (ite c!645 (_2!633 lt!14898) thiss!1486)))))

(declare-fun b!9779 () Bool)

(declare-fun res!9927 () Bool)

(assert (=> b!9779 (=> (not res!9927) (not e!6010))))

(assert (=> b!9779 (= res!9927 (invariant!0 (currentBit!1629 (_2!633 lt!14886)) (currentByte!1634 (_2!633 lt!14886)) (size!250 (buf!589 (_2!633 lt!14886)))))))

(declare-fun b!9780 () Bool)

(declare-fun res!9932 () Bool)

(assert (=> b!9780 (=> (not res!9932) (not e!6010))))

(assert (=> b!9780 (= res!9932 (isPrefixOf!0 thiss!1486 (_2!633 lt!14886)))))

(declare-fun b!9774 () Bool)

(declare-fun Unit!829 () Unit!817)

(assert (=> b!9774 (= e!6011 (tuple2!1193 Unit!829 thiss!1486))))

(assert (=> b!9774 (= (size!250 (buf!589 thiss!1486)) (size!250 (buf!589 thiss!1486)))))

(declare-fun lt!14892 () Unit!817)

(declare-fun Unit!830 () Unit!817)

(assert (=> b!9774 (= lt!14892 Unit!830)))

(declare-fun checkByteArrayBitContent!0 (BitStream!472 array!579 array!579 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9774 (checkByteArrayBitContent!0 thiss!1486 srcBuffer!6 (_1!634 (readBits!0 (_1!635 call!173) (bvsub (bvadd from!367 nBits!460) from!367))) from!367 #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub (bvadd from!367 nBits!460) from!367))))

(declare-fun d!3116 () Bool)

(assert (=> d!3116 e!6010))

(declare-fun res!9928 () Bool)

(assert (=> d!3116 (=> (not res!9928) (not e!6010))))

(declare-fun lt!14864 () (_ BitVec 64))

(assert (=> d!3116 (= res!9928 (= (bitIndex!0 (size!250 (buf!589 (_2!633 lt!14886))) (currentByte!1634 (_2!633 lt!14886)) (currentBit!1629 (_2!633 lt!14886))) (bvsub lt!14864 from!367)))))

(assert (=> d!3116 (or (= (bvand lt!14864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand from!367 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14864 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14864 from!367) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!14896 () (_ BitVec 64))

(assert (=> d!3116 (= lt!14864 (bvadd lt!14896 from!367 nBits!460))))

(assert (=> d!3116 (or (not (= (bvand lt!14896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!14896 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!14896 from!367 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!3116 (= lt!14896 (bitIndex!0 (size!250 (buf!589 thiss!1486)) (currentByte!1634 thiss!1486) (currentBit!1629 thiss!1486)))))

(assert (=> d!3116 (= lt!14886 e!6011)))

(assert (=> d!3116 (= c!645 (bvslt from!367 (bvadd from!367 nBits!460)))))

(declare-fun lt!14876 () Unit!817)

(declare-fun lt!14881 () Unit!817)

(assert (=> d!3116 (= lt!14876 lt!14881)))

(assert (=> d!3116 (isPrefixOf!0 thiss!1486 thiss!1486)))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!472) Unit!817)

(assert (=> d!3116 (= lt!14881 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3116 (= lt!14880 (bitIndex!0 (size!250 (buf!589 thiss!1486)) (currentByte!1634 thiss!1486) (currentBit!1629 thiss!1486)))))

(assert (=> d!3116 (bvsge (bvadd from!367 nBits!460) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3116 (= (appendBitsMSBFirstLoop!0 thiss!1486 srcBuffer!6 from!367 (bvadd from!367 nBits!460)) lt!14886)))

(assert (= (and d!3116 c!645) b!9775))

(assert (= (and d!3116 (not c!645)) b!9774))

(assert (= (or b!9775 b!9774) bm!170))

(assert (= (and d!3116 res!9928) b!9779))

(assert (= (and b!9779 res!9927) b!9778))

(assert (= (and b!9778 res!9930) b!9780))

(assert (= (and b!9780 res!9932) b!9777))

(assert (= (and b!9777 res!9929) b!9773))

(assert (= (and b!9773 res!9931) b!9776))

(declare-fun m!14083 () Bool)

(assert (=> b!9774 m!14083))

(declare-fun m!14085 () Bool)

(assert (=> b!9774 m!14085))

(declare-fun m!14087 () Bool)

(assert (=> b!9773 m!14087))

(declare-fun m!14089 () Bool)

(assert (=> b!9773 m!14089))

(declare-fun m!14091 () Bool)

(assert (=> b!9773 m!14091))

(declare-fun m!14093 () Bool)

(assert (=> b!9773 m!14093))

(declare-fun m!14095 () Bool)

(assert (=> b!9773 m!14095))

(declare-fun m!14097 () Bool)

(assert (=> d!3116 m!14097))

(assert (=> d!3116 m!13855))

(declare-fun m!14099 () Bool)

(assert (=> d!3116 m!14099))

(declare-fun m!14101 () Bool)

(assert (=> d!3116 m!14101))

(declare-fun m!14103 () Bool)

(assert (=> bm!170 m!14103))

(declare-fun m!14105 () Bool)

(assert (=> b!9780 m!14105))

(declare-fun m!14107 () Bool)

(assert (=> b!9776 m!14107))

(declare-fun m!14109 () Bool)

(assert (=> b!9779 m!14109))

(declare-fun m!14111 () Bool)

(assert (=> b!9775 m!14111))

(declare-fun m!14113 () Bool)

(assert (=> b!9775 m!14113))

(declare-fun m!14115 () Bool)

(assert (=> b!9775 m!14115))

(assert (=> b!9775 m!13855))

(declare-fun m!14117 () Bool)

(assert (=> b!9775 m!14117))

(declare-fun m!14119 () Bool)

(assert (=> b!9775 m!14119))

(declare-fun m!14121 () Bool)

(assert (=> b!9775 m!14121))

(declare-fun m!14123 () Bool)

(assert (=> b!9775 m!14123))

(declare-fun m!14125 () Bool)

(assert (=> b!9775 m!14125))

(declare-fun m!14127 () Bool)

(assert (=> b!9775 m!14127))

(declare-fun m!14129 () Bool)

(assert (=> b!9775 m!14129))

(declare-fun m!14131 () Bool)

(assert (=> b!9775 m!14131))

(declare-fun m!14133 () Bool)

(assert (=> b!9775 m!14133))

(declare-fun m!14135 () Bool)

(assert (=> b!9775 m!14135))

(declare-fun m!14137 () Bool)

(assert (=> b!9775 m!14137))

(declare-fun m!14139 () Bool)

(assert (=> b!9775 m!14139))

(assert (=> b!9775 m!14131))

(declare-fun m!14141 () Bool)

(assert (=> b!9775 m!14141))

(declare-fun m!14143 () Bool)

(assert (=> b!9775 m!14143))

(declare-fun m!14145 () Bool)

(assert (=> b!9775 m!14145))

(declare-fun m!14147 () Bool)

(assert (=> b!9775 m!14147))

(declare-fun m!14149 () Bool)

(assert (=> b!9775 m!14149))

(declare-fun m!14151 () Bool)

(assert (=> b!9775 m!14151))

(declare-fun m!14153 () Bool)

(assert (=> b!9775 m!14153))

(declare-fun m!14155 () Bool)

(assert (=> b!9775 m!14155))

(assert (=> b!9775 m!13939))

(assert (=> b!9775 m!14129))

(declare-fun m!14157 () Bool)

(assert (=> b!9775 m!14157))

(assert (=> b!9775 m!14119))

(declare-fun m!14159 () Bool)

(assert (=> b!9775 m!14159))

(declare-fun m!14161 () Bool)

(assert (=> b!9775 m!14161))

(assert (=> b!9775 m!13939))

(declare-fun m!14163 () Bool)

(assert (=> b!9775 m!14163))

(declare-fun m!14165 () Bool)

(assert (=> b!9775 m!14165))

(declare-fun m!14167 () Bool)

(assert (=> b!9775 m!14167))

(declare-fun m!14169 () Bool)

(assert (=> b!9775 m!14169))

(assert (=> b!9563 d!3116))

(declare-fun d!3150 () Bool)

(assert (=> d!3150 (validate_offset_bits!1 ((_ sign_extend 32) (size!250 (buf!589 (_2!633 lt!14494)))) ((_ sign_extend 32) (currentByte!1634 thiss!1486)) ((_ sign_extend 32) (currentBit!1629 thiss!1486)) nBits!460)))

(declare-fun lt!14906 () Unit!817)

(declare-fun choose!9 (BitStream!472 array!579 (_ BitVec 64) BitStream!472) Unit!817)

(assert (=> d!3150 (= lt!14906 (choose!9 thiss!1486 (buf!589 (_2!633 lt!14494)) nBits!460 (BitStream!473 (buf!589 (_2!633 lt!14494)) (currentByte!1634 thiss!1486) (currentBit!1629 thiss!1486))))))

(assert (=> d!3150 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1486 (buf!589 (_2!633 lt!14494)) nBits!460) lt!14906)))

(declare-fun bs!941 () Bool)

(assert (= bs!941 d!3150))

(assert (=> bs!941 m!13841))

(declare-fun m!14171 () Bool)

(assert (=> bs!941 m!14171))

(assert (=> b!9568 d!3150))

(declare-fun b!9791 () Bool)

(declare-fun res!9943 () Bool)

(declare-fun e!6014 () Bool)

(assert (=> b!9791 (=> (not res!9943) (not e!6014))))

(declare-fun lt!14931 () tuple2!1194)

(declare-fun lt!14925 () (_ BitVec 64))

(assert (=> b!9791 (= res!9943 (= (size!250 (_1!634 lt!14931)) ((_ extract 31 0) lt!14925)))))

(assert (=> b!9791 (and (bvslt lt!14925 #b0000000000000000000000000000000010000000000000000000000000000000) (bvsge lt!14925 #b1111111111111111111111111111111110000000000000000000000000000000))))

(declare-fun lt!14928 () (_ BitVec 64))

(declare-fun lt!14933 () (_ BitVec 64))

(assert (=> b!9791 (= lt!14925 (bvsdiv lt!14928 lt!14933))))

(assert (=> b!9791 (and (not (= lt!14933 #b0000000000000000000000000000000000000000000000000000000000000000)) (or (not (= lt!14928 #b1000000000000000000000000000000000000000000000000000000000000000)) (not (= lt!14933 #b1111111111111111111111111111111111111111111111111111111111111111))))))

(assert (=> b!9791 (= lt!14933 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun lt!14926 () (_ BitVec 64))

(declare-fun lt!14930 () (_ BitVec 64))

(assert (=> b!9791 (= lt!14928 (bvsub lt!14926 lt!14930))))

(assert (=> b!9791 (or (= (bvand lt!14926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14930 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!14926 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!14926 lt!14930) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9791 (= lt!14930 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!14932 () (_ BitVec 64))

(assert (=> b!9791 (= lt!14926 (bvadd nBits!460 lt!14932))))

(assert (=> b!9791 (or (not (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!14932 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd nBits!460 lt!14932) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9791 (= lt!14932 #b0000000000000000000000000000000000000000000000000000000000001000)))

(declare-fun d!3152 () Bool)

(assert (=> d!3152 e!6014))

(declare-fun res!9944 () Bool)

(assert (=> d!3152 (=> (not res!9944) (not e!6014))))

(assert (=> d!3152 (= res!9944 (= (buf!589 (_2!634 lt!14931)) (buf!589 (_1!635 lt!14495))))))

(declare-datatypes ((tuple3!70 0))(
  ( (tuple3!71 (_1!647 Unit!817) (_2!647 BitStream!472) (_3!38 array!579)) )
))
(declare-fun lt!14929 () tuple3!70)

(assert (=> d!3152 (= lt!14931 (tuple2!1195 (_3!38 lt!14929) (_2!647 lt!14929)))))

(declare-fun readBitsLoop!0 (BitStream!472 (_ BitVec 64) array!579 (_ BitVec 64) (_ BitVec 64)) tuple3!70)

(assert (=> d!3152 (= lt!14929 (readBitsLoop!0 (_1!635 lt!14495) nBits!460 (array!580 ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) ((_ extract 31 0) (bvsdiv (bvsub (bvadd nBits!460 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000000000000000000000000000000000001) #b0000000000000000000000000000000000000000000000000000000000001000))) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460))))

(assert (=> d!3152 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bvsle nBits!460 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!3152 (= (readBits!0 (_1!635 lt!14495) nBits!460) lt!14931)))

(declare-fun b!9792 () Bool)

(declare-fun res!9946 () Bool)

(assert (=> b!9792 (=> (not res!9946) (not e!6014))))

(assert (=> b!9792 (= res!9946 (invariant!0 (currentBit!1629 (_2!634 lt!14931)) (currentByte!1634 (_2!634 lt!14931)) (size!250 (buf!589 (_2!634 lt!14931)))))))

(declare-fun b!9793 () Bool)

(assert (=> b!9793 (= e!6014 (= (byteArrayBitContentToList!0 (_2!634 lt!14931) (_1!634 lt!14931) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) (bitStreamReadBitsIntoList!0 (_2!634 lt!14931) (_1!635 lt!14495) nBits!460)))))

(declare-fun b!9794 () Bool)

(declare-fun res!9947 () Bool)

(assert (=> b!9794 (=> (not res!9947) (not e!6014))))

(declare-fun lt!14927 () (_ BitVec 64))

(assert (=> b!9794 (= res!9947 (= (bvadd lt!14927 nBits!460) (bitIndex!0 (size!250 (buf!589 (_2!634 lt!14931))) (currentByte!1634 (_2!634 lt!14931)) (currentBit!1629 (_2!634 lt!14931)))))))

(assert (=> b!9794 (or (not (= (bvand lt!14927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand nBits!460 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!14927 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!14927 nBits!460) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9794 (= lt!14927 (bitIndex!0 (size!250 (buf!589 (_1!635 lt!14495))) (currentByte!1634 (_1!635 lt!14495)) (currentBit!1629 (_1!635 lt!14495))))))

(declare-fun b!9795 () Bool)

(declare-fun res!9945 () Bool)

(assert (=> b!9795 (=> (not res!9945) (not e!6014))))

(assert (=> b!9795 (= res!9945 (bvsle (currentByte!1634 (_1!635 lt!14495)) (currentByte!1634 (_2!634 lt!14931))))))

(assert (= (and d!3152 res!9944) b!9794))

(assert (= (and b!9794 res!9947) b!9792))

(assert (= (and b!9792 res!9946) b!9791))

(assert (= (and b!9791 res!9943) b!9795))

(assert (= (and b!9795 res!9945) b!9793))

(declare-fun m!14173 () Bool)

(assert (=> d!3152 m!14173))

(declare-fun m!14175 () Bool)

(assert (=> b!9792 m!14175))

(declare-fun m!14177 () Bool)

(assert (=> b!9793 m!14177))

(declare-fun m!14179 () Bool)

(assert (=> b!9793 m!14179))

(declare-fun m!14181 () Bool)

(assert (=> b!9794 m!14181))

(declare-fun m!14183 () Bool)

(assert (=> b!9794 m!14183))

(assert (=> b!9568 d!3152))

(declare-fun d!3154 () Bool)

(assert (=> d!3154 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!250 (buf!589 (_2!633 lt!14494)))) ((_ sign_extend 32) (currentByte!1634 thiss!1486)) ((_ sign_extend 32) (currentBit!1629 thiss!1486)) nBits!460) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!250 (buf!589 (_2!633 lt!14494)))) ((_ sign_extend 32) (currentByte!1634 thiss!1486)) ((_ sign_extend 32) (currentBit!1629 thiss!1486))) nBits!460))))

(declare-fun bs!942 () Bool)

(assert (= bs!942 d!3154))

(declare-fun m!14185 () Bool)

(assert (=> bs!942 m!14185))

(assert (=> b!9568 d!3154))

(declare-fun b!9814 () Bool)

(declare-fun e!6023 () Unit!817)

(declare-fun Unit!834 () Unit!817)

(assert (=> b!9814 (= e!6023 Unit!834)))

(declare-fun b!9815 () Bool)

(declare-fun res!9956 () Bool)

(declare-fun e!6024 () Bool)

(assert (=> b!9815 (=> (not res!9956) (not e!6024))))

(declare-fun lt!15045 () tuple2!1196)

(assert (=> b!9815 (= res!9956 (isPrefixOf!0 (_1!635 lt!15045) thiss!1486))))

(declare-fun b!9817 () Bool)

(declare-fun lt!15055 () Unit!817)

(assert (=> b!9817 (= e!6023 lt!15055)))

(declare-fun lt!15050 () (_ BitVec 64))

(assert (=> b!9817 (= lt!15050 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!15046 () (_ BitVec 64))

(assert (=> b!9817 (= lt!15046 (bitIndex!0 (size!250 (buf!589 thiss!1486)) (currentByte!1634 thiss!1486) (currentBit!1629 thiss!1486)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!579 array!579 (_ BitVec 64) (_ BitVec 64)) Unit!817)

(assert (=> b!9817 (= lt!15055 (arrayBitRangesEqSymmetric!0 (buf!589 thiss!1486) (buf!589 (_2!633 lt!14494)) lt!15050 lt!15046))))

(declare-fun arrayBitRangesEq!0 (array!579 array!579 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!9817 (arrayBitRangesEq!0 (buf!589 (_2!633 lt!14494)) (buf!589 thiss!1486) lt!15050 lt!15046)))

(declare-fun b!9818 () Bool)

(declare-fun res!9955 () Bool)

(assert (=> b!9818 (=> (not res!9955) (not e!6024))))

(assert (=> b!9818 (= res!9955 (isPrefixOf!0 (_2!635 lt!15045) (_2!633 lt!14494)))))

(declare-fun d!3156 () Bool)

(assert (=> d!3156 e!6024))

(declare-fun res!9954 () Bool)

(assert (=> d!3156 (=> (not res!9954) (not e!6024))))

(assert (=> d!3156 (= res!9954 (isPrefixOf!0 (_1!635 lt!15045) (_2!635 lt!15045)))))

(declare-fun lt!15044 () BitStream!472)

(assert (=> d!3156 (= lt!15045 (tuple2!1197 lt!15044 (_2!633 lt!14494)))))

(declare-fun lt!15043 () Unit!817)

(declare-fun lt!15039 () Unit!817)

(assert (=> d!3156 (= lt!15043 lt!15039)))

(assert (=> d!3156 (isPrefixOf!0 lt!15044 (_2!633 lt!14494))))

(assert (=> d!3156 (= lt!15039 (lemmaIsPrefixTransitive!0 lt!15044 (_2!633 lt!14494) (_2!633 lt!14494)))))

(declare-fun lt!15052 () Unit!817)

(declare-fun lt!15047 () Unit!817)

(assert (=> d!3156 (= lt!15052 lt!15047)))

(assert (=> d!3156 (isPrefixOf!0 lt!15044 (_2!633 lt!14494))))

(assert (=> d!3156 (= lt!15047 (lemmaIsPrefixTransitive!0 lt!15044 thiss!1486 (_2!633 lt!14494)))))

(declare-fun lt!15057 () Unit!817)

(assert (=> d!3156 (= lt!15057 e!6023)))

(declare-fun c!652 () Bool)

(assert (=> d!3156 (= c!652 (not (= (size!250 (buf!589 thiss!1486)) #b00000000000000000000000000000000)))))

(declare-fun lt!15053 () Unit!817)

(declare-fun lt!15048 () Unit!817)

(assert (=> d!3156 (= lt!15053 lt!15048)))

(assert (=> d!3156 (isPrefixOf!0 (_2!633 lt!14494) (_2!633 lt!14494))))

(assert (=> d!3156 (= lt!15048 (lemmaIsPrefixRefl!0 (_2!633 lt!14494)))))

(declare-fun lt!15041 () Unit!817)

(declare-fun lt!15054 () Unit!817)

(assert (=> d!3156 (= lt!15041 lt!15054)))

(assert (=> d!3156 (= lt!15054 (lemmaIsPrefixRefl!0 (_2!633 lt!14494)))))

(declare-fun lt!15059 () Unit!817)

(declare-fun lt!15049 () Unit!817)

(assert (=> d!3156 (= lt!15059 lt!15049)))

(assert (=> d!3156 (isPrefixOf!0 lt!15044 lt!15044)))

(assert (=> d!3156 (= lt!15049 (lemmaIsPrefixRefl!0 lt!15044))))

(declare-fun lt!15042 () Unit!817)

(declare-fun lt!15058 () Unit!817)

(assert (=> d!3156 (= lt!15042 lt!15058)))

(assert (=> d!3156 (isPrefixOf!0 thiss!1486 thiss!1486)))

(assert (=> d!3156 (= lt!15058 (lemmaIsPrefixRefl!0 thiss!1486))))

(assert (=> d!3156 (= lt!15044 (BitStream!473 (buf!589 (_2!633 lt!14494)) (currentByte!1634 thiss!1486) (currentBit!1629 thiss!1486)))))

(assert (=> d!3156 (isPrefixOf!0 thiss!1486 (_2!633 lt!14494))))

(assert (=> d!3156 (= (reader!0 thiss!1486 (_2!633 lt!14494)) lt!15045)))

(declare-fun b!9816 () Bool)

(declare-fun lt!15056 () (_ BitVec 64))

(declare-fun lt!15051 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!472 (_ BitVec 64)) BitStream!472)

(assert (=> b!9816 (= e!6024 (= (_1!635 lt!15045) (withMovedBitIndex!0 (_2!635 lt!15045) (bvsub lt!15051 lt!15056))))))

(assert (=> b!9816 (or (= (bvand lt!15051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!15056 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!15051 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!15051 lt!15056) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!9816 (= lt!15056 (bitIndex!0 (size!250 (buf!589 (_2!633 lt!14494))) (currentByte!1634 (_2!633 lt!14494)) (currentBit!1629 (_2!633 lt!14494))))))

(assert (=> b!9816 (= lt!15051 (bitIndex!0 (size!250 (buf!589 thiss!1486)) (currentByte!1634 thiss!1486) (currentBit!1629 thiss!1486)))))

(assert (= (and d!3156 c!652) b!9817))

(assert (= (and d!3156 (not c!652)) b!9814))

(assert (= (and d!3156 res!9954) b!9815))

(assert (= (and b!9815 res!9956) b!9818))

(assert (= (and b!9818 res!9955) b!9816))

(declare-fun m!14187 () Bool)

(assert (=> d!3156 m!14187))

(declare-fun m!14189 () Bool)

(assert (=> d!3156 m!14189))

(assert (=> d!3156 m!13865))

(assert (=> d!3156 m!14101))

(assert (=> d!3156 m!14099))

(declare-fun m!14191 () Bool)

(assert (=> d!3156 m!14191))

(declare-fun m!14193 () Bool)

(assert (=> d!3156 m!14193))

(declare-fun m!14195 () Bool)

(assert (=> d!3156 m!14195))

(declare-fun m!14197 () Bool)

(assert (=> d!3156 m!14197))

(declare-fun m!14199 () Bool)

(assert (=> d!3156 m!14199))

(declare-fun m!14201 () Bool)

(assert (=> d!3156 m!14201))

(declare-fun m!14203 () Bool)

(assert (=> b!9818 m!14203))

(assert (=> b!9817 m!13855))

(declare-fun m!14205 () Bool)

(assert (=> b!9817 m!14205))

(declare-fun m!14207 () Bool)

(assert (=> b!9817 m!14207))

(declare-fun m!14209 () Bool)

(assert (=> b!9816 m!14209))

(assert (=> b!9816 m!13853))

(assert (=> b!9816 m!13855))

(declare-fun m!14211 () Bool)

(assert (=> b!9815 m!14211))

(assert (=> b!9568 d!3156))

(declare-fun d!3158 () Bool)

(declare-fun c!653 () Bool)

(assert (=> d!3158 (= c!653 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!6025 () List!144)

(assert (=> d!3158 (= (byteArrayBitContentToList!0 (_2!633 lt!14494) (_1!634 lt!14493) #b0000000000000000000000000000000000000000000000000000000000000000 nBits!460) e!6025)))

(declare-fun b!9819 () Bool)

(assert (=> b!9819 (= e!6025 Nil!141)))

(declare-fun b!9820 () Bool)

(assert (=> b!9820 (= e!6025 (Cons!140 (not (= (bvand ((_ sign_extend 24) (select (arr!661 (_1!634 lt!14493)) ((_ extract 31 0) (bvsdiv #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!633 lt!14494) (_1!634 lt!14493) (bvadd #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub nBits!460 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!3158 c!653) b!9819))

(assert (= (and d!3158 (not c!653)) b!9820))

(declare-fun m!14213 () Bool)

(assert (=> b!9820 m!14213))

(declare-fun m!14215 () Bool)

(assert (=> b!9820 m!14215))

(declare-fun m!14217 () Bool)

(assert (=> b!9820 m!14217))

(assert (=> b!9568 d!3158))

(declare-fun b!9853 () Bool)

(declare-datatypes ((tuple2!1218 0))(
  ( (tuple2!1219 (_1!649 List!144) (_2!649 BitStream!472)) )
))
(declare-fun e!6038 () tuple2!1218)

(assert (=> b!9853 (= e!6038 (tuple2!1219 Nil!141 (_1!635 lt!14495)))))

(declare-fun b!9855 () Bool)

(declare-fun e!6039 () Bool)

(declare-fun lt!15176 () List!144)

(declare-fun isEmpty!30 (List!144) Bool)

(assert (=> b!9855 (= e!6039 (isEmpty!30 lt!15176))))

(declare-datatypes ((tuple2!1220 0))(
  ( (tuple2!1221 (_1!650 Bool) (_2!650 BitStream!472)) )
))
(declare-fun lt!15178 () tuple2!1220)

(declare-fun lt!15177 () (_ BitVec 64))

(declare-fun b!9854 () Bool)

(assert (=> b!9854 (= e!6038 (tuple2!1219 (Cons!140 (_1!650 lt!15178) (bitStreamReadBitsIntoList!0 (_2!633 lt!14494) (_2!650 lt!15178) (bvsub nBits!460 lt!15177))) (_2!650 lt!15178)))))

(declare-fun readBit!0 (BitStream!472) tuple2!1220)

(assert (=> b!9854 (= lt!15178 (readBit!0 (_1!635 lt!14495)))))

(assert (=> b!9854 (= lt!15177 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun d!3160 () Bool)

(assert (=> d!3160 e!6039))

(declare-fun c!659 () Bool)

(assert (=> d!3160 (= c!659 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3160 (= lt!15176 (_1!649 e!6038))))

(declare-fun c!658 () Bool)

(assert (=> d!3160 (= c!658 (= nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!3160 (bvsge nBits!460 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!3160 (= (bitStreamReadBitsIntoList!0 (_2!633 lt!14494) (_1!635 lt!14495) nBits!460) lt!15176)))

(declare-fun b!9856 () Bool)

(declare-fun length!25 (List!144) Int)

(assert (=> b!9856 (= e!6039 (> (length!25 lt!15176) 0))))

(assert (= (and d!3160 c!658) b!9853))

(assert (= (and d!3160 (not c!658)) b!9854))

(assert (= (and d!3160 c!659) b!9855))

(assert (= (and d!3160 (not c!659)) b!9856))

(declare-fun m!14219 () Bool)

(assert (=> b!9855 m!14219))

(declare-fun m!14221 () Bool)

(assert (=> b!9854 m!14221))

(declare-fun m!14223 () Bool)

(assert (=> b!9854 m!14223))

(declare-fun m!14225 () Bool)

(assert (=> b!9856 m!14225))

(assert (=> b!9568 d!3160))

(declare-fun d!3162 () Bool)

(declare-fun res!9994 () Bool)

(declare-fun e!6048 () Bool)

(assert (=> d!3162 (=> (not res!9994) (not e!6048))))

(assert (=> d!3162 (= res!9994 (= (size!250 (buf!589 thiss!1486)) (size!250 (buf!589 (_2!633 lt!14494)))))))

(assert (=> d!3162 (= (isPrefixOf!0 thiss!1486 (_2!633 lt!14494)) e!6048)))

(declare-fun b!9870 () Bool)

(declare-fun res!9995 () Bool)

(assert (=> b!9870 (=> (not res!9995) (not e!6048))))

(assert (=> b!9870 (= res!9995 (bvsle (bitIndex!0 (size!250 (buf!589 thiss!1486)) (currentByte!1634 thiss!1486) (currentBit!1629 thiss!1486)) (bitIndex!0 (size!250 (buf!589 (_2!633 lt!14494))) (currentByte!1634 (_2!633 lt!14494)) (currentBit!1629 (_2!633 lt!14494)))))))

(declare-fun b!9872 () Bool)

(declare-fun e!6047 () Bool)

(assert (=> b!9872 (= e!6048 e!6047)))

(declare-fun res!9993 () Bool)

(assert (=> b!9872 (=> res!9993 e!6047)))

(assert (=> b!9872 (= res!9993 (= (size!250 (buf!589 thiss!1486)) #b00000000000000000000000000000000))))

(declare-fun b!9873 () Bool)

(assert (=> b!9873 (= e!6047 (arrayBitRangesEq!0 (buf!589 thiss!1486) (buf!589 (_2!633 lt!14494)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!250 (buf!589 thiss!1486)) (currentByte!1634 thiss!1486) (currentBit!1629 thiss!1486))))))

(assert (= (and d!3162 res!9994) b!9870))

(assert (= (and b!9870 res!9995) b!9872))

(assert (= (and b!9872 (not res!9993)) b!9873))

(assert (=> b!9870 m!13855))

(assert (=> b!9870 m!13853))

(assert (=> b!9873 m!13855))

(assert (=> b!9873 m!13855))

(declare-fun m!14227 () Bool)

(assert (=> b!9873 m!14227))

(assert (=> b!9567 d!3162))

(declare-fun d!3164 () Bool)

(assert (=> d!3164 (= (array_inv!242 srcBuffer!6) (bvsge (size!250 srcBuffer!6) #b00000000000000000000000000000000))))

(assert (=> start!2012 d!3164))

(declare-fun d!3166 () Bool)

(assert (=> d!3166 (= (inv!12 thiss!1486) (invariant!0 (currentBit!1629 thiss!1486) (currentByte!1634 thiss!1486) (size!250 (buf!589 thiss!1486))))))

(declare-fun bs!943 () Bool)

(assert (= bs!943 d!3166))

(assert (=> bs!943 m!13961))

(assert (=> start!2012 d!3166))

(push 1)

(assert (not d!3166))

(assert (not d!3116))

(assert (not b!9855))

(assert (not b!9856))

(assert (not d!3098))

(assert (not b!9873))

(assert (not d!3108))

(assert (not b!9816))

(assert (not d!3150))

(assert (not b!9780))

(assert (not b!9793))

(assert (not b!9870))

(assert (not b!9642))

(assert (not b!9815))

(assert (not d!3152))

(assert (not b!9817))

(assert (not b!9794))

(assert (not b!9779))

(assert (not d!3156))

(assert (not d!3154))

(assert (not d!3096))

(assert (not b!9775))

(assert (not b!9854))

(assert (not b!9792))

(assert (not b!9773))

(assert (not bm!170))

(assert (not b!9820))

(assert (not b!9776))

(assert (not b!9818))

(assert (not b!9774))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

