; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17680 () Bool)

(assert start!17680)

(declare-fun b!85322 () Bool)

(declare-fun res!70004 () Bool)

(declare-fun e!56836 () Bool)

(assert (=> b!85322 (=> (not res!70004) (not e!56836))))

(declare-datatypes ((array!4056 0))(
  ( (array!4057 (arr!2469 (Array (_ BitVec 32) (_ BitVec 8))) (size!1832 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3226 0))(
  ( (BitStream!3227 (buf!2222 array!4056) (currentByte!4419 (_ BitVec 32)) (currentBit!4414 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3226)

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85322 (= res!70004 (validate_offset_bits!1 ((_ sign_extend 32) (size!1832 (buf!2222 thiss!1151))) ((_ sign_extend 32) (currentByte!4419 thiss!1151)) ((_ sign_extend 32) (currentBit!4414 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85323 () Bool)

(assert (=> b!85323 (= e!56836 false)))

(declare-fun lt!134631 () Bool)

(declare-fun e!56838 () Bool)

(assert (=> b!85323 (= lt!134631 e!56838)))

(declare-fun res!70008 () Bool)

(assert (=> b!85323 (=> res!70008 e!56838)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85323 (= res!70008 (not (invariant!0 (currentBit!4414 thiss!1151) (currentByte!4419 thiss!1151) (size!1832 (buf!2222 thiss!1151)))))))

(declare-fun b!85324 () Bool)

(declare-fun e!56835 () Bool)

(declare-fun thiss!1152 () BitStream!3226)

(declare-fun array_inv!1678 (array!4056) Bool)

(assert (=> b!85324 (= e!56835 (array_inv!1678 (buf!2222 thiss!1152)))))

(declare-fun b!85325 () Bool)

(declare-fun res!70009 () Bool)

(assert (=> b!85325 (=> res!70009 e!56838)))

(assert (=> b!85325 (= res!70009 (not (invariant!0 (currentBit!4414 thiss!1152) (currentByte!4419 thiss!1152) (size!1832 (buf!2222 thiss!1152)))))))

(declare-fun b!85326 () Bool)

(assert (=> b!85326 (= e!56838 true)))

(declare-fun b!85327 () Bool)

(declare-fun res!70005 () Bool)

(assert (=> b!85327 (=> res!70005 e!56838)))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85327 (= res!70005 (not (= (bitIndex!0 (size!1832 (buf!2222 thiss!1152)) (currentByte!4419 thiss!1152) (currentBit!4414 thiss!1152)) (bvadd (bitIndex!0 (size!1832 (buf!2222 thiss!1151)) (currentByte!4419 thiss!1151) (currentBit!4414 thiss!1151)) ((_ sign_extend 32) i!576)))))))

(declare-fun b!85328 () Bool)

(declare-fun res!70003 () Bool)

(assert (=> b!85328 (=> res!70003 e!56838)))

(assert (=> b!85328 (= res!70003 (or (bvsgt i!576 nBits!336) (not (= (size!1832 (buf!2222 thiss!1152)) (size!1832 (buf!2222 thiss!1151))))))))

(declare-fun res!70006 () Bool)

(assert (=> start!17680 (=> (not res!70006) (not e!56836))))

(assert (=> start!17680 (= res!70006 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17680 e!56836))

(assert (=> start!17680 true))

(declare-fun e!56834 () Bool)

(declare-fun inv!12 (BitStream!3226) Bool)

(assert (=> start!17680 (and (inv!12 thiss!1151) e!56834)))

(assert (=> start!17680 (and (inv!12 thiss!1152) e!56835)))

(declare-fun b!85329 () Bool)

(assert (=> b!85329 (= e!56834 (array_inv!1678 (buf!2222 thiss!1151)))))

(declare-fun b!85330 () Bool)

(declare-fun res!70007 () Bool)

(assert (=> b!85330 (=> res!70007 e!56838)))

(assert (=> b!85330 (= res!70007 (bvslt i!576 #b00000000000000000000000000000000))))

(assert (= (and start!17680 res!70006) b!85322))

(assert (= (and b!85322 res!70004) b!85323))

(assert (= (and b!85323 (not res!70008)) b!85330))

(assert (= (and b!85330 (not res!70007)) b!85325))

(assert (= (and b!85325 (not res!70009)) b!85328))

(assert (= (and b!85328 (not res!70003)) b!85327))

(assert (= (and b!85327 (not res!70005)) b!85326))

(assert (= start!17680 b!85329))

(assert (= start!17680 b!85324))

(declare-fun m!131525 () Bool)

(assert (=> b!85323 m!131525))

(declare-fun m!131527 () Bool)

(assert (=> start!17680 m!131527))

(declare-fun m!131529 () Bool)

(assert (=> start!17680 m!131529))

(declare-fun m!131531 () Bool)

(assert (=> b!85327 m!131531))

(declare-fun m!131533 () Bool)

(assert (=> b!85327 m!131533))

(declare-fun m!131535 () Bool)

(assert (=> b!85322 m!131535))

(declare-fun m!131537 () Bool)

(assert (=> b!85329 m!131537))

(declare-fun m!131539 () Bool)

(assert (=> b!85325 m!131539))

(declare-fun m!131541 () Bool)

(assert (=> b!85324 m!131541))

(push 1)

(assert (not b!85329))

(assert (not b!85325))

(assert (not b!85327))

(assert (not b!85323))

(assert (not start!17680))

(assert (not b!85324))

(assert (not b!85322))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

