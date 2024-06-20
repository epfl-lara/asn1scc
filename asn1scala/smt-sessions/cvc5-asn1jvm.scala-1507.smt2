; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!41618 () Bool)

(assert start!41618)

(declare-fun b!195665 () Bool)

(declare-fun e!134531 () Bool)

(declare-datatypes ((array!10055 0))(
  ( (array!10056 (arr!5365 (Array (_ BitVec 32) (_ BitVec 8))) (size!4435 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!7978 0))(
  ( (BitStream!7979 (buf!4921 array!10055) (currentByte!9223 (_ BitVec 32)) (currentBit!9218 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!16928 0))(
  ( (tuple2!16929 (_1!9109 BitStream!7978) (_2!9109 Bool)) )
))
(declare-fun lt!304011 () tuple2!16928)

(declare-fun lt!304007 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195665 (= e!134531 (= (bitIndex!0 (size!4435 (buf!4921 (_1!9109 lt!304011))) (currentByte!9223 (_1!9109 lt!304011)) (currentBit!9218 (_1!9109 lt!304011))) lt!304007))))

(declare-fun b!195666 () Bool)

(declare-fun res!163685 () Bool)

(declare-fun e!134534 () Bool)

(assert (=> b!195666 (=> (not res!163685) (not e!134534))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun thiss!1204 () BitStream!7978)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195666 (= res!163685 (validate_offset_bits!1 ((_ sign_extend 32) (size!4435 (buf!4921 thiss!1204))) ((_ sign_extend 32) (currentByte!9223 thiss!1204)) ((_ sign_extend 32) (currentBit!9218 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!195667 () Bool)

(declare-fun res!163682 () Bool)

(assert (=> b!195667 (=> (not res!163682) (not e!134534))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!195667 (= res!163682 (invariant!0 (currentBit!9218 thiss!1204) (currentByte!9223 thiss!1204) (size!4435 (buf!4921 thiss!1204))))))

(declare-fun b!195668 () Bool)

(declare-fun e!134532 () Bool)

(declare-fun array_inv!4176 (array!10055) Bool)

(assert (=> b!195668 (= e!134532 (array_inv!4176 (buf!4921 thiss!1204)))))

(declare-fun b!195669 () Bool)

(declare-fun e!134533 () Bool)

(assert (=> b!195669 (= e!134533 e!134531)))

(declare-fun res!163686 () Bool)

(assert (=> b!195669 (=> (not res!163686) (not e!134531))))

(declare-datatypes ((Unit!13813 0))(
  ( (Unit!13814) )
))
(declare-datatypes ((tuple2!16930 0))(
  ( (tuple2!16931 (_1!9110 Unit!13813) (_2!9110 BitStream!7978)) )
))
(declare-fun lt!304015 () tuple2!16930)

(declare-fun lt!304013 () Bool)

(assert (=> b!195669 (= res!163686 (and (= (_2!9109 lt!304011) lt!304013) (= (_1!9109 lt!304011) (_2!9110 lt!304015))))))

(declare-fun readBitPure!0 (BitStream!7978) tuple2!16928)

(declare-fun readerFrom!0 (BitStream!7978 (_ BitVec 32) (_ BitVec 32)) BitStream!7978)

(assert (=> b!195669 (= lt!304011 (readBitPure!0 (readerFrom!0 (_2!9110 lt!304015) (currentBit!9218 thiss!1204) (currentByte!9223 thiss!1204))))))

(declare-fun lt!304010 () tuple2!16930)

(declare-fun e!134529 () Bool)

(declare-fun b!195670 () Bool)

(declare-fun lt!304014 () (_ BitVec 64))

(assert (=> b!195670 (= e!134529 (= (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304010))) (currentByte!9223 (_2!9110 lt!304010)) (currentBit!9218 (_2!9110 lt!304010))) (bvsub (bvsub (bvadd lt!304014 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun isPrefixOf!0 (BitStream!7978 BitStream!7978) Bool)

(assert (=> b!195670 (isPrefixOf!0 thiss!1204 (_2!9110 lt!304010))))

(declare-fun lt!304009 () Unit!13813)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!7978 BitStream!7978 BitStream!7978) Unit!13813)

(assert (=> b!195670 (= lt!304009 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9110 lt!304015) (_2!9110 lt!304010)))))

(declare-fun v!189 () (_ BitVec 64))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!7978 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!16930)

(assert (=> b!195670 (= lt!304010 (appendBitsLSBFirstLoopTR!0 (_2!9110 lt!304015) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!163684 () Bool)

(assert (=> start!41618 (=> (not res!163684) (not e!134534))))

(assert (=> start!41618 (= res!163684 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!41618 e!134534))

(assert (=> start!41618 true))

(declare-fun inv!12 (BitStream!7978) Bool)

(assert (=> start!41618 (and (inv!12 thiss!1204) e!134532)))

(declare-fun b!195671 () Bool)

(declare-fun e!134528 () Bool)

(assert (=> b!195671 (= e!134528 e!134533)))

(declare-fun res!163681 () Bool)

(assert (=> b!195671 (=> (not res!163681) (not e!134533))))

(declare-fun lt!304008 () (_ BitVec 64))

(assert (=> b!195671 (= res!163681 (= lt!304007 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!304008)))))

(assert (=> b!195671 (= lt!304007 (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304015))) (currentByte!9223 (_2!9110 lt!304015)) (currentBit!9218 (_2!9110 lt!304015))))))

(assert (=> b!195671 (= lt!304008 (bitIndex!0 (size!4435 (buf!4921 thiss!1204)) (currentByte!9223 thiss!1204) (currentBit!9218 thiss!1204)))))

(declare-fun b!195672 () Bool)

(declare-fun res!163689 () Bool)

(assert (=> b!195672 (=> (not res!163689) (not e!134534))))

(assert (=> b!195672 (= res!163689 (not (= i!590 nBits!348)))))

(declare-fun b!195673 () Bool)

(assert (=> b!195673 (= e!134534 (not e!134529))))

(declare-fun res!163687 () Bool)

(assert (=> b!195673 (=> res!163687 e!134529)))

(declare-fun lt!304012 () (_ BitVec 64))

(assert (=> b!195673 (= res!163687 (not (= lt!304014 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!304012))))))

(assert (=> b!195673 (= lt!304014 (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304015))) (currentByte!9223 (_2!9110 lt!304015)) (currentBit!9218 (_2!9110 lt!304015))))))

(assert (=> b!195673 (= lt!304012 (bitIndex!0 (size!4435 (buf!4921 thiss!1204)) (currentByte!9223 thiss!1204) (currentBit!9218 thiss!1204)))))

(assert (=> b!195673 e!134528))

(declare-fun res!163683 () Bool)

(assert (=> b!195673 (=> (not res!163683) (not e!134528))))

(assert (=> b!195673 (= res!163683 (= (size!4435 (buf!4921 thiss!1204)) (size!4435 (buf!4921 (_2!9110 lt!304015)))))))

(declare-fun appendBit!0 (BitStream!7978 Bool) tuple2!16930)

(assert (=> b!195673 (= lt!304015 (appendBit!0 thiss!1204 lt!304013))))

(assert (=> b!195673 (= lt!304013 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!195674 () Bool)

(declare-fun res!163688 () Bool)

(assert (=> b!195674 (=> (not res!163688) (not e!134533))))

(assert (=> b!195674 (= res!163688 (isPrefixOf!0 thiss!1204 (_2!9110 lt!304015)))))

(assert (= (and start!41618 res!163684) b!195666))

(assert (= (and b!195666 res!163685) b!195667))

(assert (= (and b!195667 res!163682) b!195672))

(assert (= (and b!195672 res!163689) b!195673))

(assert (= (and b!195673 res!163683) b!195671))

(assert (= (and b!195671 res!163681) b!195674))

(assert (= (and b!195674 res!163688) b!195669))

(assert (= (and b!195669 res!163686) b!195665))

(assert (= (and b!195673 (not res!163687)) b!195670))

(assert (= start!41618 b!195668))

(declare-fun m!302825 () Bool)

(assert (=> b!195666 m!302825))

(declare-fun m!302827 () Bool)

(assert (=> b!195667 m!302827))

(declare-fun m!302829 () Bool)

(assert (=> b!195669 m!302829))

(assert (=> b!195669 m!302829))

(declare-fun m!302831 () Bool)

(assert (=> b!195669 m!302831))

(declare-fun m!302833 () Bool)

(assert (=> b!195665 m!302833))

(declare-fun m!302835 () Bool)

(assert (=> start!41618 m!302835))

(declare-fun m!302837 () Bool)

(assert (=> b!195668 m!302837))

(declare-fun m!302839 () Bool)

(assert (=> b!195673 m!302839))

(declare-fun m!302841 () Bool)

(assert (=> b!195673 m!302841))

(declare-fun m!302843 () Bool)

(assert (=> b!195673 m!302843))

(declare-fun m!302845 () Bool)

(assert (=> b!195674 m!302845))

(assert (=> b!195671 m!302839))

(assert (=> b!195671 m!302841))

(declare-fun m!302847 () Bool)

(assert (=> b!195670 m!302847))

(declare-fun m!302849 () Bool)

(assert (=> b!195670 m!302849))

(declare-fun m!302851 () Bool)

(assert (=> b!195670 m!302851))

(declare-fun m!302853 () Bool)

(assert (=> b!195670 m!302853))

(push 1)

(assert (not b!195674))

(assert (not b!195671))

(assert (not b!195673))

(assert (not b!195666))

(assert (not b!195670))

(assert (not b!195667))

(assert (not b!195668))

(assert (not b!195669))

(assert (not b!195665))

(assert (not start!41618))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!66275 () Bool)

(assert (=> d!66275 (= (invariant!0 (currentBit!9218 thiss!1204) (currentByte!9223 thiss!1204) (size!4435 (buf!4921 thiss!1204))) (and (bvsge (currentBit!9218 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9218 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9223 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9223 thiss!1204) (size!4435 (buf!4921 thiss!1204))) (and (= (currentBit!9218 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9223 thiss!1204) (size!4435 (buf!4921 thiss!1204)))))))))

(assert (=> b!195667 d!66275))

(declare-fun d!66277 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!66277 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4435 (buf!4921 thiss!1204))) ((_ sign_extend 32) (currentByte!9223 thiss!1204)) ((_ sign_extend 32) (currentBit!9218 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4435 (buf!4921 thiss!1204))) ((_ sign_extend 32) (currentByte!9223 thiss!1204)) ((_ sign_extend 32) (currentBit!9218 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!16486 () Bool)

(assert (= bs!16486 d!66277))

(declare-fun m!302933 () Bool)

(assert (=> bs!16486 m!302933))

(assert (=> b!195666 d!66277))

(declare-fun d!66279 () Bool)

(assert (=> d!66279 (= (array_inv!4176 (buf!4921 thiss!1204)) (bvsge (size!4435 (buf!4921 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!195668 d!66279))

(declare-fun d!66281 () Bool)

(declare-fun e!134596 () Bool)

(assert (=> d!66281 e!134596))

(declare-fun res!163777 () Bool)

(assert (=> d!66281 (=> (not res!163777) (not e!134596))))

(declare-fun lt!304124 () (_ BitVec 64))

(declare-fun lt!304126 () (_ BitVec 64))

(declare-fun lt!304127 () (_ BitVec 64))

(assert (=> d!66281 (= res!163777 (= lt!304124 (bvsub lt!304127 lt!304126)))))

(assert (=> d!66281 (or (= (bvand lt!304127 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304126 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304127 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304127 lt!304126) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66281 (= lt!304126 (remainingBits!0 ((_ sign_extend 32) (size!4435 (buf!4921 (_2!9110 lt!304015)))) ((_ sign_extend 32) (currentByte!9223 (_2!9110 lt!304015))) ((_ sign_extend 32) (currentBit!9218 (_2!9110 lt!304015)))))))

(declare-fun lt!304125 () (_ BitVec 64))

(declare-fun lt!304129 () (_ BitVec 64))

(assert (=> d!66281 (= lt!304127 (bvmul lt!304125 lt!304129))))

(assert (=> d!66281 (or (= lt!304125 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304129 (bvsdiv (bvmul lt!304125 lt!304129) lt!304125)))))

(assert (=> d!66281 (= lt!304129 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66281 (= lt!304125 ((_ sign_extend 32) (size!4435 (buf!4921 (_2!9110 lt!304015)))))))

(assert (=> d!66281 (= lt!304124 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9223 (_2!9110 lt!304015))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9218 (_2!9110 lt!304015)))))))

(assert (=> d!66281 (invariant!0 (currentBit!9218 (_2!9110 lt!304015)) (currentByte!9223 (_2!9110 lt!304015)) (size!4435 (buf!4921 (_2!9110 lt!304015))))))

(assert (=> d!66281 (= (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304015))) (currentByte!9223 (_2!9110 lt!304015)) (currentBit!9218 (_2!9110 lt!304015))) lt!304124)))

(declare-fun b!195766 () Bool)

(declare-fun res!163776 () Bool)

(assert (=> b!195766 (=> (not res!163776) (not e!134596))))

(assert (=> b!195766 (= res!163776 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304124))))

