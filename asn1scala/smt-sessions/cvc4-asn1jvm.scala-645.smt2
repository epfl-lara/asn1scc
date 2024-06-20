; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18056 () Bool)

(assert start!18056)

(declare-fun b!88876 () Bool)

(declare-fun res!73172 () Bool)

(declare-fun e!58775 () Bool)

(assert (=> b!88876 (=> (not res!73172) (not e!58775))))

(declare-datatypes ((array!4195 0))(
  ( (array!4196 (arr!2531 (Array (_ BitVec 32) (_ BitVec 8))) (size!1894 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3350 0))(
  ( (BitStream!3351 (buf!2284 array!4195) (currentByte!4526 (_ BitVec 32)) (currentBit!4521 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3350)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88876 (= res!73172 (validate_offset_bits!1 ((_ sign_extend 32) (size!1894 (buf!2284 thiss!1152))) ((_ sign_extend 32) (currentByte!4526 thiss!1152)) ((_ sign_extend 32) (currentBit!4521 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88877 () Bool)

(declare-fun e!58776 () Bool)

(declare-fun array_inv!1740 (array!4195) Bool)

(assert (=> b!88877 (= e!58776 (array_inv!1740 (buf!2284 thiss!1152)))))

(declare-fun b!88878 () Bool)

(declare-fun res!73173 () Bool)

(assert (=> b!88878 (=> (not res!73173) (not e!58775))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88878 (= res!73173 (invariant!0 (currentBit!4521 thiss!1152) (currentByte!4526 thiss!1152) (size!1894 (buf!2284 thiss!1152))))))

(declare-fun b!88879 () Bool)

(declare-fun res!73167 () Bool)

(assert (=> b!88879 (=> (not res!73167) (not e!58775))))

(declare-fun thiss!1151 () BitStream!3350)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88879 (= res!73167 (= (bitIndex!0 (size!1894 (buf!2284 thiss!1152)) (currentByte!4526 thiss!1152) (currentBit!4521 thiss!1152)) (bvadd (bitIndex!0 (size!1894 (buf!2284 thiss!1151)) (currentByte!4526 thiss!1151) (currentBit!4521 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun b!88880 () Bool)

(declare-fun res!73174 () Bool)

(assert (=> b!88880 (=> (not res!73174) (not e!58775))))

(assert (=> b!88880 (= res!73174 (and (bvsle i!576 nBits!336) (= (size!1894 (buf!2284 thiss!1152)) (size!1894 (buf!2284 thiss!1151)))))))

(declare-fun b!88881 () Bool)

(declare-fun res!73171 () Bool)

(assert (=> b!88881 (=> (not res!73171) (not e!58775))))

(assert (=> b!88881 (= res!73171 (validate_offset_bits!1 ((_ sign_extend 32) (size!1894 (buf!2284 thiss!1151))) ((_ sign_extend 32) (currentByte!4526 thiss!1151)) ((_ sign_extend 32) (currentBit!4521 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun res!73169 () Bool)

(assert (=> start!18056 (=> (not res!73169) (not e!58775))))

(assert (=> start!18056 (= res!73169 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18056 e!58775))

(assert (=> start!18056 true))

(declare-fun e!58773 () Bool)

(declare-fun inv!12 (BitStream!3350) Bool)

(assert (=> start!18056 (and (inv!12 thiss!1151) e!58773)))

(assert (=> start!18056 (and (inv!12 thiss!1152) e!58776)))

(declare-fun b!88882 () Bool)

(assert (=> b!88882 (= e!58775 (and (bvslt i!576 nBits!336) (or (bvslt ((_ sign_extend 32) i!576) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!576) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun b!88883 () Bool)

(declare-fun res!73170 () Bool)

(assert (=> b!88883 (=> (not res!73170) (not e!58775))))

(assert (=> b!88883 (= res!73170 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88884 () Bool)

(declare-fun res!73168 () Bool)

(assert (=> b!88884 (=> (not res!73168) (not e!58775))))

(assert (=> b!88884 (= res!73168 (invariant!0 (currentBit!4521 thiss!1151) (currentByte!4526 thiss!1151) (size!1894 (buf!2284 thiss!1151))))))

(declare-fun b!88885 () Bool)

(assert (=> b!88885 (= e!58773 (array_inv!1740 (buf!2284 thiss!1151)))))

(assert (= (and start!18056 res!73169) b!88881))

(assert (= (and b!88881 res!73171) b!88884))

(assert (= (and b!88884 res!73168) b!88883))

(assert (= (and b!88883 res!73170) b!88878))

(assert (= (and b!88878 res!73173) b!88880))

(assert (= (and b!88880 res!73174) b!88879))

(assert (= (and b!88879 res!73167) b!88876))

(assert (= (and b!88876 res!73172) b!88882))

(assert (= start!18056 b!88885))

(assert (= start!18056 b!88877))

(declare-fun m!133899 () Bool)

(assert (=> b!88878 m!133899))

(declare-fun m!133901 () Bool)

(assert (=> b!88877 m!133901))

(declare-fun m!133903 () Bool)

(assert (=> start!18056 m!133903))

(declare-fun m!133905 () Bool)

(assert (=> start!18056 m!133905))

(declare-fun m!133907 () Bool)

(assert (=> b!88885 m!133907))

(declare-fun m!133909 () Bool)

(assert (=> b!88884 m!133909))

(declare-fun m!133911 () Bool)

(assert (=> b!88881 m!133911))

(declare-fun m!133913 () Bool)

(assert (=> b!88879 m!133913))

(declare-fun m!133915 () Bool)

(assert (=> b!88879 m!133915))

(declare-fun m!133917 () Bool)

(assert (=> b!88876 m!133917))

(push 1)

(assert (not b!88879))

(assert (not b!88884))

(assert (not b!88881))

(assert (not start!18056))

(assert (not b!88876))

(assert (not b!88878))

(assert (not b!88885))

(assert (not b!88877))

(check-sat)

(pop 1)

(push 1)

(check-sat)

