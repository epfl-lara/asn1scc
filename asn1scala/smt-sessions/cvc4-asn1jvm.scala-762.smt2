; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21854 () Bool)

(assert start!21854)

(declare-fun res!91015 () Bool)

(declare-fun e!72276 () Bool)

(assert (=> start!21854 (=> (not res!91015) (not e!72276))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21854 (= res!91015 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21854 e!72276))

(assert (=> start!21854 true))

(declare-datatypes ((array!5034 0))(
  ( (array!5035 (arr!2882 (Array (_ BitVec 32) (_ BitVec 8))) (size!2289 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4052 0))(
  ( (BitStream!4053 (buf!2683 array!5034) (currentByte!5237 (_ BitVec 32)) (currentBit!5232 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4052)

(declare-fun e!72274 () Bool)

(declare-fun inv!12 (BitStream!4052) Bool)

(assert (=> start!21854 (and (inv!12 thiss!1305) e!72274)))

(declare-fun b!110252 () Bool)

(declare-fun res!91013 () Bool)

(declare-fun e!72278 () Bool)

(assert (=> b!110252 (=> (not res!91013) (not e!72278))))

(assert (=> b!110252 (= res!91013 (bvsge i!615 nBits!396))))

(declare-fun b!110253 () Bool)

(declare-fun res!91014 () Bool)

(assert (=> b!110253 (=> (not res!91014) (not e!72278))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110253 (= res!91014 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110254 () Bool)

(declare-fun array_inv!2091 (array!5034) Bool)

(assert (=> b!110254 (= e!72274 (array_inv!2091 (buf!2683 thiss!1305)))))

(declare-fun b!110255 () Bool)

(assert (=> b!110255 (= e!72276 e!72278)))

(declare-fun res!91012 () Bool)

(assert (=> b!110255 (=> (not res!91012) (not e!72278))))

(declare-fun lt!167005 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110255 (= res!91012 (validate_offset_bits!1 ((_ sign_extend 32) (size!2289 (buf!2683 thiss!1305))) ((_ sign_extend 32) (currentByte!5237 thiss!1305)) ((_ sign_extend 32) (currentBit!5232 thiss!1305)) lt!167005))))

(assert (=> b!110255 (= lt!167005 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110256 () Bool)

(declare-fun e!72277 () Bool)

(assert (=> b!110256 (= e!72278 (not e!72277))))

(declare-fun res!91011 () Bool)

(assert (=> b!110256 (=> res!91011 e!72277)))

(declare-fun lt!167004 () (_ BitVec 64))

(assert (=> b!110256 (= res!91011 (not (= lt!167004 (bvadd lt!167004 lt!167005))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110256 (= lt!167004 (bitIndex!0 (size!2289 (buf!2683 thiss!1305)) (currentByte!5237 thiss!1305) (currentBit!5232 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4052 BitStream!4052) Bool)

(assert (=> b!110256 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6743 0))(
  ( (Unit!6744) )
))
(declare-fun lt!167003 () Unit!6743)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4052) Unit!6743)

(assert (=> b!110256 (= lt!167003 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110257 () Bool)

(assert (=> b!110257 (= e!72277 (bvsle (bvsub nBits!396 i!615) #b00000000000000000000000001000000))))

(declare-datatypes ((tuple2!9172 0))(
  ( (tuple2!9173 (_1!4843 BitStream!4052) (_2!4843 BitStream!4052)) )
))
(declare-fun lt!167006 () tuple2!9172)

(declare-fun reader!0 (BitStream!4052 BitStream!4052) tuple2!9172)

(assert (=> b!110257 (= lt!167006 (reader!0 thiss!1305 thiss!1305))))

(assert (= (and start!21854 res!91015) b!110255))

(assert (= (and b!110255 res!91012) b!110253))

(assert (= (and b!110253 res!91014) b!110252))

(assert (= (and b!110252 res!91013) b!110256))

(assert (= (and b!110256 (not res!91011)) b!110257))

(assert (= start!21854 b!110254))

(declare-fun m!163837 () Bool)

(assert (=> b!110254 m!163837))

(declare-fun m!163839 () Bool)

(assert (=> b!110257 m!163839))

(declare-fun m!163841 () Bool)

(assert (=> b!110255 m!163841))

(declare-fun m!163843 () Bool)

(assert (=> b!110256 m!163843))

(declare-fun m!163845 () Bool)

(assert (=> b!110256 m!163845))

(declare-fun m!163847 () Bool)

(assert (=> b!110256 m!163847))

(declare-fun m!163849 () Bool)

(assert (=> b!110253 m!163849))

(declare-fun m!163851 () Bool)

(assert (=> start!21854 m!163851))

(push 1)

(assert (not b!110257))

(assert (not start!21854))

(assert (not b!110253))

(assert (not b!110254))

(assert (not b!110255))

(assert (not b!110256))

(check-sat)

(pop 1)

(push 1)

(check-sat)