(declare-fun b!195767 () Bool)

(declare-fun lt!304128 () (_ BitVec 64))

(assert (=> b!195767 (= e!134596 (bvsle lt!304124 (bvmul lt!304128 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!195767 (or (= lt!304128 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304128 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304128)))))

(assert (=> b!195767 (= lt!304128 ((_ sign_extend 32) (size!4435 (buf!4921 (_2!9110 lt!304015)))))))

(assert (= (and d!66281 res!163777) b!195766))

(assert (= (and b!195766 res!163776) b!195767))

(declare-fun m!302941 () Bool)

(assert (=> d!66281 m!302941))

(declare-fun m!302943 () Bool)

(assert (=> d!66281 m!302943))

(assert (=> b!195673 d!66281))

(declare-fun d!66293 () Bool)

(declare-fun e!134597 () Bool)

(assert (=> d!66293 e!134597))

(declare-fun res!163779 () Bool)

(assert (=> d!66293 (=> (not res!163779) (not e!134597))))

(declare-fun lt!304130 () (_ BitVec 64))

(declare-fun lt!304133 () (_ BitVec 64))

(declare-fun lt!304132 () (_ BitVec 64))

(assert (=> d!66293 (= res!163779 (= lt!304130 (bvsub lt!304133 lt!304132)))))

(assert (=> d!66293 (or (= (bvand lt!304133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304132 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304133 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304133 lt!304132) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66293 (= lt!304132 (remainingBits!0 ((_ sign_extend 32) (size!4435 (buf!4921 thiss!1204))) ((_ sign_extend 32) (currentByte!9223 thiss!1204)) ((_ sign_extend 32) (currentBit!9218 thiss!1204))))))

(declare-fun lt!304131 () (_ BitVec 64))

(declare-fun lt!304135 () (_ BitVec 64))

(assert (=> d!66293 (= lt!304133 (bvmul lt!304131 lt!304135))))

(assert (=> d!66293 (or (= lt!304131 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304135 (bvsdiv (bvmul lt!304131 lt!304135) lt!304131)))))

(assert (=> d!66293 (= lt!304135 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66293 (= lt!304131 ((_ sign_extend 32) (size!4435 (buf!4921 thiss!1204))))))

(assert (=> d!66293 (= lt!304130 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9223 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9218 thiss!1204))))))

(assert (=> d!66293 (invariant!0 (currentBit!9218 thiss!1204) (currentByte!9223 thiss!1204) (size!4435 (buf!4921 thiss!1204)))))

(assert (=> d!66293 (= (bitIndex!0 (size!4435 (buf!4921 thiss!1204)) (currentByte!9223 thiss!1204) (currentBit!9218 thiss!1204)) lt!304130)))

(declare-fun b!195768 () Bool)

(declare-fun res!163778 () Bool)

(assert (=> b!195768 (=> (not res!163778) (not e!134597))))

(assert (=> b!195768 (= res!163778 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304130))))

(declare-fun b!195769 () Bool)

(declare-fun lt!304134 () (_ BitVec 64))

(assert (=> b!195769 (= e!134597 (bvsle lt!304130 (bvmul lt!304134 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!195769 (or (= lt!304134 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304134 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304134)))))

(assert (=> b!195769 (= lt!304134 ((_ sign_extend 32) (size!4435 (buf!4921 thiss!1204))))))

(assert (= (and d!66293 res!163779) b!195768))

(assert (= (and b!195768 res!163778) b!195769))

(assert (=> d!66293 m!302933))

(assert (=> d!66293 m!302827))

(assert (=> b!195673 d!66293))

(declare-fun d!66295 () Bool)

(declare-fun e!134615 () Bool)

(assert (=> d!66295 e!134615))

(declare-fun res!163809 () Bool)

(assert (=> d!66295 (=> (not res!163809) (not e!134615))))

(declare-fun lt!304157 () tuple2!16930)

(assert (=> d!66295 (= res!163809 (= (size!4435 (buf!4921 thiss!1204)) (size!4435 (buf!4921 (_2!9110 lt!304157)))))))

(declare-fun choose!16 (BitStream!7978 Bool) tuple2!16930)

(assert (=> d!66295 (= lt!304157 (choose!16 thiss!1204 lt!304013))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!66295 (validate_offset_bit!0 ((_ sign_extend 32) (size!4435 (buf!4921 thiss!1204))) ((_ sign_extend 32) (currentByte!9223 thiss!1204)) ((_ sign_extend 32) (currentBit!9218 thiss!1204)))))

(assert (=> d!66295 (= (appendBit!0 thiss!1204 lt!304013) lt!304157)))

(declare-fun b!195797 () Bool)

(declare-fun res!163807 () Bool)

(assert (=> b!195797 (=> (not res!163807) (not e!134615))))

(assert (=> b!195797 (= res!163807 (isPrefixOf!0 thiss!1204 (_2!9110 lt!304157)))))

(declare-fun b!195798 () Bool)

(declare-fun e!134614 () Bool)

(assert (=> b!195798 (= e!134615 e!134614)))

(declare-fun res!163808 () Bool)

(assert (=> b!195798 (=> (not res!163808) (not e!134614))))

(declare-fun lt!304158 () tuple2!16928)

(assert (=> b!195798 (= res!163808 (and (= (_2!9109 lt!304158) lt!304013) (= (_1!9109 lt!304158) (_2!9110 lt!304157))))))

(assert (=> b!195798 (= lt!304158 (readBitPure!0 (readerFrom!0 (_2!9110 lt!304157) (currentBit!9218 thiss!1204) (currentByte!9223 thiss!1204))))))

(declare-fun b!195796 () Bool)

(declare-fun res!163806 () Bool)

(assert (=> b!195796 (=> (not res!163806) (not e!134615))))

(declare-fun lt!304156 () (_ BitVec 64))

(declare-fun lt!304159 () (_ BitVec 64))

(assert (=> b!195796 (= res!163806 (= (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304157))) (currentByte!9223 (_2!9110 lt!304157)) (currentBit!9218 (_2!9110 lt!304157))) (bvadd lt!304159 lt!304156)))))

