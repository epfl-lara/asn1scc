; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!42636 () Bool)

(assert start!42636)

(declare-fun b!201216 () Bool)

(declare-fun res!168470 () Bool)

(declare-fun e!138007 () Bool)

(assert (=> b!201216 (=> (not res!168470) (not e!138007))))

(declare-datatypes ((array!10218 0))(
  ( (array!10219 (arr!5430 (Array (_ BitVec 32) (_ BitVec 8))) (size!4500 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!8108 0))(
  ( (BitStream!8109 (buf!5001 array!10218) (currentByte!9399 (_ BitVec 32)) (currentBit!9394 (_ BitVec 32))) )
))
(declare-fun thiss!1204 () BitStream!8108)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!201216 (= res!168470 (invariant!0 (currentBit!9394 thiss!1204) (currentByte!9399 thiss!1204) (size!4500 (buf!5001 thiss!1204))))))

(declare-fun b!201217 () Bool)

(declare-fun res!168474 () Bool)

(assert (=> b!201217 (=> (not res!168474) (not e!138007))))

(declare-fun i!590 () (_ BitVec 32))

(declare-fun nBits!348 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!201217 (= res!168474 (validate_offset_bits!1 ((_ sign_extend 32) (size!4500 (buf!5001 thiss!1204))) ((_ sign_extend 32) (currentByte!9399 thiss!1204)) ((_ sign_extend 32) (currentBit!9394 thiss!1204)) ((_ sign_extend 32) (bvsub nBits!348 i!590))))))

(declare-fun b!201218 () Bool)

(declare-fun e!138005 () Bool)

(assert (=> b!201218 (= e!138007 e!138005)))

(declare-fun res!168472 () Bool)

(assert (=> b!201218 (=> (not res!168472) (not e!138005))))

(declare-fun lt!313992 () (_ BitVec 64))

(assert (=> b!201218 (= res!168472 (= lt!313992 (bvsub (bvadd lt!313992 ((_ sign_extend 32) nBits!348)) ((_ sign_extend 32) i!590))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!201218 (= lt!313992 (bitIndex!0 (size!4500 (buf!5001 thiss!1204)) (currentByte!9399 thiss!1204) (currentBit!9394 thiss!1204)))))

(declare-fun b!201219 () Bool)

(declare-fun e!138006 () Bool)

(declare-fun array_inv!4241 (array!10218) Bool)

(assert (=> b!201219 (= e!138006 (array_inv!4241 (buf!5001 thiss!1204)))))

(declare-fun b!201220 () Bool)

(declare-fun res!168473 () Bool)

(assert (=> b!201220 (=> (not res!168473) (not e!138007))))

(assert (=> b!201220 (= res!168473 (= i!590 nBits!348))))

(declare-fun res!168471 () Bool)

(assert (=> start!42636 (=> (not res!168471) (not e!138007))))

(assert (=> start!42636 (= res!168471 (and (bvsge nBits!348 #b00000000000000000000000000000000) (bvsle nBits!348 #b00000000000000000000000001000000) (bvsle #b00000000000000000000000000000000 i!590) (bvsle i!590 nBits!348)))))

(assert (=> start!42636 e!138007))

(assert (=> start!42636 true))

(declare-fun inv!12 (BitStream!8108) Bool)

(assert (=> start!42636 (and (inv!12 thiss!1204) e!138006)))

(declare-fun b!201221 () Bool)

(assert (=> b!201221 (= e!138005 (not true))))

(declare-fun isPrefixOf!0 (BitStream!8108 BitStream!8108) Bool)

(assert (=> b!201221 (isPrefixOf!0 thiss!1204 thiss!1204)))

(declare-datatypes ((Unit!14302 0))(
  ( (Unit!14303) )
))
(declare-fun lt!313993 () Unit!14302)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!8108) Unit!14302)

(assert (=> b!201221 (= lt!313993 (lemmaIsPrefixRefl!0 thiss!1204))))

(assert (= (and start!42636 res!168471) b!201217))

(assert (= (and b!201217 res!168474) b!201216))

(assert (= (and b!201216 res!168470) b!201220))

(assert (= (and b!201220 res!168473) b!201218))

(assert (= (and b!201218 res!168472) b!201221))

(assert (= start!42636 b!201219))

(declare-fun m!311825 () Bool)

(assert (=> b!201218 m!311825))

(declare-fun m!311827 () Bool)

(assert (=> b!201216 m!311827))

(declare-fun m!311829 () Bool)

(assert (=> start!42636 m!311829))

(declare-fun m!311831 () Bool)

(assert (=> b!201219 m!311831))

(declare-fun m!311833 () Bool)

(assert (=> b!201217 m!311833))

(declare-fun m!311835 () Bool)

(assert (=> b!201221 m!311835))

(declare-fun m!311837 () Bool)

(assert (=> b!201221 m!311837))

(push 1)

