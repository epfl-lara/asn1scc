; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21852 () Bool)

(assert start!21852)

(declare-fun res!90998 () Bool)

(declare-fun e!72262 () Bool)

(assert (=> start!21852 (=> (not res!90998) (not e!72262))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21852 (= res!90998 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21852 e!72262))

(assert (=> start!21852 true))

(declare-datatypes ((array!5032 0))(
  ( (array!5033 (arr!2881 (Array (_ BitVec 32) (_ BitVec 8))) (size!2288 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4050 0))(
  ( (BitStream!4051 (buf!2682 array!5032) (currentByte!5236 (_ BitVec 32)) (currentBit!5231 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4050)

(declare-fun e!72260 () Bool)

(declare-fun inv!12 (BitStream!4050) Bool)

(assert (=> start!21852 (and (inv!12 thiss!1305) e!72260)))

(declare-fun b!110234 () Bool)

(declare-fun e!72259 () Bool)

(declare-fun e!72263 () Bool)

(assert (=> b!110234 (= e!72259 (not e!72263))))

(declare-fun res!90999 () Bool)

(assert (=> b!110234 (=> res!90999 e!72263)))

(declare-fun lt!166992 () (_ BitVec 64))

(declare-fun lt!166993 () (_ BitVec 64))

(assert (=> b!110234 (= res!90999 (not (= lt!166992 (bvadd lt!166992 lt!166993))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110234 (= lt!166992 (bitIndex!0 (size!2288 (buf!2682 thiss!1305)) (currentByte!5236 thiss!1305) (currentBit!5231 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4050 BitStream!4050) Bool)

(assert (=> b!110234 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6741 0))(
  ( (Unit!6742) )
))
(declare-fun lt!166994 () Unit!6741)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4050) Unit!6741)

(assert (=> b!110234 (= lt!166994 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110235 () Bool)

(assert (=> b!110235 (= e!72262 e!72259)))

(declare-fun res!90997 () Bool)

(assert (=> b!110235 (=> (not res!90997) (not e!72259))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110235 (= res!90997 (validate_offset_bits!1 ((_ sign_extend 32) (size!2288 (buf!2682 thiss!1305))) ((_ sign_extend 32) (currentByte!5236 thiss!1305)) ((_ sign_extend 32) (currentBit!5231 thiss!1305)) lt!166993))))

(assert (=> b!110235 (= lt!166993 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110236 () Bool)

(assert (=> b!110236 (= e!72263 (bvsle (bvsub nBits!396 i!615) #b00000000000000000000000001000000))))

(declare-datatypes ((tuple2!9170 0))(
  ( (tuple2!9171 (_1!4842 BitStream!4050) (_2!4842 BitStream!4050)) )
))
(declare-fun lt!166991 () tuple2!9170)

(declare-fun reader!0 (BitStream!4050 BitStream!4050) tuple2!9170)

(assert (=> b!110236 (= lt!166991 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110237 () Bool)

(declare-fun array_inv!2090 (array!5032) Bool)

(assert (=> b!110237 (= e!72260 (array_inv!2090 (buf!2682 thiss!1305)))))

(declare-fun b!110238 () Bool)

(declare-fun res!90996 () Bool)

(assert (=> b!110238 (=> (not res!90996) (not e!72259))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110238 (= res!90996 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110239 () Bool)

(declare-fun res!91000 () Bool)

(assert (=> b!110239 (=> (not res!91000) (not e!72259))))

(assert (=> b!110239 (= res!91000 (bvsge i!615 nBits!396))))

(assert (= (and start!21852 res!90998) b!110235))

(assert (= (and b!110235 res!90997) b!110238))

(assert (= (and b!110238 res!90996) b!110239))

(assert (= (and b!110239 res!91000) b!110234))

(assert (= (and b!110234 (not res!90999)) b!110236))

(assert (= start!21852 b!110237))

(declare-fun m!163821 () Bool)

(assert (=> start!21852 m!163821))

(declare-fun m!163823 () Bool)

(assert (=> b!110236 m!163823))

(declare-fun m!163825 () Bool)

(assert (=> b!110234 m!163825))

(declare-fun m!163827 () Bool)

(assert (=> b!110234 m!163827))

(declare-fun m!163829 () Bool)

(assert (=> b!110234 m!163829))

(declare-fun m!163831 () Bool)

(assert (=> b!110237 m!163831))

(declare-fun m!163833 () Bool)

(assert (=> b!110238 m!163833))

(declare-fun m!163835 () Bool)

(assert (=> b!110235 m!163835))

(check-sat (not b!110238) (not start!21852) (not b!110235) (not b!110236) (not b!110237) (not b!110234))
(check-sat)