(assert (=> b!195796 (or (not (= (bvand lt!304159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304156 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!304159 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!304159 lt!304156) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195796 (= lt!304156 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!195796 (= lt!304159 (bitIndex!0 (size!4435 (buf!4921 thiss!1204)) (currentByte!9223 thiss!1204) (currentBit!9218 thiss!1204)))))

(declare-fun b!195799 () Bool)

(assert (=> b!195799 (= e!134614 (= (bitIndex!0 (size!4435 (buf!4921 (_1!9109 lt!304158))) (currentByte!9223 (_1!9109 lt!304158)) (currentBit!9218 (_1!9109 lt!304158))) (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304157))) (currentByte!9223 (_2!9110 lt!304157)) (currentBit!9218 (_2!9110 lt!304157)))))))

(assert (= (and d!66295 res!163809) b!195796))

(assert (= (and b!195796 res!163806) b!195797))

(assert (= (and b!195797 res!163807) b!195798))

(assert (= (and b!195798 res!163808) b!195799))

(declare-fun m!302961 () Bool)

(assert (=> b!195796 m!302961))

(assert (=> b!195796 m!302841))

(declare-fun m!302963 () Bool)

(assert (=> b!195798 m!302963))

(assert (=> b!195798 m!302963))

(declare-fun m!302965 () Bool)

(assert (=> b!195798 m!302965))

(declare-fun m!302967 () Bool)

(assert (=> b!195799 m!302967))

(assert (=> b!195799 m!302961))

(declare-fun m!302969 () Bool)

(assert (=> d!66295 m!302969))

(declare-fun m!302971 () Bool)

(assert (=> d!66295 m!302971))

(declare-fun m!302973 () Bool)

(assert (=> b!195797 m!302973))

(assert (=> b!195673 d!66295))

(declare-fun d!66311 () Bool)

(declare-fun res!163818 () Bool)

(declare-fun e!134621 () Bool)

(assert (=> d!66311 (=> (not res!163818) (not e!134621))))

(assert (=> d!66311 (= res!163818 (= (size!4435 (buf!4921 thiss!1204)) (size!4435 (buf!4921 (_2!9110 lt!304015)))))))

(assert (=> d!66311 (= (isPrefixOf!0 thiss!1204 (_2!9110 lt!304015)) e!134621)))

(declare-fun b!195806 () Bool)

(declare-fun res!163816 () Bool)

(assert (=> b!195806 (=> (not res!163816) (not e!134621))))

(assert (=> b!195806 (= res!163816 (bvsle (bitIndex!0 (size!4435 (buf!4921 thiss!1204)) (currentByte!9223 thiss!1204) (currentBit!9218 thiss!1204)) (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304015))) (currentByte!9223 (_2!9110 lt!304015)) (currentBit!9218 (_2!9110 lt!304015)))))))

(declare-fun b!195807 () Bool)

(declare-fun e!134620 () Bool)

(assert (=> b!195807 (= e!134621 e!134620)))

(declare-fun res!163817 () Bool)

(assert (=> b!195807 (=> res!163817 e!134620)))

