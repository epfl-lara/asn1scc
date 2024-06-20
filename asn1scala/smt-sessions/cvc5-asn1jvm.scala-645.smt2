; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!18052 () Bool)

(assert start!18052)

(declare-fun b!88816 () Bool)

(declare-fun e!58746 () Bool)

(declare-datatypes ((array!4191 0))(
  ( (array!4192 (arr!2529 (Array (_ BitVec 32) (_ BitVec 8))) (size!1892 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3346 0))(
  ( (BitStream!3347 (buf!2282 array!4191) (currentByte!4524 (_ BitVec 32)) (currentBit!4519 (_ BitVec 32))) )
))
(declare-fun thiss!1152 () BitStream!3346)

(declare-fun array_inv!1738 (array!4191) Bool)

(assert (=> b!88816 (= e!58746 (array_inv!1738 (buf!2282 thiss!1152)))))

(declare-fun b!88817 () Bool)

(declare-fun e!58742 () Bool)

(declare-fun i!576 () (_ BitVec 32))

(declare-fun nBits!336 () (_ BitVec 32))

(assert (=> b!88817 (= e!58742 (and (bvslt i!576 nBits!336) (or (bvslt ((_ sign_extend 32) i!576) #b0000000000000000000000000000000000000000000000000000000000000000) (bvsgt ((_ sign_extend 32) i!576) #b0000000000000000000000000000000000000000000000000000000001000000))))))

(declare-fun b!88818 () Bool)

(declare-fun res!73122 () Bool)

(assert (=> b!88818 (=> (not res!73122) (not e!58742))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!88818 (= res!73122 (validate_offset_bits!1 ((_ sign_extend 32) (size!1892 (buf!2282 thiss!1152))) ((_ sign_extend 32) (currentByte!4524 thiss!1152)) ((_ sign_extend 32) (currentBit!4519 thiss!1152)) ((_ sign_extend 32) (bvsub nBits!336 i!576))))))

(declare-fun b!88819 () Bool)

(declare-fun res!73119 () Bool)

(assert (=> b!88819 (=> (not res!73119) (not e!58742))))

(declare-fun thiss!1151 () BitStream!3346)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!88819 (= res!73119 (= (bitIndex!0 (size!1892 (buf!2282 thiss!1152)) (currentByte!4524 thiss!1152) (currentBit!4519 thiss!1152)) (bvadd (bitIndex!0 (size!1892 (buf!2282 thiss!1151)) (currentByte!4524 thiss!1151) (currentBit!4519 thiss!1151)) ((_ sign_extend 32) i!576))))))

(declare-fun res!73126 () Bool)

(assert (=> start!18052 (=> (not res!73126) (not e!58742))))

(assert (=> start!18052 (= res!73126 (and (bvsge nBits!336 #b00000000000000000000000000000000) (bvsle nBits!336 #b00000000000000000000000001000000)))))

(assert (=> start!18052 e!58742))

(assert (=> start!18052 true))

(declare-fun e!58743 () Bool)

(declare-fun inv!12 (BitStream!3346) Bool)

(assert (=> start!18052 (and (inv!12 thiss!1151) e!58743)))

(assert (=> start!18052 (and (inv!12 thiss!1152) e!58746)))

(declare-fun b!88820 () Bool)

(declare-fun res!73123 () Bool)

(assert (=> b!88820 (=> (not res!73123) (not e!58742))))

(assert (=> b!88820 (= res!73123 (and (bvsle i!576 nBits!336) (= (size!1892 (buf!2282 thiss!1152)) (size!1892 (buf!2282 thiss!1151)))))))

(declare-fun b!88821 () Bool)

(declare-fun res!73125 () Bool)

(assert (=> b!88821 (=> (not res!73125) (not e!58742))))

(assert (=> b!88821 (= res!73125 (bvsge i!576 #b00000000000000000000000000000000))))

(declare-fun b!88822 () Bool)

(declare-fun res!73124 () Bool)

(assert (=> b!88822 (=> (not res!73124) (not e!58742))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!88822 (= res!73124 (invariant!0 (currentBit!4519 thiss!1152) (currentByte!4524 thiss!1152) (size!1892 (buf!2282 thiss!1152))))))

(declare-fun b!88823 () Bool)

(declare-fun res!73121 () Bool)

(assert (=> b!88823 (=> (not res!73121) (not e!58742))))

(assert (=> b!88823 (= res!73121 (validate_offset_bits!1 ((_ sign_extend 32) (size!1892 (buf!2282 thiss!1151))) ((_ sign_extend 32) (currentByte!4524 thiss!1151)) ((_ sign_extend 32) (currentBit!4519 thiss!1151)) ((_ sign_extend 32) nBits!336)))))

(declare-fun b!88824 () Bool)

(assert (=> b!88824 (= e!58743 (array_inv!1738 (buf!2282 thiss!1151)))))

(declare-fun b!88825 () Bool)

(declare-fun res!73120 () Bool)

(assert (=> b!88825 (=> (not res!73120) (not e!58742))))

(assert (=> b!88825 (= res!73120 (invariant!0 (currentBit!4519 thiss!1151) (currentByte!4524 thiss!1151) (size!1892 (buf!2282 thiss!1151))))))

(assert (= (and start!18052 res!73126) b!88823))

(assert (= (and b!88823 res!73121) b!88825))

(assert (= (and b!88825 res!73120) b!88821))

(assert (= (and b!88821 res!73125) b!88822))

(assert (= (and b!88822 res!73124) b!88820))

(assert (= (and b!88820 res!73123) b!88819))

(assert (= (and b!88819 res!73119) b!88818))

(assert (= (and b!88818 res!73122) b!88817))

(assert (= start!18052 b!88824))

(assert (= start!18052 b!88816))

(declare-fun m!133859 () Bool)

(assert (=> b!88823 m!133859))

(declare-fun m!133861 () Bool)

(assert (=> b!88819 m!133861))

(declare-fun m!133863 () Bool)

(assert (=> b!88819 m!133863))

(declare-fun m!133865 () Bool)

(assert (=> b!88816 m!133865))

(declare-fun m!133867 () Bool)

(assert (=> b!88825 m!133867))

(declare-fun m!133869 () Bool)

(assert (=> b!88818 m!133869))

(declare-fun m!133871 () Bool)

(assert (=> b!88822 m!133871))

(declare-fun m!133873 () Bool)

(assert (=> b!88824 m!133873))

(declare-fun m!133875 () Bool)

(assert (=> start!18052 m!133875))

(declare-fun m!133877 () Bool)

(assert (=> start!18052 m!133877))

(push 1)

(assert (not b!88825))

(assert (not b!88816))

(assert (not b!88819))

(assert (not b!88823))

(assert (not b!88822))

(assert (not b!88824))

(assert (not start!18052))

(assert (not b!88818))

(check-sat)

(pop 1)

(push 1)

(check-sat)

