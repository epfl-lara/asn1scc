; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18106 () Bool)

(assert start!18106)

(declare-fun b!89176 () Bool)

(declare-fun e!58942 () Bool)

(declare-fun e!58935 () Bool)

(assert (=> b!89176 (= e!58942 e!58935)))

(declare-fun res!73428 () Bool)

(assert (=> b!89176 (=> (not res!73428) (not e!58935))))

(declare-fun lt!136428 () (_ BitVec 64))

(declare-fun lt!136424 () (_ BitVec 64))

(assert (=> b!89176 (= res!73428 (= lt!136428 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!136424)))))

(declare-datatypes ((array!4212 0))(
  ( (array!4213 (arr!2538 (Array (_ BitVec 32) (_ BitVec 8))) (size!1901 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3364 0))(
  ( (BitStream!3365 (buf!2291 array!4212) (currentByte!4545 (_ BitVec 32)) (currentBit!4540 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!5785 0))(
  ( (Unit!5786) )
))
(declare-datatypes ((tuple2!7480 0))(
  ( (tuple2!7481 (_1!3973 Unit!5785) (_2!3973 BitStream!3364)) )
))
(declare-fun lt!136425 () tuple2!7480)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!89176 (= lt!136428 (bitIndex!0 (size!1901 (buf!2291 (_2!3973 lt!136425))) (currentByte!4545 (_2!3973 lt!136425)) (currentBit!4540 (_2!3973 lt!136425))))))

(declare-fun b!89177 () Bool)

(declare-fun e!58938 () Bool)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!89177 (= e!58938 (or (bvsge (bvadd #b00000000000000000000000000000001 i!576) nBits!336) (bvslt (bvsub nBits!336 (bvadd #b00000000000000000000000000000001 i!576)) (bvsub nBits!336 i!576))))))

(declare-fun b!89179 () Bool)

(declare-fun res!73425 () Bool)

(declare-fun e!58940 () Bool)

(assert (=> b!89179 (=> (not res!73425) (not e!58940))))

(declare-fun thiss!1152 () BitStream!3364)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!89179 (= res!73425 (invariant!0 (currentBit!4540 thiss!1152) (currentByte!4545 thiss!1152) (size!1901 (buf!2291 thiss!1152))))))

(declare-fun b!89180 () Bool)

(declare-fun res!73427 () Bool)

(declare-fun e!58939 () Bool)

(assert (=> b!89180 (=> (not res!73427) (not e!58939))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!89180 (= res!73427 (validate_offset_bits!1 ((_ sign_extend 32) (size!1901 (buf!2291 thiss!1152))) ((_ sign_extend 32) (currentByte!4545 thiss!1152)) ((_ sign_extend 32) (currentBit!4540 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!89181 () Bool)

(declare-fun e!58944 () Bool)

(assert (=> b!89181 (= e!58935 e!58944)))

(declare-fun res!73429 () Bool)

(assert (=> b!89181 (=> (not res!73429) (not e!58944))))

(declare-fun lt!136426 () Bool)

(declare-datatypes ((tuple2!7482 0))(
  ( (tuple2!7483 (_1!3974 BitStream!3364) (_2!3974 Bool)) )
))
(declare-fun lt!136423 () tuple2!7482)

(assert (=> b!89181 (= res!73429 (and (= (_2!3974 lt!136423) lt!136426) (= (_1!3974 lt!136423) (_2!3973 lt!136425))))))

(declare-fun readBitPure!0 (BitStream!3364) tuple2!7482)

(declare-fun readerFrom!0 (BitStream!3364 (_ BitVec 32) (_ BitVec 32)) BitStream!3364)

(assert (=> b!89181 (= lt!136423 (readBitPure!0 (readerFrom!0 (_2!3973 lt!136425) (currentBit!4540 thiss!1152) (currentByte!4545 thiss!1152))))))

(declare-fun b!89182 () Bool)

(declare-fun e!58936 () Bool)

(declare-fun thiss!1151 () BitStream!3364)

(declare-fun array_inv!1747 (array!4212) Bool)

(assert (=> b!89182 (= e!58936 (array_inv!1747 (buf!2291 thiss!1151)))))

(declare-fun b!89183 () Bool)

(declare-fun e!58937 () Bool)

(assert (=> b!89183 (= e!58937 (array_inv!1747 (buf!2291 thiss!1152)))))

(declare-fun b!89184 () Bool)

(declare-fun res!73435 () Bool)

(assert (=> b!89184 (=> (not res!73435) (not e!58940))))

(assert (=> b!89184 (= res!73435 (validate_offset_bits!1 ((_ sign_extend 32) (size!1901 (buf!2291 thiss!1151))) ((_ sign_extend 32) (currentByte!4545 thiss!1151)) ((_ sign_extend 32) (currentBit!4540 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!89185 () Bool)

(assert (=> b!89185 (= e!58940 e!58939)))

(declare-fun res!73433 () Bool)

(assert (=> b!89185 (=> (not res!73433) (not e!58939))))

(declare-fun lt!136427 () (_ BitVec 64))

(assert (=> b!89185 (= res!73433 (= lt!136424 (bvadd lt!136427 ((_ sign_extend 32) i!576))))))

(assert (=> b!89185 (= lt!136424 (bitIndex!0 (size!1901 (buf!2291 thiss!1152)) (currentByte!4545 thiss!1152) (currentBit!4540 thiss!1152)))))

(assert (=> b!89185 (= lt!136427 (bitIndex!0 (size!1901 (buf!2291 thiss!1151)) (currentByte!4545 thiss!1151) (currentBit!4540 thiss!1151)))))

(declare-fun b!89186 () Bool)

(declare-fun res!73431 () Bool)

(assert (=> b!89186 (=> (not res!73431) (not e!58940))))

(assert (=> b!89186 (= res!73431 (invariant!0 (currentBit!4540 thiss!1151) (currentByte!4545 thiss!1151) (size!1901 (buf!2291 thiss!1151))))))

(declare-fun b!89187 () Bool)

(assert (=> b!89187 (= e!58944 (= (bitIndex!0 (size!1901 (buf!2291 (_1!3974 lt!136423))) (currentByte!4545 (_1!3974 lt!136423)) (currentBit!4540 (_1!3974 lt!136423))) lt!136428))))

(declare-fun res!73437 () Bool)

(assert (=> start!18106 (=> (not res!73437) (not e!58940))))

(assert (=> start!18106 (= res!73437 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18106 e!58940))

(declare-fun inv!12 (BitStream!3364) Bool)

(assert (=> start!18106 (and (inv!12 thiss!1152) e!58937)))

(assert (=> start!18106 (and (inv!12 thiss!1151) e!58936)))

(assert (=> start!18106 true))

(declare-fun b!89178 () Bool)

(assert (=> b!89178 (= e!58939 (not e!58938))))

(declare-fun res!73438 () Bool)

(assert (=> b!89178 (=> res!73438 e!58938)))

(assert (=> b!89178 (= res!73438 (not (invariant!0 (currentBit!4540 (_2!3973 lt!136425)) (currentByte!4545 (_2!3973 lt!136425)) (size!1901 (buf!2291 (_2!3973 lt!136425))))))))

(assert (=> b!89178 e!58942))

(declare-fun res!73430 () Bool)

(assert (=> b!89178 (=> (not res!73430) (not e!58942))))

(assert (=> b!89178 (= res!73430 (= (size!1901 (buf!2291 thiss!1152)) (size!1901 (buf!2291 (_2!3973 lt!136425)))))))

(declare-fun appendBit!0 (BitStream!3364 Bool) tuple2!7480)

(assert (=> b!89178 (= lt!136425 (appendBit!0 thiss!1152 lt!136426))))

(declare-fun v!179 () (_ BitVec 64))

(assert (=> b!89178 (= lt!136426 (not (= (bvand v!179 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) i!576))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!89188 () Bool)

(declare-fun res!73436 () Bool)

(assert (=> b!89188 (=> (not res!73436) (not e!58940))))

(assert (=> b!89188 (= res!73436 (and (bvsle i!576 nBits!336) (= (size!1901 (buf!2291 thiss!1152)) (size!1901 (buf!2291 thiss!1151)))))))

(declare-fun b!89189 () Bool)

(declare-fun res!73426 () Bool)

(assert (=> b!89189 (=> (not res!73426) (not e!58940))))

(assert (=> b!89189 (= res!73426 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!89190 () Bool)

(declare-fun res!73434 () Bool)

(assert (=> b!89190 (=> (not res!73434) (not e!58939))))

(assert (=> b!89190 (= res!73434 (bvslt i!576 nBits!336))))

(declare-fun b!89191 () Bool)

(declare-fun res!73432 () Bool)

(assert (=> b!89191 (=> (not res!73432) (not e!58935))))

(declare-fun isPrefixOf!0 (BitStream!3364 BitStream!3364) Bool)

(assert (=> b!89191 (= res!73432 (isPrefixOf!0 thiss!1152 (_2!3973 lt!136425)))))

(assert (= (and start!18106 res!73437) b!89184))

(assert (= (and b!89184 res!73435) b!89186))

(assert (= (and b!89186 res!73431) b!89189))

(assert (= (and b!89189 res!73426) b!89179))

(assert (= (and b!89179 res!73425) b!89188))

(assert (= (and b!89188 res!73436) b!89185))

(assert (= (and b!89185 res!73433) b!89180))

(assert (= (and b!89180 res!73427) b!89190))

(assert (= (and b!89190 res!73434) b!89178))

(assert (= (and b!89178 res!73430) b!89176))

(assert (= (and b!89176 res!73428) b!89191))

(assert (= (and b!89191 res!73432) b!89181))

(assert (= (and b!89181 res!73429) b!89187))

(assert (= (and b!89178 (not res!73438)) b!89177))

(assert (= start!18106 b!89183))

(assert (= start!18106 b!89182))

(declare-fun m!134093 () Bool)

(assert (=> b!89181 m!134093))

(assert (=> b!89181 m!134093))

(declare-fun m!134095 () Bool)

(assert (=> b!89181 m!134095))

(declare-fun m!134097 () Bool)

(assert (=> b!89182 m!134097))

(declare-fun m!134099 () Bool)

(assert (=> b!89184 m!134099))

(declare-fun m!134101 () Bool)

(assert (=> b!89178 m!134101))

(declare-fun m!134103 () Bool)

(assert (=> b!89178 m!134103))

(declare-fun m!134105 () Bool)

(assert (=> b!89186 m!134105))

(declare-fun m!134107 () Bool)

(assert (=> start!18106 m!134107))

(declare-fun m!134109 () Bool)

(assert (=> start!18106 m!134109))

(declare-fun m!134111 () Bool)

(assert (=> b!89183 m!134111))

(declare-fun m!134113 () Bool)

(assert (=> b!89180 m!134113))

(declare-fun m!134115 () Bool)

(assert (=> b!89179 m!134115))

(declare-fun m!134117 () Bool)

(assert (=> b!89176 m!134117))

(declare-fun m!134119 () Bool)

(assert (=> b!89187 m!134119))

(declare-fun m!134121 () Bool)

(assert (=> b!89185 m!134121))

(declare-fun m!134123 () Bool)

(assert (=> b!89185 m!134123))

(declare-fun m!134125 () Bool)

(assert (=> b!89191 m!134125))

(push 1)

(assert (not b!89180))

(assert (not start!18106))

(assert (not b!89178))

(assert (not b!89182))

(assert (not b!89181))

(assert (not b!89185))

(assert (not b!89176))

(assert (not b!89191))

(assert (not b!89179))

(assert (not b!89184))

(assert (not b!89187))

(assert (not b!89186))

(assert (not b!89183))

(check-sat)

(pop 1)

(push 1)

(check-sat)