(assert (=> b!195807 (= res!163817 (= (size!4435 (buf!4921 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!195808 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10055 array!10055 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!195808 (= e!134620 (arrayBitRangesEq!0 (buf!4921 thiss!1204) (buf!4921 (_2!9110 lt!304015)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4435 (buf!4921 thiss!1204)) (currentByte!9223 thiss!1204) (currentBit!9218 thiss!1204))))))

(assert (= (and d!66311 res!163818) b!195806))

(assert (= (and b!195806 res!163816) b!195807))

(assert (= (and b!195807 (not res!163817)) b!195808))

(assert (=> b!195806 m!302841))

(assert (=> b!195806 m!302839))

(assert (=> b!195808 m!302841))

(assert (=> b!195808 m!302841))

(declare-fun m!302975 () Bool)

(assert (=> b!195808 m!302975))

(assert (=> b!195674 d!66311))

(declare-fun d!66313 () Bool)

(declare-datatypes ((tuple2!16952 0))(
  ( (tuple2!16953 (_1!9121 Bool) (_2!9121 BitStream!7978)) )
))
(declare-fun lt!304162 () tuple2!16952)

(declare-fun readBit!0 (BitStream!7978) tuple2!16952)

(assert (=> d!66313 (= lt!304162 (readBit!0 (readerFrom!0 (_2!9110 lt!304015) (currentBit!9218 thiss!1204) (currentByte!9223 thiss!1204))))))

(assert (=> d!66313 (= (readBitPure!0 (readerFrom!0 (_2!9110 lt!304015) (currentBit!9218 thiss!1204) (currentByte!9223 thiss!1204))) (tuple2!16929 (_2!9121 lt!304162) (_1!9121 lt!304162)))))

(declare-fun bs!16491 () Bool)

(assert (= bs!16491 d!66313))

(assert (=> bs!16491 m!302829))

(declare-fun m!302977 () Bool)

(assert (=> bs!16491 m!302977))

(assert (=> b!195669 d!66313))

(declare-fun d!66315 () Bool)

(declare-fun e!134624 () Bool)

(assert (=> d!66315 e!134624))

(declare-fun res!163822 () Bool)

(assert (=> d!66315 (=> (not res!163822) (not e!134624))))

(assert (=> d!66315 (= res!163822 (invariant!0 (currentBit!9218 (_2!9110 lt!304015)) (currentByte!9223 (_2!9110 lt!304015)) (size!4435 (buf!4921 (_2!9110 lt!304015)))))))

(assert (=> d!66315 (= (readerFrom!0 (_2!9110 lt!304015) (currentBit!9218 thiss!1204) (currentByte!9223 thiss!1204)) (BitStream!7979 (buf!4921 (_2!9110 lt!304015)) (currentByte!9223 thiss!1204) (currentBit!9218 thiss!1204)))))

(declare-fun b!195811 () Bool)

(assert (=> b!195811 (= e!134624 (invariant!0 (currentBit!9218 thiss!1204) (currentByte!9223 thiss!1204) (size!4435 (buf!4921 (_2!9110 lt!304015)))))))

(assert (= (and d!66315 res!163822) b!195811))

(assert (=> d!66315 m!302943))

(declare-fun m!302979 () Bool)

(assert (=> b!195811 m!302979))

(assert (=> b!195669 d!66315))

(assert (=> b!195671 d!66281))

(assert (=> b!195671 d!66293))

(declare-fun d!66317 () Bool)

(declare-fun e!134625 () Bool)

(assert (=> d!66317 e!134625))

(declare-fun res!163824 () Bool)

(assert (=> d!66317 (=> (not res!163824) (not e!134625))))

(declare-fun lt!304166 () (_ BitVec 64))

(declare-fun lt!304165 () (_ BitVec 64))

(declare-fun lt!304163 () (_ BitVec 64))

(assert (=> d!66317 (= res!163824 (= lt!304163 (bvsub lt!304166 lt!304165)))))

(assert (=> d!66317 (or (= (bvand lt!304166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304165 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304166 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304166 lt!304165) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66317 (= lt!304165 (remainingBits!0 ((_ sign_extend 32) (size!4435 (buf!4921 (_2!9110 lt!304010)))) ((_ sign_extend 32) (currentByte!9223 (_2!9110 lt!304010))) ((_ sign_extend 32) (currentBit!9218 (_2!9110 lt!304010)))))))

(declare-fun lt!304164 () (_ BitVec 64))

(declare-fun lt!304168 () (_ BitVec 64))

(assert (=> d!66317 (= lt!304166 (bvmul lt!304164 lt!304168))))

(assert (=> d!66317 (or (= lt!304164 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304168 (bvsdiv (bvmul lt!304164 lt!304168) lt!304164)))))

(assert (=> d!66317 (= lt!304168 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66317 (= lt!304164 ((_ sign_extend 32) (size!4435 (buf!4921 (_2!9110 lt!304010)))))))

(assert (=> d!66317 (= lt!304163 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9223 (_2!9110 lt!304010))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9218 (_2!9110 lt!304010)))))))

(assert (=> d!66317 (invariant!0 (currentBit!9218 (_2!9110 lt!304010)) (currentByte!9223 (_2!9110 lt!304010)) (size!4435 (buf!4921 (_2!9110 lt!304010))))))

(assert (=> d!66317 (= (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304010))) (currentByte!9223 (_2!9110 lt!304010)) (currentBit!9218 (_2!9110 lt!304010))) lt!304163)))

(declare-fun b!195812 () Bool)

(declare-fun res!163823 () Bool)

(assert (=> b!195812 (=> (not res!163823) (not e!134625))))

(assert (=> b!195812 (= res!163823 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304163))))

(declare-fun b!195813 () Bool)

(declare-fun lt!304167 () (_ BitVec 64))

(assert (=> b!195813 (= e!134625 (bvsle lt!304163 (bvmul lt!304167 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!195813 (or (= lt!304167 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304167 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304167)))))

(assert (=> b!195813 (= lt!304167 ((_ sign_extend 32) (size!4435 (buf!4921 (_2!9110 lt!304010)))))))

(assert (= (and d!66317 res!163824) b!195812))

(assert (= (and b!195812 res!163823) b!195813))

(declare-fun m!302981 () Bool)

(assert (=> d!66317 m!302981))

(declare-fun m!302983 () Bool)

(assert (=> d!66317 m!302983))

(assert (=> b!195670 d!66317))

(declare-fun d!66319 () Bool)

(declare-fun res!163827 () Bool)

(declare-fun e!134627 () Bool)

(assert (=> d!66319 (=> (not res!163827) (not e!134627))))

(assert (=> d!66319 (= res!163827 (= (size!4435 (buf!4921 thiss!1204)) (size!4435 (buf!4921 (_2!9110 lt!304010)))))))

(assert (=> d!66319 (= (isPrefixOf!0 thiss!1204 (_2!9110 lt!304010)) e!134627)))

(declare-fun b!195814 () Bool)

(declare-fun res!163825 () Bool)

(assert (=> b!195814 (=> (not res!163825) (not e!134627))))

(assert (=> b!195814 (= res!163825 (bvsle (bitIndex!0 (size!4435 (buf!4921 thiss!1204)) (currentByte!9223 thiss!1204) (currentBit!9218 thiss!1204)) (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304010))) (currentByte!9223 (_2!9110 lt!304010)) (currentBit!9218 (_2!9110 lt!304010)))))))

(declare-fun b!195815 () Bool)

(declare-fun e!134626 () Bool)

(assert (=> b!195815 (= e!134627 e!134626)))

(declare-fun res!163826 () Bool)

(assert (=> b!195815 (=> res!163826 e!134626)))

