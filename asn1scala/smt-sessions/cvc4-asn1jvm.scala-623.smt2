; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!17672 () Bool)

(assert start!17672)

(declare-fun res!69900 () Bool)

(declare-fun e!56775 () Bool)

(assert (=> start!17672 (=> (not res!69900) (not e!56775))))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> start!17672 (= res!69900 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!17672 e!56775))

(assert (=> start!17672 true))

(declare-datatypes ((array!4048 0))(
  ( (array!4049 (arr!2465 (Array (_ BitVec 32) (_ BitVec 8))) (size!1828 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3218 0))(
  ( (BitStream!3219 (buf!2218 array!4048) (currentByte!4415 (_ BitVec 32)) (currentBit!4410 (_ BitVec 32))) )
))
(declare-fun thiss!1151 () BitStream!3218)

(declare-fun e!56774 () Bool)

(declare-fun inv!12 (BitStream!3218) Bool)

(assert (=> start!17672 (and (inv!12 thiss!1151) e!56774)))

(declare-fun thiss!1152 () BitStream!3218)

(declare-fun e!56773 () Bool)

(assert (=> start!17672 (and (inv!12 thiss!1152) e!56773)))

(declare-fun b!85195 () Bool)

(declare-fun res!69903 () Bool)

(assert (=> b!85195 (=> (not res!69903) (not e!56775))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!85195 (= res!69903 (invariant!0 (currentBit!4410 thiss!1151) (currentByte!4415 thiss!1151) (size!1828 (buf!2218 thiss!1151))))))

(declare-fun b!85196 () Bool)

(declare-fun array_inv!1674 (array!4048) Bool)

(assert (=> b!85196 (= e!56773 (array_inv!1674 (buf!2218 thiss!1152)))))

(declare-fun b!85197 () Bool)

(declare-fun res!69902 () Bool)

(assert (=> b!85197 (=> (not res!69902) (not e!56775))))

(declare-fun i!576 () (_ BitVec 32))

(assert (=> b!85197 (= res!69902 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!85198 () Bool)

(assert (=> b!85198 (= e!56774 (array_inv!1674 (buf!2218 thiss!1151)))))

(declare-fun b!85199 () Bool)

(declare-fun res!69906 () Bool)

(assert (=> b!85199 (=> (not res!69906) (not e!56775))))

(assert (=> b!85199 (= res!69906 (and (bvsle i!576 nBits!336) (= (size!1828 (buf!2218 thiss!1152)) (size!1828 (buf!2218 thiss!1151)))))))

(declare-fun b!85200 () Bool)

(assert (=> b!85200 (= e!56775 (not (invariant!0 ((_ extract 31 0) ((_ sign_extend 32) (currentBit!4410 thiss!1152))) ((_ extract 31 0) ((_ sign_extend 32) (currentByte!4415 thiss!1152))) ((_ extract 31 0) ((_ sign_extend 32) (size!1828 (buf!2218 thiss!1152)))))))))

(declare-fun b!85201 () Bool)

(declare-fun res!69907 () Bool)

(assert (=> b!85201 (=> (not res!69907) (not e!56775))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!85201 (= res!69907 (= (bitIndex!0 (size!1828 (buf!2218 thiss!1152)) (currentByte!4415 thiss!1152) (currentBit!4410 thiss!1152)) (bvadd (bitIndex!0 (size!1828 (buf!2218 thiss!1151)) (currentByte!4415 thiss!1151) (currentBit!4410 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!85202 () Bool)

(declare-fun res!69904 () Bool)

(assert (=> b!85202 (=> (not res!69904) (not e!56775))))

(assert (=> b!85202 (= res!69904 (invariant!0 (currentBit!4410 thiss!1152) (currentByte!4415 thiss!1152) (size!1828 (buf!2218 thiss!1152))))))

(declare-fun b!85203 () Bool)

(declare-fun res!69905 () Bool)

(assert (=> b!85203 (=> (not res!69905) (not e!56775))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!85203 (= res!69905 (validate_offset_bits!1 ((_ sign_extend 32) (size!1828 (buf!2218 thiss!1151))) ((_ sign_extend 32) (currentByte!4415 thiss!1151)) ((_ sign_extend 32) (currentBit!4410 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!85204 () Bool)

(declare-fun res!69901 () Bool)

(assert (=> b!85204 (=> (not res!69901) (not e!56775))))

(assert (=> b!85204 (= res!69901 (and (bvsle ((_ sign_extend 32) (size!1828 (buf!2218 thiss!1152))) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentByte!4415 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsle ((_ sign_extend 32) (currentBit!4410 thiss!1152)) #b0000000000000000000000000000000001111111111111111111111111111111) (bvsge ((_ sign_extend 32) (size!1828 (buf!2218 thiss!1152))) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentByte!4415 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge ((_ sign_extend 32) (currentBit!4410 thiss!1152)) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!17672 res!69900) b!85203))

(assert (= (and b!85203 res!69905) b!85195))

(assert (= (and b!85195 res!69903) b!85197))

(assert (= (and b!85197 res!69902) b!85202))

(assert (= (and b!85202 res!69904) b!85199))

(assert (= (and b!85199 res!69906) b!85201))

(assert (= (and b!85201 res!69907) b!85204))

(assert (= (and b!85204 res!69901) b!85200))

(assert (= start!17672 b!85198))

(assert (= start!17672 b!85196))

(declare-fun m!131445 () Bool)

(assert (=> b!85195 m!131445))

(declare-fun m!131447 () Bool)

(assert (=> b!85198 m!131447))

(declare-fun m!131449 () Bool)

(assert (=> b!85203 m!131449))

(declare-fun m!131451 () Bool)

(assert (=> b!85202 m!131451))

(declare-fun m!131453 () Bool)

(assert (=> b!85200 m!131453))

(declare-fun m!131455 () Bool)

(assert (=> b!85196 m!131455))

(declare-fun m!131457 () Bool)

(assert (=> start!17672 m!131457))

(declare-fun m!131459 () Bool)

(assert (=> start!17672 m!131459))

(declare-fun m!131461 () Bool)

(assert (=> b!85201 m!131461))

(declare-fun m!131463 () Bool)

(assert (=> b!85201 m!131463))

(push 1)

(assert (not b!85196))

(assert (not b!85200))

(assert (not b!85203))

(assert (not b!85198))

(assert (not b!85202))

(assert (not b!85195))

(assert (not b!85201))

(assert (not start!17672))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

