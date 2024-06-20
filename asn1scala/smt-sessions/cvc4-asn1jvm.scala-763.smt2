; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!21860 () Bool)

(assert start!21860)

(declare-fun res!91059 () Bool)

(declare-fun e!72320 () Bool)

(assert (=> start!21860 (=> (not res!91059) (not e!72320))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> start!21860 (= res!91059 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21860 e!72320))

(assert (=> start!21860 true))

(declare-datatypes ((array!5040 0))(
  ( (array!5041 (arr!2885 (Array (_ BitVec 32) (_ BitVec 8))) (size!2292 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4058 0))(
  ( (BitStream!4059 (buf!2686 array!5040) (currentByte!5240 (_ BitVec 32)) (currentBit!5235 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4058)

(declare-fun e!72321 () Bool)

(declare-fun inv!12 (BitStream!4058) Bool)

(assert (=> start!21860 (and (inv!12 thiss!1305) e!72321)))

(declare-fun b!110306 () Bool)

(declare-fun res!91058 () Bool)

(declare-fun e!72323 () Bool)

(assert (=> b!110306 (=> (not res!91058) (not e!72323))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110306 (= res!91058 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110307 () Bool)

(declare-fun e!72319 () Bool)

(assert (=> b!110307 (= e!72319 true)))

(declare-datatypes ((tuple2!9178 0))(
  ( (tuple2!9179 (_1!4846 BitStream!4058) (_2!4846 BitStream!4058)) )
))
(declare-fun lt!167040 () tuple2!9178)

(declare-fun reader!0 (BitStream!4058 BitStream!4058) tuple2!9178)

(assert (=> b!110307 (= lt!167040 (reader!0 thiss!1305 thiss!1305))))

(declare-fun b!110308 () Bool)

(assert (=> b!110308 (= e!72320 e!72323)))

(declare-fun res!91060 () Bool)

(assert (=> b!110308 (=> (not res!91060) (not e!72323))))

(declare-fun lt!167039 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110308 (= res!91060 (validate_offset_bits!1 ((_ sign_extend 32) (size!2292 (buf!2686 thiss!1305))) ((_ sign_extend 32) (currentByte!5240 thiss!1305)) ((_ sign_extend 32) (currentBit!5235 thiss!1305)) lt!167039))))

(assert (=> b!110308 (= lt!167039 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110309 () Bool)

(assert (=> b!110309 (= e!72323 (not e!72319))))

(declare-fun res!91056 () Bool)

(assert (=> b!110309 (=> res!91056 e!72319)))

(declare-fun lt!167042 () (_ BitVec 64))

(assert (=> b!110309 (= res!91056 (not (= lt!167042 (bvadd lt!167042 lt!167039))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110309 (= lt!167042 (bitIndex!0 (size!2292 (buf!2686 thiss!1305)) (currentByte!5240 thiss!1305) (currentBit!5235 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4058 BitStream!4058) Bool)

(assert (=> b!110309 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6749 0))(
  ( (Unit!6750) )
))
(declare-fun lt!167041 () Unit!6749)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4058) Unit!6749)

(assert (=> b!110309 (= lt!167041 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110310 () Bool)

(declare-fun array_inv!2094 (array!5040) Bool)

(assert (=> b!110310 (= e!72321 (array_inv!2094 (buf!2686 thiss!1305)))))

(declare-fun b!110311 () Bool)

(declare-fun res!91057 () Bool)

(assert (=> b!110311 (=> (not res!91057) (not e!72323))))

(assert (=> b!110311 (= res!91057 (bvsge i!615 nBits!396))))

(assert (= (and start!21860 res!91059) b!110308))

(assert (= (and b!110308 res!91060) b!110306))

(assert (= (and b!110306 res!91058) b!110311))

(assert (= (and b!110311 res!91057) b!110309))

(assert (= (and b!110309 (not res!91056)) b!110307))

(assert (= start!21860 b!110310))

(declare-fun m!163885 () Bool)

(assert (=> b!110308 m!163885))

(declare-fun m!163887 () Bool)

(assert (=> b!110310 m!163887))

(declare-fun m!163889 () Bool)

(assert (=> start!21860 m!163889))

(declare-fun m!163891 () Bool)

(assert (=> b!110309 m!163891))

(declare-fun m!163893 () Bool)

(assert (=> b!110309 m!163893))

(declare-fun m!163895 () Bool)

(assert (=> b!110309 m!163895))

(declare-fun m!163897 () Bool)

(assert (=> b!110306 m!163897))

(declare-fun m!163899 () Bool)

(assert (=> b!110307 m!163899))

(push 1)

(assert (not b!110306))

(assert (not b!110309))

(assert (not b!110310))

(assert (not b!110308))

(assert (not b!110307))

(assert (not start!21860))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