(assert (=> b!195815 (= res!163826 (= (size!4435 (buf!4921 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!195816 () Bool)

(assert (=> b!195816 (= e!134626 (arrayBitRangesEq!0 (buf!4921 thiss!1204) (buf!4921 (_2!9110 lt!304010)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4435 (buf!4921 thiss!1204)) (currentByte!9223 thiss!1204) (currentBit!9218 thiss!1204))))))

(assert (= (and d!66319 res!163827) b!195814))

(assert (= (and b!195814 res!163825) b!195815))

(assert (= (and b!195815 (not res!163826)) b!195816))

(assert (=> b!195814 m!302841))

(assert (=> b!195814 m!302847))

(assert (=> b!195816 m!302841))

(assert (=> b!195816 m!302841))

(declare-fun m!302985 () Bool)

(assert (=> b!195816 m!302985))

(assert (=> b!195670 d!66319))

(declare-fun d!66321 () Bool)

(assert (=> d!66321 (isPrefixOf!0 thiss!1204 (_2!9110 lt!304010))))

(declare-fun lt!304171 () Unit!13813)

(declare-fun choose!30 (BitStream!7978 BitStream!7978 BitStream!7978) Unit!13813)

(assert (=> d!66321 (= lt!304171 (choose!30 thiss!1204 (_2!9110 lt!304015) (_2!9110 lt!304010)))))

(assert (=> d!66321 (isPrefixOf!0 thiss!1204 (_2!9110 lt!304015))))

(assert (=> d!66321 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9110 lt!304015) (_2!9110 lt!304010)) lt!304171)))

(declare-fun bs!16492 () Bool)

(assert (= bs!16492 d!66321))

(assert (=> bs!16492 m!302849))

(declare-fun m!302987 () Bool)

(assert (=> bs!16492 m!302987))

(assert (=> bs!16492 m!302845))

(assert (=> b!195670 d!66321))

(declare-fun b!195981 () Bool)

(declare-fun e!134718 () Bool)

(declare-datatypes ((tuple2!16954 0))(
  ( (tuple2!16955 (_1!9122 BitStream!7978) (_2!9122 (_ BitVec 64))) )
))
(declare-fun lt!304726 () tuple2!16954)

(declare-datatypes ((tuple2!16956 0))(
  ( (tuple2!16957 (_1!9123 BitStream!7978) (_2!9123 BitStream!7978)) )
))
(declare-fun lt!304686 () tuple2!16956)

(assert (=> b!195981 (= e!134718 (= (_1!9122 lt!304726) (_2!9123 lt!304686)))))

(declare-fun lt!304699 () tuple2!16930)

(declare-fun c!9756 () Bool)

(declare-fun call!3074 () Bool)

(declare-fun bm!3071 () Bool)

(assert (=> bm!3071 (= call!3074 (isPrefixOf!0 (_2!9110 lt!304015) (ite c!9756 (_2!9110 lt!304015) (_2!9110 lt!304699))))))

(declare-fun d!66323 () Bool)

(declare-fun e!134721 () Bool)

(assert (=> d!66323 e!134721))

(declare-fun res!163958 () Bool)

(assert (=> d!66323 (=> (not res!163958) (not e!134721))))

(declare-fun lt!304719 () tuple2!16930)

(assert (=> d!66323 (= res!163958 (invariant!0 (currentBit!9218 (_2!9110 lt!304719)) (currentByte!9223 (_2!9110 lt!304719)) (size!4435 (buf!4921 (_2!9110 lt!304719)))))))

(declare-fun e!134719 () tuple2!16930)

(assert (=> d!66323 (= lt!304719 e!134719)))

(assert (=> d!66323 (= c!9756 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!66323 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!66323 (= (appendBitsLSBFirstLoopTR!0 (_2!9110 lt!304015) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!304719)))

(declare-fun b!195982 () Bool)

(declare-fun res!163969 () Bool)

(assert (=> b!195982 (=> (not res!163969) (not e!134721))))

(declare-fun lt!304698 () (_ BitVec 64))

(declare-fun lt!304684 () (_ BitVec 64))

(assert (=> b!195982 (= res!163969 (= (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304719))) (currentByte!9223 (_2!9110 lt!304719)) (currentBit!9218 (_2!9110 lt!304719))) (bvsub lt!304698 lt!304684)))))

(assert (=> b!195982 (or (= (bvand lt!304698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304684 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304698 lt!304684) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195982 (= lt!304684 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!304675 () (_ BitVec 64))

(declare-fun lt!304711 () (_ BitVec 64))

(assert (=> b!195982 (= lt!304698 (bvadd lt!304675 lt!304711))))

(assert (=> b!195982 (or (not (= (bvand lt!304675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304711 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!304675 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!304675 lt!304711) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195982 (= lt!304711 ((_ sign_extend 32) nBits!348))))

(assert (=> b!195982 (= lt!304675 (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304015))) (currentByte!9223 (_2!9110 lt!304015)) (currentBit!9218 (_2!9110 lt!304015))))))

(declare-fun b!195983 () Bool)

(declare-fun lt!304718 () tuple2!16928)

(assert (=> b!195983 (= lt!304718 (readBitPure!0 (readerFrom!0 (_2!9110 lt!304699) (currentBit!9218 (_2!9110 lt!304015)) (currentByte!9223 (_2!9110 lt!304015)))))))

(declare-fun res!163965 () Bool)

(declare-fun lt!304679 () Bool)

(assert (=> b!195983 (= res!163965 (and (= (_2!9109 lt!304718) lt!304679) (= (_1!9109 lt!304718) (_2!9110 lt!304699))))))

(declare-fun e!134720 () Bool)

(assert (=> b!195983 (=> (not res!163965) (not e!134720))))

(declare-fun e!134723 () Bool)

(assert (=> b!195983 (= e!134723 e!134720)))

(declare-fun b!195984 () Bool)

(declare-fun res!163961 () Bool)

(assert (=> b!195984 (=> (not res!163961) (not e!134721))))

(assert (=> b!195984 (= res!163961 (isPrefixOf!0 (_2!9110 lt!304015) (_2!9110 lt!304719)))))

(declare-fun b!195985 () Bool)

(declare-fun res!163962 () Bool)

(assert (=> b!195985 (= res!163962 (= (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304699))) (currentByte!9223 (_2!9110 lt!304699)) (currentBit!9218 (_2!9110 lt!304699))) (bvadd (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304015))) (currentByte!9223 (_2!9110 lt!304015)) (currentBit!9218 (_2!9110 lt!304015))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!195985 (=> (not res!163962) (not e!134723))))

(declare-fun b!195986 () Bool)

(declare-fun e!134717 () (_ BitVec 64))

(assert (=> b!195986 (= e!134717 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!195987 () Bool)

(assert (=> b!195987 (= e!134717 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!195988 () Bool)

(declare-fun lt!304693 () tuple2!16930)

(assert (=> b!195988 (= e!134719 (tuple2!16931 (_1!9110 lt!304693) (_2!9110 lt!304693)))))

(assert (=> b!195988 (= lt!304679 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195988 (= lt!304699 (appendBit!0 (_2!9110 lt!304015) lt!304679))))

(declare-fun res!163967 () Bool)

(assert (=> b!195988 (= res!163967 (= (size!4435 (buf!4921 (_2!9110 lt!304015))) (size!4435 (buf!4921 (_2!9110 lt!304699)))))))

(assert (=> b!195988 (=> (not res!163967) (not e!134723))))

(assert (=> b!195988 e!134723))

(declare-fun lt!304696 () tuple2!16930)

(assert (=> b!195988 (= lt!304696 lt!304699)))

(assert (=> b!195988 (= lt!304693 (appendBitsLSBFirstLoopTR!0 (_2!9110 lt!304696) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!304694 () Unit!13813)

(assert (=> b!195988 (= lt!304694 (lemmaIsPrefixTransitive!0 (_2!9110 lt!304015) (_2!9110 lt!304696) (_2!9110 lt!304693)))))

(assert (=> b!195988 (isPrefixOf!0 (_2!9110 lt!304015) (_2!9110 lt!304693))))

(declare-fun lt!304723 () Unit!13813)

(assert (=> b!195988 (= lt!304723 lt!304694)))

(assert (=> b!195988 (invariant!0 (currentBit!9218 (_2!9110 lt!304015)) (currentByte!9223 (_2!9110 lt!304015)) (size!4435 (buf!4921 (_2!9110 lt!304696))))))

(declare-fun lt!304703 () BitStream!7978)

(assert (=> b!195988 (= lt!304703 (BitStream!7979 (buf!4921 (_2!9110 lt!304696)) (currentByte!9223 (_2!9110 lt!304015)) (currentBit!9218 (_2!9110 lt!304015))))))

(assert (=> b!195988 (invariant!0 (currentBit!9218 lt!304703) (currentByte!9223 lt!304703) (size!4435 (buf!4921 (_2!9110 lt!304693))))))

(declare-fun lt!304709 () BitStream!7978)

(assert (=> b!195988 (= lt!304709 (BitStream!7979 (buf!4921 (_2!9110 lt!304693)) (currentByte!9223 lt!304703) (currentBit!9218 lt!304703)))))

(declare-fun lt!304676 () tuple2!16928)

(assert (=> b!195988 (= lt!304676 (readBitPure!0 lt!304703))))

(declare-fun lt!304707 () tuple2!16928)

(assert (=> b!195988 (= lt!304707 (readBitPure!0 lt!304709))))

(declare-fun lt!304702 () Unit!13813)

(declare-fun readBitPrefixLemma!0 (BitStream!7978 BitStream!7978) Unit!13813)

(assert (=> b!195988 (= lt!304702 (readBitPrefixLemma!0 lt!304703 (_2!9110 lt!304693)))))

(declare-fun res!163964 () Bool)

(assert (=> b!195988 (= res!163964 (= (bitIndex!0 (size!4435 (buf!4921 (_1!9109 lt!304676))) (currentByte!9223 (_1!9109 lt!304676)) (currentBit!9218 (_1!9109 lt!304676))) (bitIndex!0 (size!4435 (buf!4921 (_1!9109 lt!304707))) (currentByte!9223 (_1!9109 lt!304707)) (currentBit!9218 (_1!9109 lt!304707)))))))

(declare-fun e!134722 () Bool)

(assert (=> b!195988 (=> (not res!163964) (not e!134722))))

(assert (=> b!195988 e!134722))

(declare-fun lt!304680 () Unit!13813)

(assert (=> b!195988 (= lt!304680 lt!304702)))

(declare-fun lt!304715 () tuple2!16956)

(declare-fun reader!0 (BitStream!7978 BitStream!7978) tuple2!16956)

(assert (=> b!195988 (= lt!304715 (reader!0 (_2!9110 lt!304015) (_2!9110 lt!304693)))))

(declare-fun lt!304724 () tuple2!16956)

(assert (=> b!195988 (= lt!304724 (reader!0 (_2!9110 lt!304696) (_2!9110 lt!304693)))))

(declare-fun lt!304689 () tuple2!16928)

(assert (=> b!195988 (= lt!304689 (readBitPure!0 (_1!9123 lt!304715)))))

(assert (=> b!195988 (= (_2!9109 lt!304689) lt!304679)))

(declare-fun lt!304706 () Unit!13813)

(declare-fun Unit!13841 () Unit!13813)

(assert (=> b!195988 (= lt!304706 Unit!13841)))

(declare-fun lt!304728 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!195988 (= lt!304728 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!304695 () (_ BitVec 64))

(assert (=> b!195988 (= lt!304695 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!304691 () Unit!13813)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!7978 array!10055 (_ BitVec 64)) Unit!13813)

(assert (=> b!195988 (= lt!304691 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9110 lt!304015) (buf!4921 (_2!9110 lt!304693)) lt!304695))))

(assert (=> b!195988 (validate_offset_bits!1 ((_ sign_extend 32) (size!4435 (buf!4921 (_2!9110 lt!304693)))) ((_ sign_extend 32) (currentByte!9223 (_2!9110 lt!304015))) ((_ sign_extend 32) (currentBit!9218 (_2!9110 lt!304015))) lt!304695)))

(declare-fun lt!304678 () Unit!13813)

(assert (=> b!195988 (= lt!304678 lt!304691)))

(declare-fun lt!304729 () tuple2!16954)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!7978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!16954)

(assert (=> b!195988 (= lt!304729 (readNBitsLSBFirstsLoopPure!0 (_1!9123 lt!304715) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!304728))))

(declare-fun lt!304705 () (_ BitVec 64))

(assert (=> b!195988 (= lt!304705 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!304727 () Unit!13813)

(assert (=> b!195988 (= lt!304727 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9110 lt!304696) (buf!4921 (_2!9110 lt!304693)) lt!304705))))

(assert (=> b!195988 (validate_offset_bits!1 ((_ sign_extend 32) (size!4435 (buf!4921 (_2!9110 lt!304693)))) ((_ sign_extend 32) (currentByte!9223 (_2!9110 lt!304696))) ((_ sign_extend 32) (currentBit!9218 (_2!9110 lt!304696))) lt!304705)))

(declare-fun lt!304700 () Unit!13813)

(assert (=> b!195988 (= lt!304700 lt!304727)))

(declare-fun lt!304712 () tuple2!16954)

(assert (=> b!195988 (= lt!304712 (readNBitsLSBFirstsLoopPure!0 (_1!9123 lt!304724) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!304728 (ite (_2!9109 lt!304689) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!304720 () tuple2!16954)

(assert (=> b!195988 (= lt!304720 (readNBitsLSBFirstsLoopPure!0 (_1!9123 lt!304715) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!304728))))

(declare-fun c!9757 () Bool)

(assert (=> b!195988 (= c!9757 (_2!9109 (readBitPure!0 (_1!9123 lt!304715))))))

(declare-fun lt!304681 () tuple2!16954)

(declare-fun withMovedBitIndex!0 (BitStream!7978 (_ BitVec 64)) BitStream!7978)

(assert (=> b!195988 (= lt!304681 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9123 lt!304715) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!304728 e!134717)))))

(declare-fun lt!304682 () Unit!13813)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!7978 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!13813)

(assert (=> b!195988 (= lt!304682 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9123 lt!304715) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!304728))))

(assert (=> b!195988 (and (= (_2!9122 lt!304720) (_2!9122 lt!304681)) (= (_1!9122 lt!304720) (_1!9122 lt!304681)))))

(declare-fun lt!304721 () Unit!13813)

(assert (=> b!195988 (= lt!304721 lt!304682)))

(assert (=> b!195988 (= (_1!9123 lt!304715) (withMovedBitIndex!0 (_2!9123 lt!304715) (bvsub (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304015))) (currentByte!9223 (_2!9110 lt!304015)) (currentBit!9218 (_2!9110 lt!304015))) (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304693))) (currentByte!9223 (_2!9110 lt!304693)) (currentBit!9218 (_2!9110 lt!304693))))))))

