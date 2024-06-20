; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!51480 () Bool)

(assert start!51480)

(declare-fun res!199887 () Bool)

(declare-fun e!165536 () Bool)

(assert (=> start!51480 (=> (not res!199887) (not e!165536))))

(declare-datatypes ((array!12893 0))(
  ( (array!12894 (arr!6644 (Array (_ BitVec 32) (_ BitVec 8))) (size!5657 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10236 0))(
  ( (BitStream!10237 (buf!6111 array!12893) (currentByte!11351 (_ BitVec 32)) (currentBit!11346 (_ BitVec 32))) )
))
(declare-fun thiss!1854 () BitStream!10236)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> start!51480 (= res!199887 (validate_offset_bits!1 ((_ sign_extend 32) (size!5657 (buf!6111 thiss!1854))) ((_ sign_extend 32) (currentByte!11351 thiss!1854)) ((_ sign_extend 32) (currentBit!11346 thiss!1854)) #b0000000000000000000000000000000000000000000000000000000000001000))))

(assert (=> start!51480 e!165536))

(declare-fun e!165534 () Bool)

(declare-fun inv!12 (BitStream!10236) Bool)

(assert (=> start!51480 (and (inv!12 thiss!1854) e!165534)))

(declare-fun b!239266 () Bool)

(declare-fun lt!374007 () (_ BitVec 32))

(assert (=> b!239266 (= e!165536 (and (not (= #b00000000000000000000000000000000 (bvand lt!374007 #b10000000000000000000000000000000))) (not (= #b00000000000000000000000000000000 (bvand (bvsub #b00000000000000000000000000001000 lt!374007) #b10000000000000000000000000000000)))))))

(assert (=> b!239266 (= lt!374007 ((_ sign_extend 24) ((_ extract 7 0) (currentBit!11346 thiss!1854))))))

(declare-fun b!239267 () Bool)

(declare-fun array_inv!5398 (array!12893) Bool)

(assert (=> b!239267 (= e!165534 (array_inv!5398 (buf!6111 thiss!1854)))))

(assert (= (and start!51480 res!199887) b!239266))

(assert (= start!51480 b!239267))

(declare-fun m!361387 () Bool)

(assert (=> start!51480 m!361387))

(declare-fun m!361389 () Bool)

(assert (=> start!51480 m!361389))

(declare-fun m!361391 () Bool)

(assert (=> b!239267 m!361391))

(check-sat (not start!51480) (not b!239267))
(check-sat)
