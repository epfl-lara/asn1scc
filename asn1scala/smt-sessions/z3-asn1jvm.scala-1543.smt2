; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43262 () Bool)

(assert start!43262)

(declare-fun b!204007 () Bool)

(declare-fun res!170933 () Bool)

(declare-fun e!139747 () Bool)

(assert (=> b!204007 (=> (not res!170933) (not e!139747))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(assert (=> b!204007 (= res!170933 (not (= i!590 nBits!348)))))

(declare-fun b!204008 () Bool)

(declare-fun res!170926 () Bool)

(declare-fun e!139746 () Bool)

(assert (=> b!204008 (=> res!170926 e!139746)))

(declare-datatypes ((array!10327 0))(
  ( (array!10328 (arr!5471 (Array (_ BitVec 32) (_ BitVec 8))) (size!4541 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8190 0))(
  ( (BitStream!8191 (buf!5046 array!10327) (currentByte!9522 (_ BitVec 32)) (currentBit!9517 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!14540 0))(
  ( (Unit!14541) )
))
(declare-datatypes ((tuple2!17454 0))(
  ( (tuple2!17455 (_1!9379 Unit!14540) (_2!9379 BitStream!8190)) )
))
(declare-fun lt!318619 () tuple2!17454)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!204008 (= res!170926 (not (invariant!0 (currentBit!9517 (_2!9379 lt!318619)) (currentByte!9522 (_2!9379 lt!318619)) (size!4541 (buf!5046 (_2!9379 lt!318619))))))))

(declare-fun b!204009 () Bool)

(declare-fun e!139752 () Bool)

(declare-datatypes ((tuple2!17456 0))(
  ( (tuple2!17457 (_1!9380 BitStream!8190) (_2!9380 Bool)) )
))
(declare-fun lt!318624 () tuple2!17456)

(declare-fun lt!318621 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204009 (= e!139752 (= (bitIndex!0 (size!4541 (buf!5046 (_1!9380 lt!318624))) (currentByte!9522 (_1!9380 lt!318624)) (currentBit!9517 (_1!9380 lt!318624))) lt!318621))))

(declare-fun b!204010 () Bool)

(declare-fun e!139749 () Bool)

(assert (=> b!204010 (= e!139749 e!139752)))

(declare-fun res!170936 () Bool)

(assert (=> b!204010 (=> (not res!170936) (not e!139752))))

(declare-fun lt!318623 () Bool)

(declare-fun lt!318622 () tuple2!17454)

(assert (=> b!204010 (= res!170936 (and (= (_2!9380 lt!318624) lt!318623) (= (_1!9380 lt!318624) (_2!9379 lt!318622))))))

(declare-fun thiss!1204 () BitStream!8190)

(declare-fun readBitPure!0 (BitStream!8190) tuple2!17456)

(declare-fun readerFrom!0 (BitStream!8190 (_ BitVec 32) (_ BitVec 32)) BitStream!8190)

(assert (=> b!204010 (= lt!318624 (readBitPure!0 (readerFrom!0 (_2!9379 lt!318622) (currentBit!9517 thiss!1204) (currentByte!9522 thiss!1204))))))

(declare-fun b!204011 () Bool)

(declare-fun e!139745 () Bool)

(assert (=> b!204011 (= e!139747 (not e!139745))))

(declare-fun res!170931 () Bool)

(assert (=> b!204011 (=> res!170931 e!139745)))

(declare-fun lt!318618 () (_ BitVec 64))

(declare-fun lt!318625 () (_ BitVec 64))

(assert (=> b!204011 (= res!170931 (not (= lt!318618 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!318625))))))

(assert (=> b!204011 (= lt!318618 (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!318622))) (currentByte!9522 (_2!9379 lt!318622)) (currentBit!9517 (_2!9379 lt!318622))))))

(assert (=> b!204011 (= lt!318625 (bitIndex!0 (size!4541 (buf!5046 thiss!1204)) (currentByte!9522 thiss!1204) (currentBit!9517 thiss!1204)))))

(declare-fun e!139751 () Bool)

(assert (=> b!204011 e!139751))

(declare-fun res!170928 () Bool)

(assert (=> b!204011 (=> (not res!170928) (not e!139751))))

(assert (=> b!204011 (= res!170928 (= (size!4541 (buf!5046 thiss!1204)) (size!4541 (buf!5046 (_2!9379 lt!318622)))))))

(declare-fun appendBit!0 (BitStream!8190 Bool) tuple2!17454)

(assert (=> b!204011 (= lt!318622 (appendBit!0 thiss!1204 lt!318623))))

(declare-fun v!189 () (_ BitVec 64))

(assert (=> b!204011 (= lt!318623 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!590))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!204012 () Bool)

(assert (=> b!204012 (= e!139751 e!139749)))

(declare-fun res!170930 () Bool)

(assert (=> b!204012 (=> (not res!170930) (not e!139749))))

(declare-fun lt!318626 () (_ BitVec 64))

(assert (=> b!204012 (= res!170930 (= lt!318621 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!318626)))))

(assert (=> b!204012 (= lt!318621 (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!318622))) (currentByte!9522 (_2!9379 lt!318622)) (currentBit!9517 (_2!9379 lt!318622))))))

(assert (=> b!204012 (= lt!318626 (bitIndex!0 (size!4541 (buf!5046 thiss!1204)) (currentByte!9522 thiss!1204) (currentBit!9517 thiss!1204)))))

(declare-fun b!204014 () Bool)