(declare-fun lt!304717 () Unit!13813)

(declare-fun Unit!13842 () Unit!13813)

(assert (=> b!195988 (= lt!304717 Unit!13842)))

(assert (=> b!195988 (= (_1!9123 lt!304724) (withMovedBitIndex!0 (_2!9123 lt!304724) (bvsub (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304696))) (currentByte!9223 (_2!9110 lt!304696)) (currentBit!9218 (_2!9110 lt!304696))) (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304693))) (currentByte!9223 (_2!9110 lt!304693)) (currentBit!9218 (_2!9110 lt!304693))))))))

(declare-fun lt!304697 () Unit!13813)

(declare-fun Unit!13843 () Unit!13813)

(assert (=> b!195988 (= lt!304697 Unit!13843)))

(assert (=> b!195988 (= (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304015))) (currentByte!9223 (_2!9110 lt!304015)) (currentBit!9218 (_2!9110 lt!304015))) (bvsub (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304696))) (currentByte!9223 (_2!9110 lt!304696)) (currentBit!9218 (_2!9110 lt!304696))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!304688 () Unit!13813)

(declare-fun Unit!13844 () Unit!13813)

(assert (=> b!195988 (= lt!304688 Unit!13844)))

(assert (=> b!195988 (= (_2!9122 lt!304729) (_2!9122 lt!304712))))

(declare-fun lt!304722 () Unit!13813)

(declare-fun Unit!13845 () Unit!13813)

(assert (=> b!195988 (= lt!304722 Unit!13845)))

(assert (=> b!195988 (invariant!0 (currentBit!9218 (_2!9110 lt!304693)) (currentByte!9223 (_2!9110 lt!304693)) (size!4435 (buf!4921 (_2!9110 lt!304693))))))

(declare-fun lt!304714 () Unit!13813)

(declare-fun Unit!13846 () Unit!13813)

(assert (=> b!195988 (= lt!304714 Unit!13846)))

(assert (=> b!195988 (= (size!4435 (buf!4921 (_2!9110 lt!304015))) (size!4435 (buf!4921 (_2!9110 lt!304693))))))

(declare-fun lt!304690 () Unit!13813)

(declare-fun Unit!13847 () Unit!13813)

(assert (=> b!195988 (= lt!304690 Unit!13847)))

(assert (=> b!195988 (= (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304693))) (currentByte!9223 (_2!9110 lt!304693)) (currentBit!9218 (_2!9110 lt!304693))) (bvsub (bvadd (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304015))) (currentByte!9223 (_2!9110 lt!304015)) (currentBit!9218 (_2!9110 lt!304015))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!304683 () Unit!13813)

