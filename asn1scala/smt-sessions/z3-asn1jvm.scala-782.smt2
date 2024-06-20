; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!22454 () Bool)

(assert start!22454)

(declare-fun b!113561 () Bool)

(declare-fun res!93794 () Bool)

(declare-fun e!74500 () Bool)

(assert (=> b!113561 (=> (not res!93794) (not e!74500))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!113561 (= res!93794 (bvslt i!615 nBits!396))))

(declare-fun b!113562 () Bool)

(declare-fun e!74501 () Bool)

(declare-fun e!74499 () Bool)

(assert (=> b!113562 (= e!74501 e!74499)))

(declare-fun res!93793 () Bool)

(assert (=> b!113562 (=> (not res!93793) (not e!74499))))

(declare-fun lt!172600 () (_ BitVec 64))

(declare-fun lt!172595 () (_ BitVec 64))

(assert (=> b!113562 (= res!93793 (= lt!172600 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!172595)))))

(declare-datatypes ((array!5161 0))(
  ( (array!5162 (arr!2938 (Array (_ BitVec 32) (_ BitVec 8))) (size!2345 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4164 0))(
  ( (BitStream!4165 (buf!2753 array!5161) (currentByte!5339 (_ BitVec 32)) (currentBit!5334 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!6975 0))(
  ( (Unit!6976) )
))
(declare-datatypes ((tuple2!9358 0))(
  ( (tuple2!9359 (_1!4941 Unit!6975) (_2!4941 BitStream!4164)) )
))
(declare-fun lt!172596 () tuple2!9358)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113562 (= lt!172600 (bitIndex!0 (size!2345 (buf!2753 (_2!4941 lt!172596))) (currentByte!5339 (_2!4941 lt!172596)) (currentBit!5334 (_2!4941 lt!172596))))))

(declare-fun thiss!1305 () BitStream!4164)

(assert (=> b!113562 (= lt!172595 (bitIndex!0 (size!2345 (buf!2753 thiss!1305)) (currentByte!5339 thiss!1305) (currentBit!5334 thiss!1305)))))

(declare-fun b!113563 () Bool)

(declare-fun e!74502 () Bool)

(declare-datatypes ((tuple2!9360 0))(
  ( (tuple2!9361 (_1!4942 BitStream!4164) (_2!4942 Bool)) )
))
(declare-fun lt!172598 () tuple2!9360)

(assert (=> b!113563 (= e!74502 (= (bitIndex!0 (size!2345 (buf!2753 (_1!4942 lt!172598))) (currentByte!5339 (_1!4942 lt!172598)) (currentBit!5334 (_1!4942 lt!172598))) lt!172600))))

(declare-fun b!113564 () Bool)

(declare-fun e!74497 () Bool)

(declare-fun array_inv!2147 (array!5161) Bool)

(assert (=> b!113564 (= e!74497 (array_inv!2147 (buf!2753 thiss!1305)))))

(declare-fun b!113565 () Bool)

(assert (=> b!113565 (= e!74500 (not true))))

(declare-fun lt!172599 () tuple2!9358)

(declare-fun isPrefixOf!0 (BitStream!4164 BitStream!4164) Bool)

(assert (=> b!113565 (isPrefixOf!0 thiss!1305 (_2!4941 lt!172599))))

(declare-fun lt!172597 () Unit!6975)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4164 BitStream!4164 BitStream!4164) Unit!6975)