(assert (=> b!204014 (= e!139746 (or (not (= (size!4541 (buf!5046 (_2!9379 lt!318619))) (size!4541 (buf!5046 thiss!1204)))) (let ((bdg!12240 (bvadd lt!318625 ((_ sign_extend 32) nBits!348)))) (let ((bdg!12241 (bvand bdg!12240 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (= bdg!12241 (bvand ((_ sign_extend 32) i!590) #b1000000000000000000000000000000000000000000000000000000000000000)) (= bdg!12241 (bvand (bvsub bdg!12240 ((_ sign_extend 32) i!590)) #b1000000000000000000000000000000000000000000000000000000000000000)))))))))

(declare-fun b!204015 () Bool)

(declare-fun res!170927 () Bool)

(assert (=> b!204015 (=> (not res!170927) (not e!139747))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204015 (= res!170927 (validate_offset_bits!1 ((_ sign_extend 32) (size!4541 (buf!5046 thiss!1204))) ((_ sign_extend 32) (currentByte!9522 thiss!1204)) ((_ sign_extend 32) (currentBit!9517 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!204016 () Bool)

(declare-fun res!170935 () Bool)

(assert (=> b!204016 (=> (not res!170935) (not e!139749))))

(declare-fun isPrefixOf!0 (BitStream!8190 BitStream!8190) Bool)

(assert (=> b!204016 (= res!170935 (isPrefixOf!0 thiss!1204 (_2!9379 lt!318622)))))

(declare-fun b!204017 () Bool)

(declare-fun res!170934 () Bool)

(assert (=> b!204017 (=> (not res!170934) (not e!139747))))

(assert (=> b!204017 (= res!170934 (invariant!0 (currentBit!9517 thiss!1204) (currentByte!9522 thiss!1204) (size!4541 (buf!5046 thiss!1204))))))

(declare-fun b!204018 () Bool)

(assert (=> b!204018 (= e!139745 e!139746)))

(declare-fun res!170932 () Bool)

(assert (=> b!204018 (=> res!170932 e!139746)))

(assert (=> b!204018 (= res!170932 (not (= (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!318619))) (currentByte!9522 (_2!9379 lt!318619)) (currentBit!9517 (_2!9379 lt!318619))) (bvsub (bvsub (bvadd lt!318618 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590)) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (=> b!204018 (isPrefixOf!0 thiss!1204 (_2!9379 lt!318619))))

(declare-fun lt!318620 () Unit!14540)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!8190 BitStream!8190 BitStream!8190) Unit!14540)

(assert (=> b!204018 (= lt!318620 (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9379 lt!318622) (_2!9379 lt!318619)))))

(declare-fun appendBitsLSBFirstLoopTR!0 (BitStream!8190 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!17454)

(assert (=> b!204018 (= lt!318619 (appendBitsLSBFirstLoopTR!0 (_2!9379 lt!318622) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun res!170929 () Bool)

(assert (=> start!43262 (=> (not res!170929) (not e!139747))))

(assert (=> start!43262 (= res!170929 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!43262 e!139747))

(assert (=> start!43262 true))

(declare-fun e!139750 () Bool)

(declare-fun inv!12 (BitStream!8190) Bool)

(assert (=> start!43262 (and (inv!12 thiss!1204) e!139750)))

(declare-fun b!204013 () Bool)

(declare-fun array_inv!4282 (array!10327) Bool)

(assert (=> b!204013 (= e!139750 (array_inv!4282 (buf!5046 thiss!1204)))))

(assert (= (and start!43262 res!170929) b!204015))

(assert (= (and b!204015 res!170927) b!204017))

(assert (= (and b!204017 res!170934) b!204007))

(assert (= (and b!204007 res!170933) b!204011))

(assert (= (and b!204011 res!170928) b!204012))

(assert (= (and b!204012 res!170930) b!204016))

(assert (= (and b!204016 res!170935) b!204010))

(assert (= (and b!204010 res!170936) b!204009))

(assert (= (and b!204011 (not res!170931)) b!204018))

(assert (= (and b!204018 (not res!170932)) b!204008))

(assert (= (and b!204008 (not res!170926)) b!204014))

(assert (= start!43262 b!204013))

(declare-fun m!315041 () Bool)

(assert (=> b!204011 m!315041))

(declare-fun m!315043 () Bool)

(assert (=> b!204011 m!315043))

(declare-fun m!315045 () Bool)

(assert (=> b!204011 m!315045))

(declare-fun m!315047 () Bool)

(assert (=> start!43262 m!315047))

(declare-fun m!315049 () Bool)

(assert (=> b!204017 m!315049))

(declare-fun m!315051 () Bool)

(assert (=> b!204018 m!315051))

(declare-fun m!315053 () Bool)

(assert (=> b!204018 m!315053))

(declare-fun m!315055 () Bool)

(assert (=> b!204018 m!315055))

(declare-fun m!315057 () Bool)

(assert (=> b!204018 m!315057))

(declare-fun m!315059 () Bool)

(assert (=> b!204009 m!315059))

(assert (=> b!204012 m!315041))

(assert (=> b!204012 m!315043))

(declare-fun m!315061 () Bool)

(assert (=> b!204015 m!315061))

(declare-fun m!315063 () Bool)

(assert (=> b!204013 m!315063))

(declare-fun m!315065 () Bool)

(assert (=> b!204008 m!315065))

(declare-fun m!315067 () Bool)

(assert (=> b!204010 m!315067))

(assert (=> b!204010 m!315067))

(declare-fun m!315069 () Bool)

(assert (=> b!204010 m!315069))

(declare-fun m!315071 () Bool)

(assert (=> b!204016 m!315071))

(check-sat (not b!204011) (not b!204012) (not b!204009) (not b!204008) (not b!204013) (not start!43262) (not b!204018) (not b!204015) (not b!204017) (not b!204010) (not b!204016))
(check-sat)
(get-model)

(declare-fun d!69645 () Bool)

(declare-fun e!139779 () Bool)

(assert (=> d!69645 e!139779))

(declare-fun res!170974 () Bool)

(assert (=> d!69645 (=> (not res!170974) (not e!139779))))

(declare-fun lt!318671 () (_ BitVec 64))

(declare-fun lt!318667 () (_ BitVec 64))

(declare-fun lt!318669 () (_ BitVec 64))

(assert (=> d!69645 (= res!170974 (= lt!318669 (bvsub lt!318671 lt!318667)))))

(assert (=> d!69645 (or (= (bvand lt!318671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318667 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318671 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318671 lt!318667) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!69645 (= lt!318667 (remainingBits!0 ((_ sign_extend 32) (size!4541 (buf!5046 (_2!9379 lt!318622)))) ((_ sign_extend 32) (currentByte!9522 (_2!9379 lt!318622))) ((_ sign_extend 32) (currentBit!9517 (_2!9379 lt!318622)))))))

(declare-fun lt!318670 () (_ BitVec 64))

(declare-fun lt!318668 () (_ BitVec 64))

(assert (=> d!69645 (= lt!318671 (bvmul lt!318670 lt!318668))))

(assert (=> d!69645 (or (= lt!318670 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318668 (bvsdiv (bvmul lt!318670 lt!318668) lt!318670)))))

(assert (=> d!69645 (= lt!318668 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69645 (= lt!318670 ((_ sign_extend 32) (size!4541 (buf!5046 (_2!9379 lt!318622)))))))

(assert (=> d!69645 (= lt!318669 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9522 (_2!9379 lt!318622))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9517 (_2!9379 lt!318622)))))))

(assert (=> d!69645 (invariant!0 (currentBit!9517 (_2!9379 lt!318622)) (currentByte!9522 (_2!9379 lt!318622)) (size!4541 (buf!5046 (_2!9379 lt!318622))))))

(assert (=> d!69645 (= (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!318622))) (currentByte!9522 (_2!9379 lt!318622)) (currentBit!9517 (_2!9379 lt!318622))) lt!318669)))

(declare-fun b!204059 () Bool)

(declare-fun res!170975 () Bool)

(assert (=> b!204059 (=> (not res!170975) (not e!139779))))

(assert (=> b!204059 (= res!170975 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318669))))

(declare-fun b!204060 () Bool)

(declare-fun lt!318666 () (_ BitVec 64))

(assert (=> b!204060 (= e!139779 (bvsle lt!318669 (bvmul lt!318666 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204060 (or (= lt!318666 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318666 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318666)))))

(assert (=> b!204060 (= lt!318666 ((_ sign_extend 32) (size!4541 (buf!5046 (_2!9379 lt!318622)))))))

(assert (= (and d!69645 res!170974) b!204059))

(assert (= (and b!204059 res!170975) b!204060))

(declare-fun m!315105 () Bool)

(assert (=> d!69645 m!315105))

(declare-fun m!315107 () Bool)

(assert (=> d!69645 m!315107))

(assert (=> b!204011 d!69645))

(declare-fun d!69647 () Bool)

(declare-fun e!139780 () Bool)

(assert (=> d!69647 e!139780))

(declare-fun res!170976 () Bool)

(assert (=> d!69647 (=> (not res!170976) (not e!139780))))

(declare-fun lt!318673 () (_ BitVec 64))

(declare-fun lt!318677 () (_ BitVec 64))

(declare-fun lt!318675 () (_ BitVec 64))

(assert (=> d!69647 (= res!170976 (= lt!318675 (bvsub lt!318677 lt!318673)))))

(assert (=> d!69647 (or (= (bvand lt!318677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318673 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318677 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318677 lt!318673) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69647 (= lt!318673 (remainingBits!0 ((_ sign_extend 32) (size!4541 (buf!5046 thiss!1204))) ((_ sign_extend 32) (currentByte!9522 thiss!1204)) ((_ sign_extend 32) (currentBit!9517 thiss!1204))))))

(declare-fun lt!318676 () (_ BitVec 64))

(declare-fun lt!318674 () (_ BitVec 64))

(assert (=> d!69647 (= lt!318677 (bvmul lt!318676 lt!318674))))

(assert (=> d!69647 (or (= lt!318676 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318674 (bvsdiv (bvmul lt!318676 lt!318674) lt!318676)))))

(assert (=> d!69647 (= lt!318674 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69647 (= lt!318676 ((_ sign_extend 32) (size!4541 (buf!5046 thiss!1204))))))

(assert (=> d!69647 (= lt!318675 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9522 thiss!1204)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9517 thiss!1204))))))

(assert (=> d!69647 (invariant!0 (currentBit!9517 thiss!1204) (currentByte!9522 thiss!1204) (size!4541 (buf!5046 thiss!1204)))))

(assert (=> d!69647 (= (bitIndex!0 (size!4541 (buf!5046 thiss!1204)) (currentByte!9522 thiss!1204) (currentBit!9517 thiss!1204)) lt!318675)))

(declare-fun b!204061 () Bool)

(declare-fun res!170977 () Bool)

(assert (=> b!204061 (=> (not res!170977) (not e!139780))))

(assert (=> b!204061 (= res!170977 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318675))))

(declare-fun b!204062 () Bool)

(declare-fun lt!318672 () (_ BitVec 64))

(assert (=> b!204062 (= e!139780 (bvsle lt!318675 (bvmul lt!318672 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204062 (or (= lt!318672 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318672 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318672)))))

(assert (=> b!204062 (= lt!318672 ((_ sign_extend 32) (size!4541 (buf!5046 thiss!1204))))))

(assert (= (and d!69647 res!170976) b!204061))

(assert (= (and b!204061 res!170977) b!204062))

(declare-fun m!315109 () Bool)

(assert (=> d!69647 m!315109))

(assert (=> d!69647 m!315049))

(assert (=> b!204011 d!69647))

(declare-fun b!204075 () Bool)

(declare-fun e!139786 () Bool)

(declare-fun lt!318687 () tuple2!17456)

(declare-fun lt!318686 () tuple2!17454)

(assert (=> b!204075 (= e!139786 (= (bitIndex!0 (size!4541 (buf!5046 (_1!9380 lt!318687))) (currentByte!9522 (_1!9380 lt!318687)) (currentBit!9517 (_1!9380 lt!318687))) (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!318686))) (currentByte!9522 (_2!9379 lt!318686)) (currentBit!9517 (_2!9379 lt!318686)))))))

(declare-fun d!69649 () Bool)

(declare-fun e!139785 () Bool)

(assert (=> d!69649 e!139785))

(declare-fun res!170988 () Bool)

(assert (=> d!69649 (=> (not res!170988) (not e!139785))))

(assert (=> d!69649 (= res!170988 (= (size!4541 (buf!5046 thiss!1204)) (size!4541 (buf!5046 (_2!9379 lt!318686)))))))

(declare-fun choose!16 (BitStream!8190 Bool) tuple2!17454)

(assert (=> d!69649 (= lt!318686 (choose!16 thiss!1204 lt!318623))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!69649 (validate_offset_bit!0 ((_ sign_extend 32) (size!4541 (buf!5046 thiss!1204))) ((_ sign_extend 32) (currentByte!9522 thiss!1204)) ((_ sign_extend 32) (currentBit!9517 thiss!1204)))))

(assert (=> d!69649 (= (appendBit!0 thiss!1204 lt!318623) lt!318686)))

(declare-fun b!204073 () Bool)

(declare-fun res!170989 () Bool)

(assert (=> b!204073 (=> (not res!170989) (not e!139785))))

(assert (=> b!204073 (= res!170989 (isPrefixOf!0 thiss!1204 (_2!9379 lt!318686)))))

(declare-fun b!204074 () Bool)

(assert (=> b!204074 (= e!139785 e!139786)))

(declare-fun res!170987 () Bool)

(assert (=> b!204074 (=> (not res!170987) (not e!139786))))

(assert (=> b!204074 (= res!170987 (and (= (_2!9380 lt!318687) lt!318623) (= (_1!9380 lt!318687) (_2!9379 lt!318686))))))

(assert (=> b!204074 (= lt!318687 (readBitPure!0 (readerFrom!0 (_2!9379 lt!318686) (currentBit!9517 thiss!1204) (currentByte!9522 thiss!1204))))))

(declare-fun b!204072 () Bool)

(declare-fun res!170986 () Bool)

(assert (=> b!204072 (=> (not res!170986) (not e!139785))))

(declare-fun lt!318689 () (_ BitVec 64))

(declare-fun lt!318688 () (_ BitVec 64))

(assert (=> b!204072 (= res!170986 (= (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!318686))) (currentByte!9522 (_2!9379 lt!318686)) (currentBit!9517 (_2!9379 lt!318686))) (bvadd lt!318688 lt!318689)))))

(assert (=> b!204072 (or (not (= (bvand lt!318688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318689 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!318688 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!318688 lt!318689) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204072 (= lt!318689 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!204072 (= lt!318688 (bitIndex!0 (size!4541 (buf!5046 thiss!1204)) (currentByte!9522 thiss!1204) (currentBit!9517 thiss!1204)))))

(assert (= (and d!69649 res!170988) b!204072))

(assert (= (and b!204072 res!170986) b!204073))

(assert (= (and b!204073 res!170989) b!204074))

(assert (= (and b!204074 res!170987) b!204075))

(declare-fun m!315111 () Bool)

(assert (=> d!69649 m!315111))

(declare-fun m!315113 () Bool)

(assert (=> d!69649 m!315113))

(declare-fun m!315115 () Bool)

(assert (=> b!204074 m!315115))

(assert (=> b!204074 m!315115))

(declare-fun m!315117 () Bool)

(assert (=> b!204074 m!315117))

(declare-fun m!315119 () Bool)

(assert (=> b!204072 m!315119))

(assert (=> b!204072 m!315043))

(declare-fun m!315121 () Bool)

(assert (=> b!204075 m!315121))

(assert (=> b!204075 m!315119))

(declare-fun m!315123 () Bool)

(assert (=> b!204073 m!315123))

(assert (=> b!204011 d!69649))

(declare-fun d!69651 () Bool)

(declare-fun res!170996 () Bool)

(declare-fun e!139792 () Bool)

(assert (=> d!69651 (=> (not res!170996) (not e!139792))))

(assert (=> d!69651 (= res!170996 (= (size!4541 (buf!5046 thiss!1204)) (size!4541 (buf!5046 (_2!9379 lt!318622)))))))

(assert (=> d!69651 (= (isPrefixOf!0 thiss!1204 (_2!9379 lt!318622)) e!139792)))

(declare-fun b!204082 () Bool)

(declare-fun res!170998 () Bool)

(assert (=> b!204082 (=> (not res!170998) (not e!139792))))

(assert (=> b!204082 (= res!170998 (bvsle (bitIndex!0 (size!4541 (buf!5046 thiss!1204)) (currentByte!9522 thiss!1204) (currentBit!9517 thiss!1204)) (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!318622))) (currentByte!9522 (_2!9379 lt!318622)) (currentBit!9517 (_2!9379 lt!318622)))))))

(declare-fun b!204083 () Bool)

(declare-fun e!139791 () Bool)

(assert (=> b!204083 (= e!139792 e!139791)))

(declare-fun res!170997 () Bool)

(assert (=> b!204083 (=> res!170997 e!139791)))

(assert (=> b!204083 (= res!170997 (= (size!4541 (buf!5046 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!204084 () Bool)

(declare-fun arrayBitRangesEq!0 (array!10327 array!10327 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!204084 (= e!139791 (arrayBitRangesEq!0 (buf!5046 thiss!1204) (buf!5046 (_2!9379 lt!318622)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4541 (buf!5046 thiss!1204)) (currentByte!9522 thiss!1204) (currentBit!9517 thiss!1204))))))

(assert (= (and d!69651 res!170996) b!204082))

(assert (= (and b!204082 res!170998) b!204083))

(assert (= (and b!204083 (not res!170997)) b!204084))

(assert (=> b!204082 m!315043))

(assert (=> b!204082 m!315041))

(assert (=> b!204084 m!315043))

(assert (=> b!204084 m!315043))

(declare-fun m!315125 () Bool)

(assert (=> b!204084 m!315125))

(assert (=> b!204016 d!69651))

(declare-fun d!69653 () Bool)

(assert (=> d!69653 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!4541 (buf!5046 thiss!1204))) ((_ sign_extend 32) (currentByte!9522 thiss!1204)) ((_ sign_extend 32) (currentBit!9517 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!4541 (buf!5046 thiss!1204))) ((_ sign_extend 32) (currentByte!9522 thiss!1204)) ((_ sign_extend 32) (currentBit!9517 thiss!1204))) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun bs!17154 () Bool)

(assert (= bs!17154 d!69653))

(assert (=> bs!17154 m!315109))

(assert (=> b!204015 d!69653))

(declare-fun d!69655 () Bool)

(declare-datatypes ((tuple2!17462 0))(
  ( (tuple2!17463 (_1!9383 Bool) (_2!9383 BitStream!8190)) )
))
(declare-fun lt!318692 () tuple2!17462)

(declare-fun readBit!0 (BitStream!8190) tuple2!17462)

(assert (=> d!69655 (= lt!318692 (readBit!0 (readerFrom!0 (_2!9379 lt!318622) (currentBit!9517 thiss!1204) (currentByte!9522 thiss!1204))))))

(assert (=> d!69655 (= (readBitPure!0 (readerFrom!0 (_2!9379 lt!318622) (currentBit!9517 thiss!1204) (currentByte!9522 thiss!1204))) (tuple2!17457 (_2!9383 lt!318692) (_1!9383 lt!318692)))))

(declare-fun bs!17155 () Bool)

(assert (= bs!17155 d!69655))

(assert (=> bs!17155 m!315067))

(declare-fun m!315127 () Bool)

(assert (=> bs!17155 m!315127))

(assert (=> b!204010 d!69655))

(declare-fun d!69657 () Bool)

(declare-fun e!139795 () Bool)

(assert (=> d!69657 e!139795))

(declare-fun res!171002 () Bool)

(assert (=> d!69657 (=> (not res!171002) (not e!139795))))

(assert (=> d!69657 (= res!171002 (invariant!0 (currentBit!9517 (_2!9379 lt!318622)) (currentByte!9522 (_2!9379 lt!318622)) (size!4541 (buf!5046 (_2!9379 lt!318622)))))))

(assert (=> d!69657 (= (readerFrom!0 (_2!9379 lt!318622) (currentBit!9517 thiss!1204) (currentByte!9522 thiss!1204)) (BitStream!8191 (buf!5046 (_2!9379 lt!318622)) (currentByte!9522 thiss!1204) (currentBit!9517 thiss!1204)))))

(declare-fun b!204087 () Bool)

(assert (=> b!204087 (= e!139795 (invariant!0 (currentBit!9517 thiss!1204) (currentByte!9522 thiss!1204) (size!4541 (buf!5046 (_2!9379 lt!318622)))))))

(assert (= (and d!69657 res!171002) b!204087))

(assert (=> d!69657 m!315107))

(declare-fun m!315129 () Bool)

(assert (=> b!204087 m!315129))

(assert (=> b!204010 d!69657))

(declare-fun d!69659 () Bool)

(assert (=> d!69659 (= (inv!12 thiss!1204) (invariant!0 (currentBit!9517 thiss!1204) (currentByte!9522 thiss!1204) (size!4541 (buf!5046 thiss!1204))))))

(declare-fun bs!17156 () Bool)

(assert (= bs!17156 d!69659))

(assert (=> bs!17156 m!315049))

(assert (=> start!43262 d!69659))

(declare-fun d!69661 () Bool)

(declare-fun e!139796 () Bool)

(assert (=> d!69661 e!139796))

(declare-fun res!171003 () Bool)

(assert (=> d!69661 (=> (not res!171003) (not e!139796))))

(declare-fun lt!318698 () (_ BitVec 64))

(declare-fun lt!318696 () (_ BitVec 64))

(declare-fun lt!318694 () (_ BitVec 64))

(assert (=> d!69661 (= res!171003 (= lt!318696 (bvsub lt!318698 lt!318694)))))

(assert (=> d!69661 (or (= (bvand lt!318698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318694 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318698 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318698 lt!318694) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69661 (= lt!318694 (remainingBits!0 ((_ sign_extend 32) (size!4541 (buf!5046 (_1!9380 lt!318624)))) ((_ sign_extend 32) (currentByte!9522 (_1!9380 lt!318624))) ((_ sign_extend 32) (currentBit!9517 (_1!9380 lt!318624)))))))

(declare-fun lt!318697 () (_ BitVec 64))

(declare-fun lt!318695 () (_ BitVec 64))

(assert (=> d!69661 (= lt!318698 (bvmul lt!318697 lt!318695))))

(assert (=> d!69661 (or (= lt!318697 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318695 (bvsdiv (bvmul lt!318697 lt!318695) lt!318697)))))

(assert (=> d!69661 (= lt!318695 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69661 (= lt!318697 ((_ sign_extend 32) (size!4541 (buf!5046 (_1!9380 lt!318624)))))))

(assert (=> d!69661 (= lt!318696 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9522 (_1!9380 lt!318624))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9517 (_1!9380 lt!318624)))))))

(assert (=> d!69661 (invariant!0 (currentBit!9517 (_1!9380 lt!318624)) (currentByte!9522 (_1!9380 lt!318624)) (size!4541 (buf!5046 (_1!9380 lt!318624))))))

(assert (=> d!69661 (= (bitIndex!0 (size!4541 (buf!5046 (_1!9380 lt!318624))) (currentByte!9522 (_1!9380 lt!318624)) (currentBit!9517 (_1!9380 lt!318624))) lt!318696)))

(declare-fun b!204088 () Bool)

(declare-fun res!171004 () Bool)

(assert (=> b!204088 (=> (not res!171004) (not e!139796))))

(assert (=> b!204088 (= res!171004 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318696))))

(declare-fun b!204089 () Bool)

(declare-fun lt!318693 () (_ BitVec 64))

(assert (=> b!204089 (= e!139796 (bvsle lt!318696 (bvmul lt!318693 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204089 (or (= lt!318693 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318693 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318693)))))

(assert (=> b!204089 (= lt!318693 ((_ sign_extend 32) (size!4541 (buf!5046 (_1!9380 lt!318624)))))))

(assert (= (and d!69661 res!171003) b!204088))

(assert (= (and b!204088 res!171004) b!204089))

(declare-fun m!315131 () Bool)

(assert (=> d!69661 m!315131))

(declare-fun m!315133 () Bool)

(assert (=> d!69661 m!315133))

(assert (=> b!204009 d!69661))

(declare-fun d!69663 () Bool)

(assert (=> d!69663 (= (array_inv!4282 (buf!5046 thiss!1204)) (bvsge (size!4541 (buf!5046 thiss!1204)) #b00000000000000000000000000000000))))

(assert (=> b!204013 d!69663))

(declare-fun d!69665 () Bool)

(assert (=> d!69665 (= (invariant!0 (currentBit!9517 (_2!9379 lt!318619)) (currentByte!9522 (_2!9379 lt!318619)) (size!4541 (buf!5046 (_2!9379 lt!318619)))) (and (bvsge (currentBit!9517 (_2!9379 lt!318619)) #b00000000000000000000000000000000) (bvslt (currentBit!9517 (_2!9379 lt!318619)) #b00000000000000000000000000001000) (bvsge (currentByte!9522 (_2!9379 lt!318619)) #b00000000000000000000000000000000) (or (bvslt (currentByte!9522 (_2!9379 lt!318619)) (size!4541 (buf!5046 (_2!9379 lt!318619)))) (and (= (currentBit!9517 (_2!9379 lt!318619)) #b00000000000000000000000000000000) (= (currentByte!9522 (_2!9379 lt!318619)) (size!4541 (buf!5046 (_2!9379 lt!318619))))))))))

(assert (=> b!204008 d!69665))

(declare-fun d!69667 () Bool)

(declare-fun e!139797 () Bool)

(assert (=> d!69667 e!139797))

(declare-fun res!171005 () Bool)

(assert (=> d!69667 (=> (not res!171005) (not e!139797))))

(declare-fun lt!318704 () (_ BitVec 64))

(declare-fun lt!318702 () (_ BitVec 64))

(declare-fun lt!318700 () (_ BitVec 64))

(assert (=> d!69667 (= res!171005 (= lt!318702 (bvsub lt!318704 lt!318700)))))

(assert (=> d!69667 (or (= (bvand lt!318704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!318700 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!318704 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!318704 lt!318700) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!69667 (= lt!318700 (remainingBits!0 ((_ sign_extend 32) (size!4541 (buf!5046 (_2!9379 lt!318619)))) ((_ sign_extend 32) (currentByte!9522 (_2!9379 lt!318619))) ((_ sign_extend 32) (currentBit!9517 (_2!9379 lt!318619)))))))

(declare-fun lt!318703 () (_ BitVec 64))

(declare-fun lt!318701 () (_ BitVec 64))

(assert (=> d!69667 (= lt!318704 (bvmul lt!318703 lt!318701))))

(assert (=> d!69667 (or (= lt!318703 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!318701 (bvsdiv (bvmul lt!318703 lt!318701) lt!318703)))))

(assert (=> d!69667 (= lt!318701 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!69667 (= lt!318703 ((_ sign_extend 32) (size!4541 (buf!5046 (_2!9379 lt!318619)))))))

(assert (=> d!69667 (= lt!318702 (bvadd (bvmul ((_ sign_extend 32) (currentByte!9522 (_2!9379 lt!318619))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!9517 (_2!9379 lt!318619)))))))

(assert (=> d!69667 (invariant!0 (currentBit!9517 (_2!9379 lt!318619)) (currentByte!9522 (_2!9379 lt!318619)) (size!4541 (buf!5046 (_2!9379 lt!318619))))))

(assert (=> d!69667 (= (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!318619))) (currentByte!9522 (_2!9379 lt!318619)) (currentBit!9517 (_2!9379 lt!318619))) lt!318702)))

(declare-fun b!204090 () Bool)

(declare-fun res!171006 () Bool)

(assert (=> b!204090 (=> (not res!171006) (not e!139797))))

(assert (=> b!204090 (= res!171006 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!318702))))

(declare-fun b!204091 () Bool)

(declare-fun lt!318699 () (_ BitVec 64))

(assert (=> b!204091 (= e!139797 (bvsle lt!318702 (bvmul lt!318699 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!204091 (or (= lt!318699 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!318699 #b0000000000000000000000000000000000000000000000000000000000001000) lt!318699)))))

(assert (=> b!204091 (= lt!318699 ((_ sign_extend 32) (size!4541 (buf!5046 (_2!9379 lt!318619)))))))

(assert (= (and d!69667 res!171005) b!204090))

(assert (= (and b!204090 res!171006) b!204091))

(declare-fun m!315135 () Bool)

(assert (=> d!69667 m!315135))

(assert (=> d!69667 m!315065))

(assert (=> b!204018 d!69667))

(declare-fun d!69669 () Bool)

(declare-fun res!171007 () Bool)

(declare-fun e!139799 () Bool)

(assert (=> d!69669 (=> (not res!171007) (not e!139799))))

(assert (=> d!69669 (= res!171007 (= (size!4541 (buf!5046 thiss!1204)) (size!4541 (buf!5046 (_2!9379 lt!318619)))))))

(assert (=> d!69669 (= (isPrefixOf!0 thiss!1204 (_2!9379 lt!318619)) e!139799)))

(declare-fun b!204092 () Bool)

(declare-fun res!171009 () Bool)

(assert (=> b!204092 (=> (not res!171009) (not e!139799))))

(assert (=> b!204092 (= res!171009 (bvsle (bitIndex!0 (size!4541 (buf!5046 thiss!1204)) (currentByte!9522 thiss!1204) (currentBit!9517 thiss!1204)) (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!318619))) (currentByte!9522 (_2!9379 lt!318619)) (currentBit!9517 (_2!9379 lt!318619)))))))

(declare-fun b!204093 () Bool)

(declare-fun e!139798 () Bool)

(assert (=> b!204093 (= e!139799 e!139798)))

(declare-fun res!171008 () Bool)

(assert (=> b!204093 (=> res!171008 e!139798)))

(assert (=> b!204093 (= res!171008 (= (size!4541 (buf!5046 thiss!1204)) #b00000000000000000000000000000000))))

(declare-fun b!204094 () Bool)

(assert (=> b!204094 (= e!139798 (arrayBitRangesEq!0 (buf!5046 thiss!1204) (buf!5046 (_2!9379 lt!318619)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!4541 (buf!5046 thiss!1204)) (currentByte!9522 thiss!1204) (currentBit!9517 thiss!1204))))))

(assert (= (and d!69669 res!171007) b!204092))

(assert (= (and b!204092 res!171009) b!204093))

(assert (= (and b!204093 (not res!171008)) b!204094))

(assert (=> b!204092 m!315043))

(assert (=> b!204092 m!315051))

(assert (=> b!204094 m!315043))

(assert (=> b!204094 m!315043))

(declare-fun m!315137 () Bool)

(assert (=> b!204094 m!315137))

(assert (=> b!204018 d!69669))

(declare-fun d!69671 () Bool)

(assert (=> d!69671 (isPrefixOf!0 thiss!1204 (_2!9379 lt!318619))))

(declare-fun lt!318707 () Unit!14540)

(declare-fun choose!30 (BitStream!8190 BitStream!8190 BitStream!8190) Unit!14540)

(assert (=> d!69671 (= lt!318707 (choose!30 thiss!1204 (_2!9379 lt!318622) (_2!9379 lt!318619)))))

(assert (=> d!69671 (isPrefixOf!0 thiss!1204 (_2!9379 lt!318622))))

(assert (=> d!69671 (= (lemmaIsPrefixTransitive!0 thiss!1204 (_2!9379 lt!318622) (_2!9379 lt!318619)) lt!318707)))

(declare-fun bs!17157 () Bool)

(assert (= bs!17157 d!69671))

(assert (=> bs!17157 m!315053))

(declare-fun m!315139 () Bool)

(assert (=> bs!17157 m!315139))

(assert (=> bs!17157 m!315071))

(assert (=> b!204018 d!69671))

(declare-fun b!204214 () Bool)

(declare-fun e!139876 () Bool)

(declare-fun e!139874 () Bool)

(assert (=> b!204214 (= e!139876 e!139874)))

(declare-fun res!171115 () Bool)

(assert (=> b!204214 (=> (not res!171115) (not e!139874))))

(declare-datatypes ((tuple2!17464 0))(
  ( (tuple2!17465 (_1!9384 BitStream!8190) (_2!9384 (_ BitVec 64))) )
))
(declare-fun lt!319062 () tuple2!17464)

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!204214 (= res!171115 (= (_2!9384 lt!319062) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-datatypes ((tuple2!17466 0))(
  ( (tuple2!17467 (_1!9385 BitStream!8190) (_2!9385 BitStream!8190)) )
))
(declare-fun lt!319019 () tuple2!17466)

(declare-fun readNBitsLSBFirstsLoopPure!0 (BitStream!8190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!17464)

(assert (=> b!204214 (= lt!319062 (readNBitsLSBFirstsLoopPure!0 (_1!9385 lt!319019) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun lt!319020 () Unit!14540)

(declare-fun lt!319026 () Unit!14540)

(assert (=> b!204214 (= lt!319020 lt!319026)))

(declare-fun lt!319028 () tuple2!17454)

(declare-fun lt!319040 () (_ BitVec 64))

(assert (=> b!204214 (validate_offset_bits!1 ((_ sign_extend 32) (size!4541 (buf!5046 (_2!9379 lt!319028)))) ((_ sign_extend 32) (currentByte!9522 (_2!9379 lt!318622))) ((_ sign_extend 32) (currentBit!9517 (_2!9379 lt!318622))) lt!319040)))

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!8190 array!10327 (_ BitVec 64)) Unit!14540)

(assert (=> b!204214 (= lt!319026 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9379 lt!318622) (buf!5046 (_2!9379 lt!319028)) lt!319040))))

(declare-fun e!139873 () Bool)

(assert (=> b!204214 e!139873))

(declare-fun res!171125 () Bool)

(assert (=> b!204214 (=> (not res!171125) (not e!139873))))

(assert (=> b!204214 (= res!171125 (and (= (size!4541 (buf!5046 (_2!9379 lt!318622))) (size!4541 (buf!5046 (_2!9379 lt!319028)))) (bvsge lt!319040 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204214 (= lt!319040 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(assert (=> b!204214 (or (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!590) #b10000000000000000000000000000000)) (= (bvand nBits!348 #b10000000000000000000000000000000) (bvand (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b10000000000000000000000000000000)))))

(declare-fun reader!0 (BitStream!8190 BitStream!8190) tuple2!17466)

(assert (=> b!204214 (= lt!319019 (reader!0 (_2!9379 lt!318622) (_2!9379 lt!319028)))))

(declare-fun b!204215 () Bool)

(declare-fun e!139872 () (_ BitVec 64))

(assert (=> b!204215 (= e!139872 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun b!204216 () Bool)

(declare-fun e!139877 () Bool)

(declare-fun lt!319041 () tuple2!17456)

(declare-fun lt!319015 () tuple2!17456)

(assert (=> b!204216 (= e!139877 (= (_2!9380 lt!319041) (_2!9380 lt!319015)))))

(declare-fun b!204217 () Bool)

(declare-fun res!171119 () Bool)

(assert (=> b!204217 (=> (not res!171119) (not e!139876))))

(declare-fun lt!319039 () (_ BitVec 64))

(declare-fun lt!319057 () (_ BitVec 64))

(assert (=> b!204217 (= res!171119 (= (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!319028))) (currentByte!9522 (_2!9379 lt!319028)) (currentBit!9517 (_2!9379 lt!319028))) (bvsub lt!319057 lt!319039)))))

(assert (=> b!204217 (or (= (bvand lt!319057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319039 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!319057 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!319057 lt!319039) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204217 (= lt!319039 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))))

(declare-fun lt!319043 () (_ BitVec 64))

(declare-fun lt!319036 () (_ BitVec 64))

(assert (=> b!204217 (= lt!319057 (bvadd lt!319043 lt!319036))))

(assert (=> b!204217 (or (not (= (bvand lt!319043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!319036 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!319043 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!319043 lt!319036) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204217 (= lt!319036 ((_ sign_extend 32) nBits!348))))

(assert (=> b!204217 (= lt!319043 (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!318622))) (currentByte!9522 (_2!9379 lt!318622)) (currentBit!9517 (_2!9379 lt!318622))))))

(declare-fun b!204218 () Bool)

(assert (=> b!204218 (= e!139874 (= (_1!9384 lt!319062) (_2!9385 lt!319019)))))

(declare-fun d!69673 () Bool)

(assert (=> d!69673 e!139876))

(declare-fun res!171124 () Bool)

(assert (=> d!69673 (=> (not res!171124) (not e!139876))))

(assert (=> d!69673 (= res!171124 (invariant!0 (currentBit!9517 (_2!9379 lt!319028)) (currentByte!9522 (_2!9379 lt!319028)) (size!4541 (buf!5046 (_2!9379 lt!319028)))))))

(declare-fun e!139870 () tuple2!17454)

(assert (=> d!69673 (= lt!319028 e!139870)))

(declare-fun c!10124 () Bool)

(assert (=> d!69673 (= c!10124 (= (bvadd #b00000000000000000000000000000001 i!590) nBits!348))))

(assert (=> d!69673 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000))))

(assert (=> d!69673 (= (appendBitsLSBFirstLoopTR!0 (_2!9379 lt!318622) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) lt!319028)))

(declare-fun call!3230 () Bool)

(declare-fun bm!3227 () Bool)

(declare-fun lt!319048 () tuple2!17454)

(assert (=> bm!3227 (= call!3230 (isPrefixOf!0 (_2!9379 lt!318622) (ite c!10124 (_2!9379 lt!318622) (_2!9379 lt!319048))))))

(declare-fun b!204219 () Bool)

(declare-fun lt!319059 () tuple2!17456)

(declare-fun lt!319027 () tuple2!17454)

(assert (=> b!204219 (= lt!319059 (readBitPure!0 (readerFrom!0 (_2!9379 lt!319027) (currentBit!9517 (_2!9379 lt!318622)) (currentByte!9522 (_2!9379 lt!318622)))))))

(declare-fun lt!319044 () Bool)

(declare-fun res!171118 () Bool)

(assert (=> b!204219 (= res!171118 (and (= (_2!9380 lt!319059) lt!319044) (= (_1!9380 lt!319059) (_2!9379 lt!319027))))))

(declare-fun e!139875 () Bool)

(assert (=> b!204219 (=> (not res!171118) (not e!139875))))

(declare-fun e!139871 () Bool)

(assert (=> b!204219 (= e!139871 e!139875)))

(declare-fun b!204220 () Bool)

(assert (=> b!204220 (= e!139872 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!204221 () Bool)

(assert (=> b!204221 (= e!139870 (tuple2!17455 (_1!9379 lt!319048) (_2!9379 lt!319048)))))

(assert (=> b!204221 (= lt!319044 (not (= (bvand v!189 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!204221 (= lt!319027 (appendBit!0 (_2!9379 lt!318622) lt!319044))))

(declare-fun res!171121 () Bool)

(assert (=> b!204221 (= res!171121 (= (size!4541 (buf!5046 (_2!9379 lt!318622))) (size!4541 (buf!5046 (_2!9379 lt!319027)))))))

(assert (=> b!204221 (=> (not res!171121) (not e!139871))))

(assert (=> b!204221 e!139871))

(declare-fun lt!319052 () tuple2!17454)

(assert (=> b!204221 (= lt!319052 lt!319027)))

(assert (=> b!204221 (= lt!319048 (appendBitsLSBFirstLoopTR!0 (_2!9379 lt!319052) v!189 nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001)))))

(declare-fun lt!319064 () Unit!14540)

(assert (=> b!204221 (= lt!319064 (lemmaIsPrefixTransitive!0 (_2!9379 lt!318622) (_2!9379 lt!319052) (_2!9379 lt!319048)))))

(assert (=> b!204221 call!3230))

(declare-fun lt!319056 () Unit!14540)

(assert (=> b!204221 (= lt!319056 lt!319064)))

(assert (=> b!204221 (invariant!0 (currentBit!9517 (_2!9379 lt!318622)) (currentByte!9522 (_2!9379 lt!318622)) (size!4541 (buf!5046 (_2!9379 lt!319052))))))

(declare-fun lt!319045 () BitStream!8190)

(assert (=> b!204221 (= lt!319045 (BitStream!8191 (buf!5046 (_2!9379 lt!319052)) (currentByte!9522 (_2!9379 lt!318622)) (currentBit!9517 (_2!9379 lt!318622))))))

(assert (=> b!204221 (invariant!0 (currentBit!9517 lt!319045) (currentByte!9522 lt!319045) (size!4541 (buf!5046 (_2!9379 lt!319048))))))

(declare-fun lt!319021 () BitStream!8190)

(assert (=> b!204221 (= lt!319021 (BitStream!8191 (buf!5046 (_2!9379 lt!319048)) (currentByte!9522 lt!319045) (currentBit!9517 lt!319045)))))

(assert (=> b!204221 (= lt!319041 (readBitPure!0 lt!319045))))

(assert (=> b!204221 (= lt!319015 (readBitPure!0 lt!319021))))

(declare-fun lt!319046 () Unit!14540)

(declare-fun readBitPrefixLemma!0 (BitStream!8190 BitStream!8190) Unit!14540)

(assert (=> b!204221 (= lt!319046 (readBitPrefixLemma!0 lt!319045 (_2!9379 lt!319048)))))

(declare-fun res!171122 () Bool)

(assert (=> b!204221 (= res!171122 (= (bitIndex!0 (size!4541 (buf!5046 (_1!9380 lt!319041))) (currentByte!9522 (_1!9380 lt!319041)) (currentBit!9517 (_1!9380 lt!319041))) (bitIndex!0 (size!4541 (buf!5046 (_1!9380 lt!319015))) (currentByte!9522 (_1!9380 lt!319015)) (currentBit!9517 (_1!9380 lt!319015)))))))

(assert (=> b!204221 (=> (not res!171122) (not e!139877))))

(assert (=> b!204221 e!139877))

(declare-fun lt!319035 () Unit!14540)

(assert (=> b!204221 (= lt!319035 lt!319046)))

(declare-fun lt!319061 () tuple2!17466)

(assert (=> b!204221 (= lt!319061 (reader!0 (_2!9379 lt!318622) (_2!9379 lt!319048)))))

(declare-fun lt!319049 () tuple2!17466)

(assert (=> b!204221 (= lt!319049 (reader!0 (_2!9379 lt!319052) (_2!9379 lt!319048)))))

(declare-fun lt!319022 () tuple2!17456)

(assert (=> b!204221 (= lt!319022 (readBitPure!0 (_1!9385 lt!319061)))))

(assert (=> b!204221 (= (_2!9380 lt!319022) lt!319044)))

(declare-fun lt!319012 () Unit!14540)

(declare-fun Unit!14544 () Unit!14540)

(assert (=> b!204221 (= lt!319012 Unit!14544)))

(declare-fun lt!319030 () (_ BitVec 64))

(assert (=> b!204221 (= lt!319030 (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319016 () (_ BitVec 64))

(assert (=> b!204221 (= lt!319016 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319051 () Unit!14540)

(assert (=> b!204221 (= lt!319051 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9379 lt!318622) (buf!5046 (_2!9379 lt!319048)) lt!319016))))

(assert (=> b!204221 (validate_offset_bits!1 ((_ sign_extend 32) (size!4541 (buf!5046 (_2!9379 lt!319048)))) ((_ sign_extend 32) (currentByte!9522 (_2!9379 lt!318622))) ((_ sign_extend 32) (currentBit!9517 (_2!9379 lt!318622))) lt!319016)))

(declare-fun lt!319032 () Unit!14540)

(assert (=> b!204221 (= lt!319032 lt!319051)))

(declare-fun lt!319053 () tuple2!17464)

(assert (=> b!204221 (= lt!319053 (readNBitsLSBFirstsLoopPure!0 (_1!9385 lt!319061) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!319030))))

(declare-fun lt!319038 () (_ BitVec 64))

(assert (=> b!204221 (= lt!319038 ((_ sign_extend 32) (bvsub (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590)) #b00000000000000000000000000000001)))))

(declare-fun lt!319010 () Unit!14540)

(assert (=> b!204221 (= lt!319010 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9379 lt!319052) (buf!5046 (_2!9379 lt!319048)) lt!319038))))

(assert (=> b!204221 (validate_offset_bits!1 ((_ sign_extend 32) (size!4541 (buf!5046 (_2!9379 lt!319048)))) ((_ sign_extend 32) (currentByte!9522 (_2!9379 lt!319052))) ((_ sign_extend 32) (currentBit!9517 (_2!9379 lt!319052))) lt!319038)))

(declare-fun lt!319047 () Unit!14540)

(assert (=> b!204221 (= lt!319047 lt!319010)))

(declare-fun lt!319065 () tuple2!17464)

(assert (=> b!204221 (= lt!319065 (readNBitsLSBFirstsLoopPure!0 (_1!9385 lt!319049) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!319030 (ite (_2!9380 lt!319022) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!319031 () tuple2!17464)

(assert (=> b!204221 (= lt!319031 (readNBitsLSBFirstsLoopPure!0 (_1!9385 lt!319061) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!319030))))

(declare-fun c!10125 () Bool)

(assert (=> b!204221 (= c!10125 (_2!9380 (readBitPure!0 (_1!9385 lt!319061))))))

(declare-fun lt!319034 () tuple2!17464)

(declare-fun withMovedBitIndex!0 (BitStream!8190 (_ BitVec 64)) BitStream!8190)

(assert (=> b!204221 (= lt!319034 (readNBitsLSBFirstsLoopPure!0 (withMovedBitIndex!0 (_1!9385 lt!319061) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!348 (bvadd #b00000000000000000000000000000001 i!590 #b00000000000000000000000000000001) (bvor lt!319030 e!139872)))))

(declare-fun lt!319018 () Unit!14540)

(declare-fun lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (BitStream!8190 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!14540)

(assert (=> b!204221 (= lt!319018 (lemmaReadNBitsLSBFirstsLoopIsCorrect!0 (_1!9385 lt!319061) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) lt!319030))))

(assert (=> b!204221 (and (= (_2!9384 lt!319031) (_2!9384 lt!319034)) (= (_1!9384 lt!319031) (_1!9384 lt!319034)))))

(declare-fun lt!319011 () Unit!14540)

(assert (=> b!204221 (= lt!319011 lt!319018)))

(assert (=> b!204221 (= (_1!9385 lt!319061) (withMovedBitIndex!0 (_2!9385 lt!319061) (bvsub (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!318622))) (currentByte!9522 (_2!9379 lt!318622)) (currentBit!9517 (_2!9379 lt!318622))) (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!319048))) (currentByte!9522 (_2!9379 lt!319048)) (currentBit!9517 (_2!9379 lt!319048))))))))

(declare-fun lt!319033 () Unit!14540)

(declare-fun Unit!14545 () Unit!14540)

(assert (=> b!204221 (= lt!319033 Unit!14545)))

(assert (=> b!204221 (= (_1!9385 lt!319049) (withMovedBitIndex!0 (_2!9385 lt!319049) (bvsub (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!319052))) (currentByte!9522 (_2!9379 lt!319052)) (currentBit!9517 (_2!9379 lt!319052))) (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!319048))) (currentByte!9522 (_2!9379 lt!319048)) (currentBit!9517 (_2!9379 lt!319048))))))))

(declare-fun lt!319042 () Unit!14540)

(declare-fun Unit!14546 () Unit!14540)

(assert (=> b!204221 (= lt!319042 Unit!14546)))

(assert (=> b!204221 (= (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!318622))) (currentByte!9522 (_2!9379 lt!318622)) (currentBit!9517 (_2!9379 lt!318622))) (bvsub (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!319052))) (currentByte!9522 (_2!9379 lt!319052)) (currentBit!9517 (_2!9379 lt!319052))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!319063 () Unit!14540)

(declare-fun Unit!14547 () Unit!14540)

(assert (=> b!204221 (= lt!319063 Unit!14547)))

(assert (=> b!204221 (= (_2!9384 lt!319053) (_2!9384 lt!319065))))

(declare-fun lt!319037 () Unit!14540)

(declare-fun Unit!14548 () Unit!14540)

(assert (=> b!204221 (= lt!319037 Unit!14548)))

(assert (=> b!204221 (invariant!0 (currentBit!9517 (_2!9379 lt!319048)) (currentByte!9522 (_2!9379 lt!319048)) (size!4541 (buf!5046 (_2!9379 lt!319048))))))

(declare-fun lt!319029 () Unit!14540)

(declare-fun Unit!14549 () Unit!14540)

(assert (=> b!204221 (= lt!319029 Unit!14549)))

(assert (=> b!204221 (= (size!4541 (buf!5046 (_2!9379 lt!318622))) (size!4541 (buf!5046 (_2!9379 lt!319048))))))

(declare-fun lt!319060 () Unit!14540)

(declare-fun Unit!14550 () Unit!14540)

(assert (=> b!204221 (= lt!319060 Unit!14550)))

(assert (=> b!204221 (= (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!319048))) (currentByte!9522 (_2!9379 lt!319048)) (currentBit!9517 (_2!9379 lt!319048))) (bvsub (bvadd (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!318622))) (currentByte!9522 (_2!9379 lt!318622)) (currentBit!9517 (_2!9379 lt!318622))) ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319013 () Unit!14540)

(declare-fun Unit!14551 () Unit!14540)

(assert (=> b!204221 (= lt!319013 Unit!14551)))

(declare-fun lt!319024 () Unit!14540)

(declare-fun Unit!14552 () Unit!14540)

(assert (=> b!204221 (= lt!319024 Unit!14552)))

(declare-fun lt!319023 () tuple2!17466)

(assert (=> b!204221 (= lt!319023 (reader!0 (_2!9379 lt!318622) (_2!9379 lt!319048)))))

(declare-fun lt!319017 () (_ BitVec 64))

(assert (=> b!204221 (= lt!319017 ((_ sign_extend 32) (bvsub nBits!348 (bvadd #b00000000000000000000000000000001 i!590))))))

(declare-fun lt!319054 () Unit!14540)

(assert (=> b!204221 (= lt!319054 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!9379 lt!318622) (buf!5046 (_2!9379 lt!319048)) lt!319017))))

(assert (=> b!204221 (validate_offset_bits!1 ((_ sign_extend 32) (size!4541 (buf!5046 (_2!9379 lt!319048)))) ((_ sign_extend 32) (currentByte!9522 (_2!9379 lt!318622))) ((_ sign_extend 32) (currentBit!9517 (_2!9379 lt!318622))) lt!319017)))

(declare-fun lt!319050 () Unit!14540)

(assert (=> b!204221 (= lt!319050 lt!319054)))

(declare-fun lt!319025 () tuple2!17464)

(assert (=> b!204221 (= lt!319025 (readNBitsLSBFirstsLoopPure!0 (_1!9385 lt!319023) nBits!348 (bvadd #b00000000000000000000000000000001 i!590) (bvand v!189 (onesLSBLong!0 (bvadd #b00000000000000000000000000000001 i!590)))))))

(declare-fun res!171120 () Bool)

(assert (=> b!204221 (= res!171120 (= (_2!9384 lt!319025) (bvand v!189 (onesLSBLong!0 nBits!348))))))

(declare-fun e!139878 () Bool)

(assert (=> b!204221 (=> (not res!171120) (not e!139878))))

(assert (=> b!204221 e!139878))

(declare-fun lt!319014 () Unit!14540)

(declare-fun Unit!14553 () Unit!14540)

(assert (=> b!204221 (= lt!319014 Unit!14553)))

(declare-fun b!204222 () Bool)

(declare-fun res!171116 () Bool)

(assert (=> b!204222 (=> (not res!171116) (not e!139876))))

(assert (=> b!204222 (= res!171116 (isPrefixOf!0 (_2!9379 lt!318622) (_2!9379 lt!319028)))))

(declare-fun b!204223 () Bool)

(assert (=> b!204223 (= e!139875 (= (bitIndex!0 (size!4541 (buf!5046 (_1!9380 lt!319059))) (currentByte!9522 (_1!9380 lt!319059)) (currentBit!9517 (_1!9380 lt!319059))) (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!319027))) (currentByte!9522 (_2!9379 lt!319027)) (currentBit!9517 (_2!9379 lt!319027)))))))

(declare-fun b!204224 () Bool)

(declare-fun res!171123 () Bool)

(assert (=> b!204224 (= res!171123 (isPrefixOf!0 (_2!9379 lt!318622) (_2!9379 lt!319027)))))

(assert (=> b!204224 (=> (not res!171123) (not e!139871))))

(declare-fun b!204225 () Bool)

(declare-fun res!171117 () Bool)

(assert (=> b!204225 (=> (not res!171117) (not e!139876))))

(assert (=> b!204225 (= res!171117 (= (size!4541 (buf!5046 (_2!9379 lt!318622))) (size!4541 (buf!5046 (_2!9379 lt!319028)))))))

(declare-fun b!204226 () Bool)

(assert (=> b!204226 (= e!139873 (validate_offset_bits!1 ((_ sign_extend 32) (size!4541 (buf!5046 (_2!9379 lt!318622)))) ((_ sign_extend 32) (currentByte!9522 (_2!9379 lt!318622))) ((_ sign_extend 32) (currentBit!9517 (_2!9379 lt!318622))) lt!319040))))

(declare-fun b!204227 () Bool)

(declare-fun res!171114 () Bool)

(assert (=> b!204227 (= res!171114 (= (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!319027))) (currentByte!9522 (_2!9379 lt!319027)) (currentBit!9517 (_2!9379 lt!319027))) (bvadd (bitIndex!0 (size!4541 (buf!5046 (_2!9379 lt!318622))) (currentByte!9522 (_2!9379 lt!318622)) (currentBit!9517 (_2!9379 lt!318622))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!204227 (=> (not res!171114) (not e!139871))))

(declare-fun b!204228 () Bool)

(assert (=> b!204228 (= e!139878 (= (_1!9384 lt!319025) (_2!9385 lt!319023)))))

(declare-fun b!204229 () Bool)

(declare-fun Unit!14554 () Unit!14540)

(assert (=> b!204229 (= e!139870 (tuple2!17455 Unit!14554 (_2!9379 lt!318622)))))

(declare-fun lt!319058 () Unit!14540)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8190) Unit!14540)

(assert (=> b!204229 (= lt!319058 (lemmaIsPrefixRefl!0 (_2!9379 lt!318622)))))

(assert (=> b!204229 call!3230))

(declare-fun lt!319055 () Unit!14540)

(assert (=> b!204229 (= lt!319055 lt!319058)))

(assert (= (and d!69673 c!10124) b!204229))

(assert (= (and d!69673 (not c!10124)) b!204221))

(assert (= (and b!204221 res!171121) b!204227))

(assert (= (and b!204227 res!171114) b!204224))

(assert (= (and b!204224 res!171123) b!204219))

(assert (= (and b!204219 res!171118) b!204223))

(assert (= (and b!204221 res!171122) b!204216))

(assert (= (and b!204221 c!10125) b!204215))

(assert (= (and b!204221 (not c!10125)) b!204220))

(assert (= (and b!204221 res!171120) b!204228))

(assert (= (or b!204229 b!204221) bm!3227))

(assert (= (and d!69673 res!171124) b!204225))

(assert (= (and b!204225 res!171117) b!204217))

(assert (= (and b!204217 res!171119) b!204222))

(assert (= (and b!204222 res!171116) b!204214))

(assert (= (and b!204214 res!171125) b!204226))

(assert (= (and b!204214 res!171115) b!204218))

(declare-fun m!315199 () Bool)

(assert (=> b!204222 m!315199))

(declare-fun m!315201 () Bool)

(assert (=> bm!3227 m!315201))

(declare-fun m!315203 () Bool)

(assert (=> b!204214 m!315203))

(declare-fun m!315205 () Bool)

(assert (=> b!204214 m!315205))

(declare-fun m!315207 () Bool)

(assert (=> b!204214 m!315207))

(declare-fun m!315209 () Bool)

(assert (=> b!204214 m!315209))

(declare-fun m!315211 () Bool)

(assert (=> b!204214 m!315211))

(declare-fun m!315213 () Bool)

(assert (=> b!204214 m!315213))

(declare-fun m!315215 () Bool)

(assert (=> b!204223 m!315215))

(declare-fun m!315217 () Bool)

(assert (=> b!204223 m!315217))

(declare-fun m!315219 () Bool)

(assert (=> b!204217 m!315219))

(assert (=> b!204217 m!315041))

(declare-fun m!315221 () Bool)

(assert (=> b!204226 m!315221))

(declare-fun m!315223 () Bool)

(assert (=> d!69673 m!315223))

(declare-fun m!315225 () Bool)

(assert (=> b!204224 m!315225))

(assert (=> b!204227 m!315217))

(assert (=> b!204227 m!315041))

(declare-fun m!315227 () Bool)

(assert (=> b!204219 m!315227))

(assert (=> b!204219 m!315227))

(declare-fun m!315229 () Bool)

(assert (=> b!204219 m!315229))

(assert (=> b!204221 m!315203))

(declare-fun m!315231 () Bool)

(assert (=> b!204221 m!315231))

(declare-fun m!315233 () Bool)

(assert (=> b!204221 m!315233))

(declare-fun m!315235 () Bool)

(assert (=> b!204221 m!315235))

(declare-fun m!315237 () Bool)

(assert (=> b!204221 m!315237))

(declare-fun m!315239 () Bool)

(assert (=> b!204221 m!315239))

(declare-fun m!315241 () Bool)

(assert (=> b!204221 m!315241))

(assert (=> b!204221 m!315041))

(assert (=> b!204221 m!315211))

(declare-fun m!315243 () Bool)

(assert (=> b!204221 m!315243))

(declare-fun m!315245 () Bool)

(assert (=> b!204221 m!315245))

(declare-fun m!315247 () Bool)

(assert (=> b!204221 m!315247))

(declare-fun m!315249 () Bool)

(assert (=> b!204221 m!315249))

(declare-fun m!315251 () Bool)

(assert (=> b!204221 m!315251))

(declare-fun m!315253 () Bool)

(assert (=> b!204221 m!315253))

(declare-fun m!315255 () Bool)

(assert (=> b!204221 m!315255))

(declare-fun m!315257 () Bool)

(assert (=> b!204221 m!315257))

(declare-fun m!315259 () Bool)

(assert (=> b!204221 m!315259))

(declare-fun m!315261 () Bool)

(assert (=> b!204221 m!315261))

(declare-fun m!315263 () Bool)

(assert (=> b!204221 m!315263))

(declare-fun m!315265 () Bool)

(assert (=> b!204221 m!315265))

(declare-fun m!315267 () Bool)

(assert (=> b!204221 m!315267))

(declare-fun m!315269 () Bool)

(assert (=> b!204221 m!315269))

(declare-fun m!315271 () Bool)

(assert (=> b!204221 m!315271))

(declare-fun m!315273 () Bool)

(assert (=> b!204221 m!315273))

(declare-fun m!315275 () Bool)

(assert (=> b!204221 m!315275))

(declare-fun m!315277 () Bool)

(assert (=> b!204221 m!315277))

(declare-fun m!315279 () Bool)

(assert (=> b!204221 m!315279))

(declare-fun m!315281 () Bool)

(assert (=> b!204221 m!315281))

(declare-fun m!315283 () Bool)

(assert (=> b!204221 m!315283))

(assert (=> b!204221 m!315233))

(declare-fun m!315285 () Bool)

(assert (=> b!204221 m!315285))

(declare-fun m!315287 () Bool)

(assert (=> b!204221 m!315287))

(declare-fun m!315289 () Bool)

(assert (=> b!204221 m!315289))

(declare-fun m!315291 () Bool)

(assert (=> b!204229 m!315291))

(assert (=> b!204018 d!69673))

(declare-fun d!69731 () Bool)

(assert (=> d!69731 (= (invariant!0 (currentBit!9517 thiss!1204) (currentByte!9522 thiss!1204) (size!4541 (buf!5046 thiss!1204))) (and (bvsge (currentBit!9517 thiss!1204) #b00000000000000000000000000000000) (bvslt (currentBit!9517 thiss!1204) #b00000000000000000000000000001000) (bvsge (currentByte!9522 thiss!1204) #b00000000000000000000000000000000) (or (bvslt (currentByte!9522 thiss!1204) (size!4541 (buf!5046 thiss!1204))) (and (= (currentBit!9517 thiss!1204) #b00000000000000000000000000000000) (= (currentByte!9522 thiss!1204) (size!4541 (buf!5046 thiss!1204)))))))))

(assert (=> b!204017 d!69731))

(assert (=> b!204012 d!69645))

(assert (=> b!204012 d!69647))

(check-sat (not b!204084) (not b!204224) (not b!204092) (not d!69671) (not d!69661) (not d!69667) (not b!204227) (not b!204226) (not bm!3227) (not b!204082) (not d!69647) (not b!204219) (not d!69649) (not d!69673) (not d!69657) (not b!204221) (not b!204075) (not b!204229) (not b!204087) (not b!204072) (not b!204094) (not b!204073) (not b!204222) (not d!69655) (not b!204223) (not b!204214) (not d!69645) (not b!204217) (not d!69653) (not b!204074) (not d!69659))
