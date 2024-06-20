; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!63604 () Bool)

(assert start!63604)

(declare-fun res!235250 () Bool)

(declare-fun e!202912 () Bool)

(assert (=> start!63604 (=> (not res!235250) (not e!202912))))

(declare-datatypes ((array!16577 0))(
  ( (array!16578 (arr!8153 (Array (_ BitVec 32) (_ BitVec 8))) (size!7157 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12684 0))(
  ( (BitStream!12685 (buf!7403 array!16577) (currentByte!13717 (_ BitVec 32)) (currentBit!13712 (_ BitVec 32))) )
))
(declare-fun thiss!1929 () BitStream!12684)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!63604 (= res!235250 (validate_offset_bits!1 ((_ sign_extend 32) (size!7157 (buf!7403 thiss!1929))) ((_ sign_extend 32) (currentByte!13717 thiss!1929)) ((_ sign_extend 32) (currentBit!13712 thiss!1929)) ((_ sign_extend 32) (bvand (bvsub #b00000000000000000000000000001000 (currentBit!13712 thiss!1929)) #b00000000000000000000000000000111))))))

(assert (=> start!63604 e!202912))

(declare-fun e!202913 () Bool)

(declare-fun inv!12 (BitStream!12684) Bool)

(assert (=> start!63604 (and (inv!12 thiss!1929) e!202913)))

(declare-fun b!283936 () Bool)

(declare-fun res!235249 () Bool)

(assert (=> b!283936 (=> (not res!235249) (not e!202912))))

(assert (=> b!283936 (= res!235249 (not (= (currentBit!13712 thiss!1929) #b00000000000000000000000000000000)))))

(declare-fun b!283937 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!283937 (= e!202912 (not (invariant!0 (currentBit!13712 thiss!1929) (currentByte!13717 thiss!1929) (size!7157 (buf!7403 thiss!1929)))))))

(declare-fun b!283938 () Bool)

(declare-fun array_inv!6850 (array!16577) Bool)

(assert (=> b!283938 (= e!202913 (array_inv!6850 (buf!7403 thiss!1929)))))

(assert (= (and start!63604 res!235250) b!283936))

(assert (= (and b!283936 res!235249) b!283937))

(assert (= start!63604 b!283938))

(declare-fun m!417059 () Bool)

(assert (=> start!63604 m!417059))

(declare-fun m!417061 () Bool)

(assert (=> start!63604 m!417061))

(declare-fun m!417063 () Bool)

(assert (=> b!283937 m!417063))

(declare-fun m!417065 () Bool)

(assert (=> b!283938 m!417065))

(check-sat (not b!283938) (not b!283937) (not start!63604))
(check-sat)
(get-model)

(declare-fun d!97586 () Bool)