(assert (=> b!113565 (= lt!172597 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4941 lt!172596) (_2!4941 lt!172599)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4164 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9358)

(assert (=> b!113565 (= lt!172599 (appendNLeastSignificantBitsLoop!0 (_2!4941 lt!172596) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(assert (=> b!113565 e!74501))

(declare-fun res!93796 () Bool)

(assert (=> b!113565 (=> (not res!93796) (not e!74501))))

(assert (=> b!113565 (= res!93796 (= (size!2345 (buf!2753 thiss!1305)) (size!2345 (buf!2753 (_2!4941 lt!172596)))))))

(declare-fun lt!172601 () Bool)

(declare-fun appendBit!0 (BitStream!4164 Bool) tuple2!9358)

(assert (=> b!113565 (= lt!172596 (appendBit!0 thiss!1305 lt!172601))))

(assert (=> b!113565 (= lt!172601 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113566 () Bool)

(declare-fun res!93792 () Bool)

(assert (=> b!113566 (=> (not res!93792) (not e!74500))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113566 (= res!93792 (validate_offset_bits!1 ((_ sign_extend 32) (size!2345 (buf!2753 thiss!1305))) ((_ sign_extend 32) (currentByte!5339 thiss!1305)) ((_ sign_extend 32) (currentBit!5334 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun res!93790 () Bool)

(assert (=> start!22454 (=> (not res!93790) (not e!74500))))

(assert (=> start!22454 (= res!93790 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22454 e!74500))

(assert (=> start!22454 true))

(declare-fun inv!12 (BitStream!4164) Bool)

(assert (=> start!22454 (and (inv!12 thiss!1305) e!74497)))

(declare-fun b!113567 () Bool)

(declare-fun res!93791 () Bool)

(assert (=> b!113567 (=> (not res!93791) (not e!74499))))

(assert (=> b!113567 (= res!93791 (isPrefixOf!0 thiss!1305 (_2!4941 lt!172596)))))

(declare-fun b!113568 () Bool)

(assert (=> b!113568 (= e!74499 e!74502)))

(declare-fun res!93795 () Bool)

(assert (=> b!113568 (=> (not res!93795) (not e!74502))))

(assert (=> b!113568 (= res!93795 (and (= (_2!4942 lt!172598) lt!172601) (= (_1!4942 lt!172598) (_2!4941 lt!172596))))))

(declare-fun readBitPure!0 (BitStream!4164) tuple2!9360)

(declare-fun readerFrom!0 (BitStream!4164 (_ BitVec 32) (_ BitVec 32)) BitStream!4164)

(assert (=> b!113568 (= lt!172598 (readBitPure!0 (readerFrom!0 (_2!4941 lt!172596) (currentBit!5334 thiss!1305) (currentByte!5339 thiss!1305))))))

(declare-fun b!113569 () Bool)

(declare-fun res!93797 () Bool)

(assert (=> b!113569 (=> (not res!93797) (not e!74500))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113569 (= res!93797 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(assert (= (and start!22454 res!93790) b!113566))

(assert (= (and b!113566 res!93792) b!113569))

(assert (= (and b!113569 res!93797) b!113561))

(assert (= (and b!113561 res!93794) b!113565))

(assert (= (and b!113565 res!93796) b!113562))

(assert (= (and b!113562 res!93793) b!113567))

(assert (= (and b!113567 res!93791) b!113568))

(assert (= (and b!113568 res!93795) b!113563))

(assert (= start!22454 b!113564))

(declare-fun m!169691 () Bool)

(assert (=> b!113563 m!169691))

(declare-fun m!169693 () Bool)

(assert (=> b!113562 m!169693))

(declare-fun m!169695 () Bool)

(assert (=> b!113562 m!169695))

(declare-fun m!169697 () Bool)

(assert (=> b!113564 m!169697))

(declare-fun m!169699 () Bool)

(assert (=> b!113568 m!169699))

(assert (=> b!113568 m!169699))

(declare-fun m!169701 () Bool)

(assert (=> b!113568 m!169701))

(declare-fun m!169703 () Bool)

(assert (=> b!113567 m!169703))

(declare-fun m!169705 () Bool)

(assert (=> b!113565 m!169705))

(declare-fun m!169707 () Bool)

(assert (=> b!113565 m!169707))

(declare-fun m!169709 () Bool)

(assert (=> b!113565 m!169709))

(declare-fun m!169711 () Bool)

(assert (=> b!113565 m!169711))

(declare-fun m!169713 () Bool)

(assert (=> b!113569 m!169713))

(declare-fun m!169715 () Bool)

(assert (=> start!22454 m!169715))

(declare-fun m!169717 () Bool)

(assert (=> b!113566 m!169717))

(check-sat (not start!22454) (not b!113567) (not b!113564) (not b!113569) (not b!113566) (not b!113568) (not b!113563) (not b!113565) (not b!113562))
