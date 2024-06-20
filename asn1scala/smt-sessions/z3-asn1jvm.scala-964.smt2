; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!27290 () Bool)

(assert start!27290)

(declare-fun res!116824 () Bool)

(declare-fun e!93367 () Bool)

(assert (=> start!27290 (=> (not res!116824) (not e!93367))))

(declare-fun to!404 () (_ BitVec 32))

(declare-datatypes ((array!6383 0))(
  ( (array!6384 (arr!3595 (Array (_ BitVec 32) (_ BitVec 8))) (size!2888 (_ BitVec 32))) )
))
(declare-fun arr!237 () array!6383)

(declare-fun from!447 () (_ BitVec 32))

(assert (=> start!27290 (= res!116824 (and (bvsle #b00000000000000000000000000000000 from!447) (bvsle from!447 to!404) (bvsle to!404 (size!2888 arr!237))))))

(assert (=> start!27290 e!93367))

(assert (=> start!27290 true))

(declare-fun array_inv!2677 (array!6383) Bool)

(assert (=> start!27290 (array_inv!2677 arr!237)))

(declare-datatypes ((BitStream!5034 0))(
  ( (BitStream!5035 (buf!3309 array!6383) (currentByte!6151 (_ BitVec 32)) (currentBit!6146 (_ BitVec 32))) )
))
(declare-fun thiss!1634 () BitStream!5034)

(declare-fun e!93366 () Bool)

(declare-fun inv!12 (BitStream!5034) Bool)

(assert (=> start!27290 (and (inv!12 thiss!1634) e!93366)))

(declare-fun b!140118 () Bool)

(declare-fun res!116823 () Bool)

(assert (=> b!140118 (=> (not res!116823) (not e!93367))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!140118 (= res!116823 (validate_offset_bytes!0 ((_ sign_extend 32) (size!2888 (buf!3309 thiss!1634))) ((_ sign_extend 32) (currentByte!6151 thiss!1634)) ((_ sign_extend 32) (currentBit!6146 thiss!1634)) (bvsub to!404 from!447)))))

(declare-fun b!140119 () Bool)

(assert (=> b!140119 (= e!93367 (and (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand from!447 #b10000000000000000000000000000000))) (not (= (bvand to!404 #b10000000000000000000000000000000) (bvand (bvsub to!404 from!447) #b10000000000000000000000000000000)))))))

(declare-fun b!140120 () Bool)

(assert (=> b!140120 (= e!93366 (array_inv!2677 (buf!3309 thiss!1634)))))

(assert (= (and start!27290 res!116824) b!140118))

(assert (= (and b!140118 res!116823) b!140119))

(assert (= start!27290 b!140120))

(declare-fun m!215947 () Bool)

(assert (=> start!27290 m!215947))

(declare-fun m!215949 () Bool)

(assert (=> start!27290 m!215949))

(declare-fun m!215951 () Bool)

(assert (=> b!140118 m!215951))

(declare-fun m!215953 () Bool)

(assert (=> b!140120 m!215953))

(check-sat (not b!140120) (not b!140118) (not start!27290))
(check-sat)
