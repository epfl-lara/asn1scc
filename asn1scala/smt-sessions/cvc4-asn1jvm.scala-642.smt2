; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18038 () Bool)

(assert start!18038)

(declare-fun b!88616 () Bool)

(declare-fun e!58632 () Bool)

(declare-datatypes ((array!4177 0))(
  ( (array!4178 (arr!2522 (Array (_ BitVec 32) (_ BitVec 8))) (size!1885 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3332 0))(
  ( (BitStream!3333 (buf!2275 array!4177) (currentByte!4517 (_ BitVec 32)) (currentBit!4512 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3332)

(declare-fun array_inv!1731 (array!4177) Bool)

(assert (=> b!88616 (= e!58632 (array_inv!1731 (buf!2275 thiss!1152)))))

(declare-fun b!88617 () Bool)

(declare-fun res!72961 () Bool)

(declare-fun e!58628 () Bool)

(assert (=> b!88617 (=> (not res!72961) (not e!58628))))

(declare-fun thiss!1151 () BitStream!3332)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88617 (= res!72961 (invariant!0 (currentBit!4512 thiss!1151) (currentByte!4517 thiss!1151) (size!1885 (buf!2275 thiss!1151))))))

(declare-fun b!88618 () Bool)

(declare-fun res!72966 () Bool)

(assert (=> b!88618 (=> (not res!72966) (not e!58628))))

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!88618 (= res!72966 (and (bvsle i!576 nBits!336) (= (size!1885 (buf!2275 thiss!1152)) (size!1885 (buf!2275 thiss!1151)))))))

(declare-fun b!88619 () Bool)

(declare-fun res!72965 () Bool)

(assert (=> b!88619 (=> (not res!72965) (not e!58628))))

(assert (=> b!88619 (= res!72965 (invariant!0 (currentBit!4512 thiss!1152) (currentByte!4517 thiss!1152) (size!1885 (buf!2275 thiss!1152))))))

(declare-fun b!88620 () Bool)

(assert (=> b!88620 (= e!58628 (and (not (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand i!576 #b10000000000000000000000000000000))) (not (= (bvand nBits!336 #b10000000000000000000000000000000) (bvand (bvsub nBits!336 i!576) #b10000000000000000000000000000000)))))))

(declare-fun res!72967 () Bool)

(assert (=> start!18038 (=> (not res!72967) (not e!58628))))

(assert (=> start!18038 (= res!72967 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18038 e!58628))

(assert (=> start!18038 true))

(declare-fun e!58631 () Bool)

(declare-fun inv!12 (BitStream!3332) Bool)

(assert (=> start!18038 (and (inv!12 thiss!1151) e!58631)))

(assert (=> start!18038 (and (inv!12 thiss!1152) e!58632)))

(declare-fun b!88621 () Bool)

(declare-fun res!72963 () Bool)

(assert (=> b!88621 (=> (not res!72963) (not e!58628))))

(assert (=> b!88621 (= res!72963 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88622 () Bool)

(declare-fun res!72962 () Bool)

(assert (=> b!88622 (=> (not res!72962) (not e!58628))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88622 (= res!72962 (= (bitIndex!0 (size!1885 (buf!2275 thiss!1152)) (currentByte!4517 thiss!1152) (currentBit!4512 thiss!1152)) (bvadd (bitIndex!0 (size!1885 (buf!2275 thiss!1151)) (currentByte!4517 thiss!1151) (currentBit!4512 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!88623 () Bool)

(assert (=> b!88623 (= e!58631 (array_inv!1731 (buf!2275 thiss!1151)))))

(declare-fun b!88624 () Bool)

(declare-fun res!72964 () Bool)

(assert (=> b!88624 (=> (not res!72964) (not e!58628))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88624 (= res!72964 (validate_offset_bits!1 ((_ sign_extend 32) (size!1885 (buf!2275 thiss!1151))) ((_ sign_extend 32) (currentByte!4517 thiss!1151)) ((_ sign_extend 32) (currentBit!4512 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(assert (= (and start!18038 res!72967) b!88624))

(assert (= (and b!88624 res!72964) b!88617))

(assert (= (and b!88617 res!72961) b!88621))

(assert (= (and b!88621 res!72963) b!88619))

(assert (= (and b!88619 res!72965) b!88618))

(assert (= (and b!88618 res!72966) b!88622))

(assert (= (and b!88622 res!72962) b!88620))

(assert (= start!18038 b!88623))

(assert (= start!18038 b!88616))

(declare-fun m!133727 () Bool)

(assert (=> b!88619 m!133727))

(declare-fun m!133729 () Bool)

(assert (=> start!18038 m!133729))

(declare-fun m!133731 () Bool)

(assert (=> start!18038 m!133731))

(declare-fun m!133733 () Bool)

(assert (=> b!88622 m!133733))

(declare-fun m!133735 () Bool)

(assert (=> b!88622 m!133735))

(declare-fun m!133737 () Bool)

(assert (=> b!88617 m!133737))

(declare-fun m!133739 () Bool)

(assert (=> b!88623 m!133739))

(declare-fun m!133741 () Bool)

(assert (=> b!88624 m!133741))

(declare-fun m!133743 () Bool)

(assert (=> b!88616 m!133743))

(push 1)

(assert (not b!88624))

(assert (not b!88617))

(assert (not b!88619))

(assert (not b!88622))

(assert (not b!88623))

(assert (not start!18038))

(assert (not b!88616))

(check-sat)

(pop 1)

(push 1)

(check-sat)

