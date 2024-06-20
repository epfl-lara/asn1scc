; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72052 () Bool)

(assert start!72052)

(declare-fun res!265189 () Bool)

(declare-fun e!232749 () Bool)

(assert (=> start!72052 (=> (not res!265189) (not e!232749))))

(declare-fun i!743 () (_ BitVec 32))

(declare-fun nBits!548 () (_ BitVec 32))

(assert (=> start!72052 (= res!265189 (and (bvsle #b00000000000000000000000000000000 i!743) (bvsle i!743 nBits!548) (bvsle nBits!548 #b00000000000000000000000001000000)))))

(assert (=> start!72052 e!232749))

(assert (=> start!72052 true))

(declare-datatypes ((array!20616 0))(
  ( (array!20617 (arr!10064 (Array (_ BitVec 32) (_ BitVec 8))) (size!8972 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!14106 0))(
  ( (BitStream!14107 (buf!8114 array!20616) (currentByte!14979 (_ BitVec 32)) (currentBit!14974 (_ BitVec 32))) )
))
(declare-fun thiss!1793 () BitStream!14106)

(declare-fun e!232748 () Bool)

(declare-fun inv!12 (BitStream!14106) Bool)

(assert (=> start!72052 (and (inv!12 thiss!1793) e!232748)))

(declare-fun b!323042 () Bool)

(declare-fun res!265188 () Bool)

(assert (=> b!323042 (=> (not res!265188) (not e!232749))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!323042 (= res!265188 (validate_offset_bits!1 ((_ sign_extend 32) (size!8972 (buf!8114 thiss!1793))) ((_ sign_extend 32) (currentByte!14979 thiss!1793)) ((_ sign_extend 32) (currentBit!14974 thiss!1793)) ((_ sign_extend 32) (bvsub nBits!548 i!743))))))

(declare-fun b!323043 () Bool)

(assert (=> b!323043 (= e!232749 (and (not (= #b00000000000000000000000000000000 (bvand i!743 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000001000000 i!743) #b10000000000000000000000000000000)))))))

(declare-fun b!323044 () Bool)

(declare-fun array_inv!8524 (array!20616) Bool)

(assert (=> b!323044 (= e!232748 (array_inv!8524 (buf!8114 thiss!1793)))))

(assert (= (and start!72052 res!265189) b!323042))

(assert (= (and b!323042 res!265188) b!323043))

(assert (= start!72052 b!323044))

(declare-fun m!461253 () Bool)

(assert (=> start!72052 m!461253))

(declare-fun m!461255 () Bool)

(assert (=> b!323042 m!461255))

(declare-fun m!461257 () Bool)

(assert (=> b!323044 m!461257))

(check-sat (not b!323044) (not start!72052) (not b!323042))
(check-sat)
