; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!21858 () Bool)

(assert start!21858)

(declare-fun b!110288 () Bool)

(declare-fun e!72307 () Bool)

(declare-fun e!72304 () Bool)

(assert (=> b!110288 (= e!72307 (not e!72304))))

(declare-fun res!91043 () Bool)

(assert (=> b!110288 (=> res!91043 e!72304)))

(declare-fun lt!167028 () (_ BitVec 64))

(declare-fun lt!167027 () (_ BitVec 64))

(assert (=> b!110288 (= res!91043 (not (= lt!167028 (bvadd lt!167028 lt!167027))))))

(declare-datatypes ((array!5038 0))(
  ( (array!5039 (arr!2884 (Array (_ BitVec 32) (_ BitVec 8))) (size!2291 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4056 0))(
  ( (BitStream!4057 (buf!2685 array!5038) (currentByte!5239 (_ BitVec 32)) (currentBit!5234 (_ BitVec 32))) )
))
(declare-fun thiss!1305 () BitStream!4056)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110288 (= lt!167028 (bitIndex!0 (size!2291 (buf!2685 thiss!1305)) (currentByte!5239 thiss!1305) (currentBit!5234 thiss!1305)))))

(declare-fun isPrefixOf!0 (BitStream!4056 BitStream!4056) Bool)

(assert (=> b!110288 (isPrefixOf!0 thiss!1305 thiss!1305)))

(declare-datatypes ((Unit!6747 0))(
  ( (Unit!6748) )
))
(declare-fun lt!167030 () Unit!6747)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4056) Unit!6747)

(assert (=> b!110288 (= lt!167030 (lemmaIsPrefixRefl!0 thiss!1305))))

(declare-fun b!110289 () Bool)

(declare-fun res!91044 () Bool)

(assert (=> b!110289 (=> (not res!91044) (not e!72307))))

(declare-fun i!615 () (_ BitVec 32))

(declare-fun nBits!396 () (_ BitVec 32))

(assert (=> b!110289 (= res!91044 (bvsge i!615 nBits!396))))

(declare-fun b!110290 () Bool)

(declare-fun e!72305 () Bool)

(assert (=> b!110290 (= e!72305 e!72307)))

(declare-fun res!91045 () Bool)

(assert (=> b!110290 (=> (not res!91045) (not e!72307))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!110290 (= res!91045 (validate_offset_bits!1 ((_ sign_extend 32) (size!2291 (buf!2685 thiss!1305))) ((_ sign_extend 32) (currentByte!5239 thiss!1305)) ((_ sign_extend 32) (currentBit!5234 thiss!1305)) lt!167027))))

(assert (=> b!110290 (= lt!167027 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!110291 () Bool)

(declare-fun res!91041 () Bool)

(assert (=> b!110291 (=> (not res!91041) (not e!72307))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!110291 (= res!91041 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!110292 () Bool)

(declare-fun e!72308 () Bool)

(declare-fun array_inv!2093 (array!5038) Bool)

(assert (=> b!110292 (= e!72308 (array_inv!2093 (buf!2685 thiss!1305)))))

(declare-fun res!91042 () Bool)

(assert (=> start!21858 (=> (not res!91042) (not e!72305))))

(assert (=> start!21858 (= res!91042 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!21858 e!72305))

(assert (=> start!21858 true))

(declare-fun inv!12 (BitStream!4056) Bool)

(assert (=> start!21858 (and (inv!12 thiss!1305) e!72308)))

(declare-fun b!110293 () Bool)

(assert (=> b!110293 (= e!72304 true)))

(declare-datatypes ((tuple2!9176 0))(
  ( (tuple2!9177 (_1!4845 BitStream!4056) (_2!4845 BitStream!4056)) )
))
(declare-fun lt!167029 () tuple2!9176)

(declare-fun reader!0 (BitStream!4056 BitStream!4056) tuple2!9176)

(assert (=> b!110293 (= lt!167029 (reader!0 thiss!1305 thiss!1305))))

(assert (= (and start!21858 res!91042) b!110290))

(assert (= (and b!110290 res!91045) b!110291))

(assert (= (and b!110291 res!91041) b!110289))

(assert (= (and b!110289 res!91044) b!110288))

(assert (= (and b!110288 (not res!91043)) b!110293))

(assert (= start!21858 b!110292))

(declare-fun m!163869 () Bool)

(assert (=> b!110291 m!163869))

(declare-fun m!163871 () Bool)

(assert (=> b!110292 m!163871))

(declare-fun m!163873 () Bool)

(assert (=> b!110290 m!163873))

(declare-fun m!163875 () Bool)

(assert (=> b!110288 m!163875))

(declare-fun m!163877 () Bool)

(assert (=> b!110288 m!163877))

(declare-fun m!163879 () Bool)

(assert (=> b!110288 m!163879))

(declare-fun m!163881 () Bool)

(assert (=> start!21858 m!163881))

(declare-fun m!163883 () Bool)

(assert (=> b!110293 m!163883))

(check-sat (not start!21858) (not b!110293) (not b!110292) (not b!110288) (not b!110290) (not b!110291))
