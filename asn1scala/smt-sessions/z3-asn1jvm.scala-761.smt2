; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21846 () Bool)

(assert start!21846)

(declare-fun b!110184 () Bool)

(declare-fun res!90955 () Bool)

(declare-fun e!72223 () Bool)

(assert (=> b!110184 (=> (not res!90955) (not e!72223))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!110184 (= res!90955 (bvsge i!615 nBits!396))))

(declare-fun b!110185 () Bool)

(declare-fun res!90956 () Bool)

(assert (=> b!110185 (=> (not res!90956) (not e!72223))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110185 (= res!90956 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110186 () Bool)

(declare-fun e!72222 () Bool)

(declare-datatypes ((array!5026 0))(
  ( (array!5027 (arr!2878 (Array (_ BitVec 32) (_ BitVec 8))) (size!2285 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4044 0))(
  ( (BitStream!4045 (buf!2679 array!5026) (currentByte!5233 (_ BitVec 32)) (currentBit!5228 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4044)

(declare-fun array_inv!2087 (array!5026) Bool)

(assert (=> b!110186 (= e!72222 (array_inv!2087 (buf!2679 thiss!1305)))))

(declare-fun b!110187 () Bool)

(assert (=> b!110187 (= e!72223 (not true))))

(declare-fun lt!166964 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110187 (= lt!166964 (bitIndex!0 (size!2285 (buf!2679 thiss!1305)) (currentByte!5233 thiss!1305) (currentBit!5228 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4044 BitStream!4044) Bool)

(assert (=> b!110187 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6735 0))(
  ( (Unit!6736) )
))
(declare-fun lt!166963 () Unit!6735)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4044) Unit!6735)

(assert (=> b!110187 (= lt!166963 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun res!90958 () Bool)

(assert (=> start!21846 (=> (not res!90958) (not e!72223))))

(assert (=> start!21846 (= res!90958 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21846 e!72223))

(assert (=> start!21846 true))

(declare-fun inv!12 (BitStream!4044) Bool)

(assert (=> start!21846 (and (inv!12 thiss!1305) e!72222)))

(declare-fun b!110188 () Bool)

(declare-fun res!90957 () Bool)

(assert (=> b!110188 (=> (not res!90957) (not e!72223))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110188 (= res!90957 (validate_offset_bits!1 ((_ sign_extend 32) (size!2285 (buf!2679 thiss!1305))) ((_ sign_extend 32) (currentByte!5233 thiss!1305)) ((_ sign_extend 32) (currentBit!5228 thiss!1305)) ((_ sign_extend 32) (bvsub nBits!396 i!615))))))

(assert (= (and start!21846 res!90958) b!110188))

(assert (= (and b!110188 res!90957) b!110185))

(assert (= (and b!110185 res!90956) b!110184))

(assert (= (and b!110184 res!90955) b!110187))

(assert (= start!21846 b!110186))

(declare-fun m!163777 () Bool)

(assert (=> b!110185 m!163777))

(declare-fun m!163779 () Bool)

(assert (=> b!110187 m!163779))

(declare-fun m!163781 () Bool)

(assert (=> b!110187 m!163781))

(declare-fun m!163783 () Bool)

(assert (=> b!110187 m!163783))

(declare-fun m!163785 () Bool)

(assert (=> b!110188 m!163785))

(declare-fun m!163787 () Bool)

(assert (=> start!21846 m!163787))

(declare-fun m!163789 () Bool)

(assert (=> b!110186 m!163789))

(check-sat (not b!110186) (not b!110185) (not start!21846) (not b!110187) (not b!110188))