(declare-fun Unit!13848 () Unit!13813)

(assert (=> b!195988 (= lt!304683 Unit!13848)))

(declare-fun lt!304692 () Unit!13813)

(declare-fun Unit!13849 () Unit!13813)

(assert (=> b!195988 (= lt!304692 Unit!13849)))

(declare-fun lt!304716 () tuple2!16956)

(assert (=> b!195988 (= lt!304716 (reader!0 (_2!9110 lt!304015) (_2!9110 lt!304693)))))

(declare-fun lt!304708 () (_ BitVec 64))

(assert (=> b!195988 (= lt!304708 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!304687 () Unit!13813)

(assert (=> b!195988 (= lt!304687 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9110 lt!304015) (buf!4921 (_2!9110 lt!304693)) lt!304708))))

(assert (=> b!195988 (validate_offset_bits!1 ((_ sign_extend 32) (size!4435 (buf!4921 (_2!9110 lt!304693)))) ((_ sign_extend 32) (currentByte!9223 (_2!9110 lt!304015))) ((_ sign_extend 32) (currentBit!9218 (_2!9110 lt!304015))) lt!304708)))

(declare-fun lt!304704 () Unit!13813)

(assert (=> b!195988 (= lt!304704 lt!304687)))

(declare-fun lt!304713 () tuple2!16954)

