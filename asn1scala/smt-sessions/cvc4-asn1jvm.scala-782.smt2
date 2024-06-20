; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!22456 () Bool)

(assert start!22456)

(declare-fun b!113588 () Bool)

(declare-fun res!93820 () Bool)

(declare-fun e!74518 () Bool)

(assert (=> b!113588 (=> (not res!93820) (not e!74518))))

(declare-datatypes ((array!5163 0))(
  ( (array!5164 (arr!2939 (Array (_ BitVec 32) (_ BitVec 8))) (size!2346 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4166 0))(
  ( (BitStream!4167 (buf!2754 array!5163) (currentByte!5340 (_ BitVec 32)) (currentBit!5335 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4166)

(declare-datatypes ((Unit!6977 0))(
  ( (Unit!6978) )
))
(declare-datatypes ((tuple2!9362 0))(
  ( (tuple2!9363 (_1!4943 Unit!6977) (_2!4943 BitStream!4166)) )
))
(declare-fun lt!172619 () tuple2!9362)

(declare-fun isPrefixOf!0 (BitStream!4166 BitStream!4166) Bool)

(assert (=> b!113588 (= res!93820 (isPrefixOf!0 thiss!1305 (_2!4943 lt!172619)))))

(declare-fun b!113589 () Bool)

(declare-fun e!74520 () Bool)

(assert (=> b!113589 (= e!74520 (not true))))

(declare-fun lt!172618 () tuple2!9362)

(assert (=> b!113589 (isPrefixOf!0 thiss!1305 (_2!4943 lt!172618))))

(declare-fun lt!172620 () Unit!6977)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4166 BitStream!4166 BitStream!4166) Unit!6977)

(assert (=> b!113589 (= lt!172620 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!4943 lt!172619) (_2!4943 lt!172618)))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4166 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!9362)

(assert (=> b!113589 (= lt!172618 (appendNLeastSignificantBitsLoop!0 (_2!4943 lt!172619) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!74516 () Bool)

(assert (=> b!113589 e!74516))

(declare-fun res!93814 () Bool)

(assert (=> b!113589 (=> (not res!93814) (not e!74516))))

(assert (=> b!113589 (= res!93814 (= (size!2346 (buf!2754 thiss!1305)) (size!2346 (buf!2754 (_2!4943 lt!172619)))))))

(declare-fun lt!172617 () Bool)

(declare-fun appendBit!0 (BitStream!4166 Bool) tuple2!9362)

(assert (=> b!113589 (= lt!172619 (appendBit!0 thiss!1305 lt!172617))))

(assert (=> b!113589 (= lt!172617 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!113590 () Bool)

(declare-fun res!93815 () Bool)

(assert (=> b!113590 (=> (not res!93815) (not e!74520))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!113590 (= res!93815 (validate_offset_bits!1 ((_ sign_extend 32) (size!2346 (buf!2754 thiss!1305))) ((_ sign_extend 32) (currentByte!5340 thiss!1305)) ((_ sign_extend 32) (currentBit!5335 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(declare-fun b!113591 () Bool)

(declare-fun res!93818 () Bool)

(assert (=> b!113591 (=> (not res!93818) (not e!74520))))

(assert (=> b!113591 (= res!93818 (bvslt i!615 nBits!396))))

(declare-fun b!113593 () Bool)

(declare-fun res!93816 () Bool)

(assert (=> b!113593 (=> (not res!93816) (not e!74520))))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113593 (= res!93816 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!113594 () Bool)

(declare-fun e!74517 () Bool)

(assert (=> b!113594 (= e!74518 e!74517)))

(declare-fun res!93817 () Bool)

(assert (=> b!113594 (=> (not res!93817) (not e!74517))))

(declare-datatypes ((tuple2!9364 0))(
  ( (tuple2!9365 (_1!4944 BitStream!4166) (_2!4944 Bool)) )
))
(declare-fun lt!172616 () tuple2!9364)

(assert (=> b!113594 (= res!93817 (and (= (_2!4944 lt!172616) lt!172617) (= (_1!4944 lt!172616) (_2!4943 lt!172619))))))

(declare-fun readBitPure!0 (BitStream!4166) tuple2!9364)

(declare-fun readerFrom!0 (BitStream!4166 (_ BitVec 32) (_ BitVec 32)) BitStream!4166)

(assert (=> b!113594 (= lt!172616 (readBitPure!0 (readerFrom!0 (_2!4943 lt!172619) (currentBit!5335 thiss!1305) (currentByte!5340 thiss!1305))))))

(declare-fun b!113595 () Bool)

(declare-fun lt!172622 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!113595 (= e!74517 (= (bitIndex!0 (size!2346 (buf!2754 (_1!4944 lt!172616))) (currentByte!5340 (_1!4944 lt!172616)) (currentBit!5335 (_1!4944 lt!172616))) lt!172622))))

(declare-fun b!113596 () Bool)

(assert (=> b!113596 (= e!74516 e!74518)))

(declare-fun res!93819 () Bool)

(assert (=> b!113596 (=> (not res!93819) (not e!74518))))

(declare-fun lt!172621 () (_ BitVec 64))

(assert (=> b!113596 (= res!93819 (= lt!172622 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!172621)))))

(assert (=> b!113596 (= lt!172622 (bitIndex!0 (size!2346 (buf!2754 (_2!4943 lt!172619))) (currentByte!5340 (_2!4943 lt!172619)) (currentBit!5335 (_2!4943 lt!172619))))))

(assert (=> b!113596 (= lt!172621 (bitIndex!0 (size!2346 (buf!2754 thiss!1305)) (currentByte!5340 thiss!1305) (currentBit!5335 thiss!1305)))))

(declare-fun b!113592 () Bool)

(declare-fun e!74515 () Bool)

(declare-fun array_inv!2148 (array!5163) Bool)

(assert (=> b!113592 (= e!74515 (array_inv!2148 (buf!2754 thiss!1305)))))

(declare-fun res!93821 () Bool)

(assert (=> start!22456 (=> (not res!93821) (not e!74520))))

(assert (=> start!22456 (= res!93821 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!22456 e!74520))

(assert (=> start!22456 true))

(declare-fun inv!12 (BitStream!4166) Bool)

(assert (=> start!22456 (and (inv!12 thiss!1305) e!74515)))

(assert (= (and start!22456 res!93821) b!113590))

(assert (= (and b!113590 res!93815) b!113593))

(assert (= (and b!113593 res!93816) b!113591))

(assert (= (and b!113591 res!93818) b!113589))

(assert (= (and b!113589 res!93814) b!113596))

(assert (= (and b!113596 res!93819) b!113588))

(assert (= (and b!113588 res!93820) b!113594))

(assert (= (and b!113594 res!93817) b!113595))

(assert (= start!22456 b!113592))

(declare-fun m!169719 () Bool)

(assert (=> b!113589 m!169719))

(declare-fun m!169721 () Bool)

(assert (=> b!113589 m!169721))

(declare-fun m!169723 () Bool)

(assert (=> b!113589 m!169723))

(declare-fun m!169725 () Bool)

(assert (=> b!113589 m!169725))

(declare-fun m!169727 () Bool)

(assert (=> start!22456 m!169727))

(declare-fun m!169729 () Bool)

(assert (=> b!113595 m!169729))

(declare-fun m!169731 () Bool)

(assert (=> b!113596 m!169731))

(declare-fun m!169733 () Bool)

(assert (=> b!113596 m!169733))

(declare-fun m!169735 () Bool)

(assert (=> b!113588 m!169735))

(declare-fun m!169737 () Bool)

(assert (=> b!113593 m!169737))

(declare-fun m!169739 () Bool)

(assert (=> b!113594 m!169739))

(assert (=> b!113594 m!169739))

(declare-fun m!169741 () Bool)

(assert (=> b!113594 m!169741))

(declare-fun m!169743 () Bool)

(assert (=> b!113590 m!169743))

(declare-fun m!169745 () Bool)

(assert (=> b!113592 m!169745))

(push 1)

(assert (not b!113594))

