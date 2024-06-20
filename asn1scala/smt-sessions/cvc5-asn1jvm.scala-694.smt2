; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!19554 () Bool)

(assert start!19554)

(declare-fun b!97502 () Bool)

(declare-fun res!79999 () Bool)

(declare-fun e!63875 () Bool)

(assert (=> b!97502 (=> (not res!79999) (not e!63875))))

(declare-fun v!196 () (_ BitVec 64))

(declare-fun nBits!388 () (_ BitVec 32))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97502 (= res!79999 (= (bvand v!196 (onesLSBLong!0 nBits!388)) v!196))))

(declare-fun b!97503 () Bool)

(declare-fun e!63873 () Bool)

(assert (=> b!97503 (= e!63875 e!63873)))

(declare-fun res!80000 () Bool)

(assert (=> b!97503 (=> (not res!80000) (not e!63873))))

(declare-datatypes ((array!4558 0))(
  ( (array!4559 (arr!2676 (Array (_ BitVec 32) (_ BitVec 8))) (size!2083 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3640 0))(
  ( (BitStream!3641 (buf!2431 array!4558) (currentByte!4852 (_ BitVec 32)) (currentBit!4847 (_ BitVec 32))) )
))
(declare-fun thiss!1288 () BitStream!3640)

(declare-datatypes ((Unit!5936 0))(
  ( (Unit!5937) )
))
(declare-datatypes ((tuple2!7804 0))(
  ( (tuple2!7805 (_1!4154 Unit!5936) (_2!4154 BitStream!3640)) )
))
(declare-fun lt!141279 () tuple2!7804)

(assert (=> b!97503 (= res!80000 (= (size!2083 (buf!2431 thiss!1288)) (size!2083 (buf!2431 (_2!4154 lt!141279)))))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!3640 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!7804)

(assert (=> b!97503 (= lt!141279 (appendNLeastSignificantBitsLoop!0 thiss!1288 v!196 nBits!388 #b00000000000000000000000000000000))))

(declare-fun b!97505 () Bool)

(declare-fun res!79998 () Bool)

(assert (=> b!97505 (=> (not res!79998) (not e!63875))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!97505 (= res!79998 (validate_offset_bits!1 ((_ sign_extend 32) (size!2083 (buf!2431 thiss!1288))) ((_ sign_extend 32) (currentByte!4852 thiss!1288)) ((_ sign_extend 32) (currentBit!4847 thiss!1288)) ((_ sign_extend 32) nBits!388)))))

(declare-fun b!97506 () Bool)

(assert (=> b!97506 (= e!63873 false)))

(declare-datatypes ((tuple2!7806 0))(
  ( (tuple2!7807 (_1!4155 BitStream!3640) (_2!4155 BitStream!3640)) )
))
(declare-fun lt!141280 () tuple2!7806)

(declare-fun reader!0 (BitStream!3640 BitStream!3640) tuple2!7806)

(assert (=> b!97506 (= lt!141280 (reader!0 thiss!1288 (_2!4154 lt!141279)))))

(declare-fun b!97507 () Bool)

(declare-fun e!63876 () Bool)

(declare-fun array_inv!1885 (array!4558) Bool)

(assert (=> b!97507 (= e!63876 (array_inv!1885 (buf!2431 thiss!1288)))))

(declare-fun b!97508 () Bool)

(declare-fun res!79996 () Bool)

(assert (=> b!97508 (=> (not res!79996) (not e!63873))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!97508 (= res!79996 (= (bitIndex!0 (size!2083 (buf!2431 (_2!4154 lt!141279))) (currentByte!4852 (_2!4154 lt!141279)) (currentBit!4847 (_2!4154 lt!141279))) (bvadd (bitIndex!0 (size!2083 (buf!2431 thiss!1288)) (currentByte!4852 thiss!1288) (currentBit!4847 thiss!1288)) ((_ sign_extend 32) nBits!388))))))

(declare-fun b!97504 () Bool)

(declare-fun res!79997 () Bool)

(assert (=> b!97504 (=> (not res!79997) (not e!63873))))

(declare-fun isPrefixOf!0 (BitStream!3640 BitStream!3640) Bool)

(assert (=> b!97504 (= res!79997 (isPrefixOf!0 thiss!1288 (_2!4154 lt!141279)))))

(declare-fun res!79995 () Bool)

(assert (=> start!19554 (=> (not res!79995) (not e!63875))))

(assert (=> start!19554 (= res!79995 (and (bvsge nBits!388 #b00000000000000000000000000000000) (bvsle nBits!388 #b00000000000000000000000001000000)))))

(assert (=> start!19554 e!63875))

(assert (=> start!19554 true))

(declare-fun inv!12 (BitStream!3640) Bool)

(assert (=> start!19554 (and (inv!12 thiss!1288) e!63876)))

(assert (= (and start!19554 res!79995) b!97505))

(assert (= (and b!97505 res!79998) b!97502))

(assert (= (and b!97502 res!79999) b!97503))

(assert (= (and b!97503 res!80000) b!97508))

(assert (= (and b!97508 res!79996) b!97504))

(assert (= (and b!97504 res!79997) b!97506))

(assert (= start!19554 b!97507))

(declare-fun m!141781 () Bool)

(assert (=> b!97507 m!141781))

(declare-fun m!141783 () Bool)

(assert (=> b!97503 m!141783))

(declare-fun m!141785 () Bool)

(assert (=> start!19554 m!141785))

(declare-fun m!141787 () Bool)

(assert (=> b!97506 m!141787))

(declare-fun m!141789 () Bool)

(assert (=> b!97508 m!141789))

(declare-fun m!141791 () Bool)

(assert (=> b!97508 m!141791))

(declare-fun m!141793 () Bool)

(assert (=> b!97505 m!141793))

(declare-fun m!141795 () Bool)

(assert (=> b!97502 m!141795))

(declare-fun m!141797 () Bool)

(assert (=> b!97504 m!141797))

(push 1)

(assert (not b!97508))

(assert (not b!97506))

(assert (not b!97503))

(assert (not b!97505))

(assert (not b!97504))

(assert (not start!19554))

(assert (not b!97507))

(assert (not b!97502))

(check-sat)

(pop 1)

(push 1)

(check-sat)