(assert (=> b!195988 (= lt!304713 (readNBitsLSBFirstsLoopPure!0 (_1!9123 lt!304716) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!163963 () Bool)

(assert (=> b!195988 (= res!163963 (= (_2!9122 lt!304713) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!134725 () Bool)

(assert (=> b!195988 (=> (not res!163963) (not e!134725))))

(assert (=> b!195988 e!134725))

(declare-fun lt!304674 () Unit!13813)

(declare-fun Unit!13850 () Unit!13813)

(assert (=> b!195988 (= lt!304674 Unit!13850)))

(declare-fun b!195989 () Bool)

(declare-fun res!163968 () Bool)

(assert (=> b!195989 (= res!163968 call!3074)))

(assert (=> b!195989 (=> (not res!163968) (not e!134723))))

(declare-fun b!195990 () Bool)

(declare-fun Unit!13851 () Unit!13813)

(assert (=> b!195990 (= e!134719 (tuple2!16931 Unit!13851 (_2!9110 lt!304015)))))

(declare-fun lt!304677 () Unit!13813)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!7978) Unit!13813)

(assert (=> b!195990 (= lt!304677 (lemmaIsPrefixRefl!0 (_2!9110 lt!304015)))))

(assert (=> b!195990 call!3074))

(declare-fun lt!304725 () Unit!13813)

(assert (=> b!195990 (= lt!304725 lt!304677)))

(declare-fun b!195991 () Bool)

(declare-fun e!134724 () Bool)

(declare-fun lt!304701 () (_ BitVec 64))

(assert (=> b!195991 (= e!134724 (validate_offset_bits!1 ((_ sign_extend 32) (size!4435 (buf!4921 (_2!9110 lt!304015)))) ((_ sign_extend 32) (currentByte!9223 (_2!9110 lt!304015))) ((_ sign_extend 32) (currentBit!9218 (_2!9110 lt!304015))) lt!304701))))

(declare-fun b!195992 () Bool)

(assert (=> b!195992 (= e!134721 e!134718)))

(declare-fun res!163966 () Bool)

(assert (=> b!195992 (=> (not res!163966) (not e!134718))))

(assert (=> b!195992 (= res!163966 (= (_2!9122 lt!304726) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(assert (=> b!195992 (= lt!304726 (readNBitsLSBFirstsLoopPure!0 (_1!9123 lt!304686) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!304710 () Unit!13813)

(declare-fun lt!304685 () Unit!13813)

(assert (=> b!195992 (= lt!304710 lt!304685)))

(assert (=> b!195992 (validate_offset_bits!1 ((_ sign_extend 32) (size!4435 (buf!4921 (_2!9110 lt!304719)))) ((_ sign_extend 32) (currentByte!9223 (_2!9110 lt!304015))) ((_ sign_extend 32) (currentBit!9218 (_2!9110 lt!304015))) lt!304701)))

(assert (=> b!195992 (= lt!304685 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9110 lt!304015) (buf!4921 (_2!9110 lt!304719)) lt!304701))))

(assert (=> b!195992 e!134724))

(declare-fun res!163960 () Bool)

(assert (=> b!195992 (=> (not res!163960) (not e!134724))))

(assert (=> b!195992 (= res!163960 (and (= (size!4435 (buf!4921 (_2!9110 lt!304015))) (size!4435 (buf!4921 (_2!9110 lt!304719)))) (bvsge lt!304701 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!195992 (= lt!304701 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!195992 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(assert (=> b!195992 (= lt!304686 (reader!0 (_2!9110 lt!304015) (_2!9110 lt!304719)))))

(declare-fun b!195993 () Bool)

(declare-fun res!163959 () Bool)

(assert (=> b!195993 (=> (not res!163959) (not e!134721))))

(assert (=> b!195993 (= res!163959 (= (size!4435 (buf!4921 (_2!9110 lt!304015))) (size!4435 (buf!4921 (_2!9110 lt!304719)))))))

(declare-fun b!195994 () Bool)

(assert (=> b!195994 (= e!134722 (= (_2!9109 lt!304676) (_2!9109 lt!304707)))))

(declare-fun b!195995 () Bool)

(assert (=> b!195995 (= e!134725 (= (_1!9122 lt!304713) (_2!9123 lt!304716)))))

(declare-fun b!195996 () Bool)

(assert (=> b!195996 (= e!134720 (= (bitIndex!0 (size!4435 (buf!4921 (_1!9109 lt!304718))) (currentByte!9223 (_1!9109 lt!304718)) (currentBit!9218 (_1!9109 lt!304718))) (bitIndex!0 (size!4435 (buf!4921 (_2!9110 lt!304699))) (currentByte!9223 (_2!9110 lt!304699)) (currentBit!9218 (_2!9110 lt!304699)))))))

(assert (= (and d!66323 c!9756) b!195990))

(assert (= (and d!66323 (not c!9756)) b!195988))

(assert (= (and b!195988 res!163967) b!195985))

(assert (= (and b!195985 res!163962) b!195989))

(assert (= (and b!195989 res!163968) b!195983))

(assert (= (and b!195983 res!163965) b!195996))

(assert (= (and b!195988 res!163964) b!195994))

(assert (= (and b!195988 c!9757) b!195986))

(assert (= (and b!195988 (not c!9757)) b!195987))

(assert (= (and b!195988 res!163963) b!195995))

(assert (= (or b!195990 b!195989) bm!3071))

(assert (= (and d!66323 res!163958) b!195993))

(assert (= (and b!195993 res!163959) b!195982))

(assert (= (and b!195982 res!163969) b!195984))

(assert (= (and b!195984 res!163961) b!195992))

(assert (= (and b!195992 res!163960) b!195991))

(assert (= (and b!195992 res!163966) b!195981))

(declare-fun m!303213 () Bool)

(assert (=> b!195982 m!303213))

(assert (=> b!195982 m!302839))

(declare-fun m!303215 () Bool)

(assert (=> bm!3071 m!303215))

(declare-fun m!303217 () Bool)

(assert (=> b!195985 m!303217))

(assert (=> b!195985 m!302839))

(declare-fun m!303219 () Bool)

(assert (=> b!195990 m!303219))

(declare-fun m!303221 () Bool)

(assert (=> b!195991 m!303221))

(declare-fun m!303223 () Bool)

(assert (=> b!195996 m!303223))

(assert (=> b!195996 m!303217))

(declare-fun m!303225 () Bool)

(assert (=> b!195992 m!303225))

(declare-fun m!303227 () Bool)

(assert (=> b!195992 m!303227))

(declare-fun m!303229 () Bool)

(assert (=> b!195992 m!303229))

(declare-fun m!303231 () Bool)

(assert (=> b!195992 m!303231))

(declare-fun m!303233 () Bool)

(assert (=> b!195992 m!303233))

(declare-fun m!303235 () Bool)

(assert (=> b!195992 m!303235))

(declare-fun m!303237 () Bool)

(assert (=> d!66323 m!303237))

(declare-fun m!303239 () Bool)

(assert (=> b!195984 m!303239))

(declare-fun m!303241 () Bool)

(assert (=> b!195988 m!303241))

(declare-fun m!303243 () Bool)

(assert (=> b!195988 m!303243))

(declare-fun m!303245 () Bool)

(assert (=> b!195988 m!303245))

(declare-fun m!303247 () Bool)

(assert (=> b!195988 m!303247))

(declare-fun m!303249 () Bool)

(assert (=> b!195988 m!303249))

(declare-fun m!303251 () Bool)

(assert (=> b!195988 m!303251))

(declare-fun m!303253 () Bool)

(assert (=> b!195988 m!303253))

(declare-fun m!303255 () Bool)

(assert (=> b!195988 m!303255))

(declare-fun m!303257 () Bool)

(assert (=> b!195988 m!303257))

(declare-fun m!303259 () Bool)

(assert (=> b!195988 m!303259))

(assert (=> b!195988 m!303233))

(declare-fun m!303261 () Bool)

(assert (=> b!195988 m!303261))

(declare-fun m!303263 () Bool)

(assert (=> b!195988 m!303263))

(declare-fun m!303265 () Bool)

(assert (=> b!195988 m!303265))

(assert (=> b!195988 m!302839))

(assert (=> b!195988 m!303231))

(declare-fun m!303267 () Bool)

(assert (=> b!195988 m!303267))

(declare-fun m!303269 () Bool)

(assert (=> b!195988 m!303269))

(declare-fun m!303271 () Bool)

(assert (=> b!195988 m!303271))

(declare-fun m!303273 () Bool)

(assert (=> b!195988 m!303273))

(declare-fun m!303275 () Bool)

(assert (=> b!195988 m!303275))

(declare-fun m!303277 () Bool)

(assert (=> b!195988 m!303277))

(assert (=> b!195988 m!303257))

(declare-fun m!303279 () Bool)

(assert (=> b!195988 m!303279))

(declare-fun m!303281 () Bool)

(assert (=> b!195988 m!303281))

(declare-fun m!303283 () Bool)

(assert (=> b!195988 m!303283))

(declare-fun m!303285 () Bool)

(assert (=> b!195988 m!303285))

(declare-fun m!303287 () Bool)

(assert (=> b!195988 m!303287))

(declare-fun m!303289 () Bool)

(assert (=> b!195988 m!303289))

(declare-fun m!303291 () Bool)

(assert (=> b!195988 m!303291))

(declare-fun m!303293 () Bool)

(assert (=> b!195988 m!303293))

(declare-fun m!303295 () Bool)

(assert (=> b!195988 m!303295))

(declare-fun m!303297 () Bool)

(assert (=> b!195988 m!303297))

(declare-fun m!303299 () Bool)

(assert (=> b!195988 m!303299))

(declare-fun m!303301 () Bool)

(assert (=> b!195988 m!303301))

(declare-fun m!303303 () Bool)

(assert (=> b!195983 m!303303))

(assert (=> b!195983 m!303303))

(declare-fun m!303305 () Bool)

(assert (=> b!195983 m!303305))

(assert (=> b!195670 d!66323))

(declare-fun d!66341 () Bool)

(declare-fun e!134726 () Bool)

(assert (=> d!66341 e!134726))

(declare-fun res!163971 () Bool)

(assert (=> d!66341 (=> (not res!163971) (not e!134726))))

(declare-fun lt!304730 () (_ BitVec 64))

(declare-fun lt!304732 () (_ BitVec 64))

(declare-fun lt!304733 () (_ BitVec 64))

(assert (=> d!66341 (= res!163971 (= lt!304730 (bvsub lt!304733 lt!304732)))))

(assert (=> d!66341 (or (= (bvand lt!304733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!304732 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!304733 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!304733 lt!304732) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!66341 (= lt!304732 (remainingBits!0 ((_ sign_extend 32) (size!4435 (buf!4921 (_1!9109 lt!304011)))) ((_ sign_extend 32) (currentByte!9223 (_1!9109 lt!304011))) ((_ sign_extend 32) (currentBit!9218 (_1!9109 lt!304011)))))))

(declare-fun lt!304731 () (_ BitVec 64))

(declare-fun lt!304735 () (_ BitVec 64))

(assert (=> d!66341 (= lt!304733 (bvmul lt!304731 lt!304735))))

(assert (=> d!66341 (or (= lt!304731 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!304735 (bvsdiv (bvmul lt!304731 lt!304735) lt!304731)))))

(assert (=> d!66341 (= lt!304735 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!66341 (= lt!304731 ((_ sign_extend 32) (size!4435 (buf!4921 (_1!9109 lt!304011)))))))

(assert (=> d!66341 (= lt!304730 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9223 (_1!9109 lt!304011))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9218 (_1!9109 lt!304011)))))))

(assert (=> d!66341 (invariant!0 (currentBit!9218 (_1!9109 lt!304011)) (currentByte!9223 (_1!9109 lt!304011)) (size!4435 (buf!4921 (_1!9109 lt!304011))))))

(assert (=> d!66341 (= (bitIndex!0 (size!4435 (buf!4921 (_1!9109 lt!304011))) (currentByte!9223 (_1!9109 lt!304011)) (currentBit!9218 (_1!9109 lt!304011))) lt!304730)))

(declare-fun b!195997 () Bool)

(declare-fun res!163970 () Bool)

(assert (=> b!195997 (=> (not res!163970) (not e!134726))))

(assert (=> b!195997 (= res!163970 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!304730))))

(declare-fun b!195998 () Bool)

(declare-fun lt!304734 () (_ BitVec 64))

(assert (=> b!195998 (= e!134726 (bvsle lt!304730 (bvmul lt!304734 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!195998 (or (= lt!304734 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!304734 #b0000000000000000000000000000000000000000000000000000000000001000) lt!304734)))))

(assert (=> b!195998 (= lt!304734 ((_ sign_extend 32) (size!4435 (buf!4921 (_1!9109 lt!304011)))))))

(assert (= (and d!66341 res!163971) b!195997))

(assert (= (and b!195997 res!163970) b!195998))

(declare-fun m!303307 () Bool)

(assert (=> d!66341 m!303307))

(declare-fun m!303309 () Bool)

(assert (=> d!66341 m!303309))

(assert (=> b!195665 d!66341))

(declare-fun d!66343 () Bool)

(assert (=> d!66343 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9218 thiss!1204) (currentByte!9223 thiss!1204) (size!4435 (buf!4921 thiss!1204))))))

(declare-fun bs!16493 () Bool)

(assert (= bs!16493 d!66343))

(assert (=> bs!16493 m!302827))

(assert (=> start!41618 d!66343))

(push 1)

(assert (not b!195806))

(assert (not d!66313))

(assert (not b!195984))

(assert (not b!195992))

(assert (not b!195811))

(assert (not b!195985))

(assert (not b!195816))

(assert (not d!66317))

(assert (not d!66343))

(assert (not b!195797))

(assert (not d!66315))

(assert (not d!66277))

(assert (not b!195799))

(assert (not b!195991))

(assert (not b!195808))

(assert (not b!195988))

(assert (not b!195990))

(assert (not d!66341))

(assert (not b!195996))

(assert (not d!66293))

(assert (not b!195798))

(assert (not d!66295))

(assert (not b!195796))

(assert (not bm!3071))

(assert (not b!195983))

(assert (not d!66323))

(assert (not b!195814))

(assert (not b!195982))

(assert (not d!66321))

(assert (not d!66281))

(check-sat)

(pop 1)

(push 1)

(check-sat)

