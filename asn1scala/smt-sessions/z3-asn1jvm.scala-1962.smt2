; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!50896 () Bool)

(assert start!50896)

(declare-fun b!238291 () Bool)

(declare-fun res!199173 () Bool)

(declare-fun e!164606 () Bool)

(assert (=> b!238291 (=> (not res!199173) (not e!164606))))

(declare-fun nBits!581 () (_ BitVec 32))

(declare-fun i!752 () (_ BitVec 32))

(assert (=> b!238291 (= res!199173 (not (= nBits!581 i!752)))))

(declare-fun b!238292 () Bool)

(declare-fun e!164604 () Bool)

(assert (=> b!238292 (= e!164604 e!164606)))

(declare-fun res!199176 () Bool)

(assert (=> b!238292 (=> (not res!199176) (not e!164606))))

(declare-datatypes ((array!12702 0))(
  ( (array!12703 (arr!6566 (Array (_ BitVec 32) (_ BitVec 8))) (size!5579 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10122 0))(
  ( (BitStream!10123 (buf!6054 array!12702) (currentByte!11240 (_ BitVec 32)) (currentBit!11235 (_ BitVec 32))) )
))
(declare-fun thiss!1830 () BitStream!10122)

(declare-fun lt!373207 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!238292 (= res!199176 (validate_offset_bits!1 ((_ sign_extend 32) (size!5579 (buf!6054 thiss!1830))) ((_ sign_extend 32) (currentByte!11240 thiss!1830)) ((_ sign_extend 32) (currentBit!11235 thiss!1830)) lt!373207))))

(assert (=> b!238292 (= lt!373207 ((_ sign_extend 32) (bvsub nBits!581 i!752)))))

(declare-fun res!199177 () Bool)

(assert (=> start!50896 (=> (not res!199177) (not e!164604))))

(assert (=> start!50896 (= res!199177 (and (bvsle #b00000000000000000000000000000000 i!752) (bvsle i!752 nBits!581) (bvsle nBits!581 #b00000000000000000000000001000000)))))

(assert (=> start!50896 e!164604))

(assert (=> start!50896 true))

(declare-fun e!164603 () Bool)

(declare-fun inv!12 (BitStream!10122) Bool)

(assert (=> start!50896 (and (inv!12 thiss!1830) e!164603)))

(declare-fun b!238293 () Bool)

(declare-fun res!199175 () Bool)

(assert (=> b!238293 (=> (not res!199175) (not e!164606))))

(declare-fun acc!170 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238293 (= res!199175 (= (bvand acc!170 (onesLSBLong!0 (bvsub nBits!581 i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!238294 () Bool)

(declare-fun e!164605 () Bool)

(assert (=> b!238294 (= e!164605 (and (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand i!752 #b10000000000000000000000000000000))) (not (= (bvand nBits!581 #b10000000000000000000000000000000) (bvand (bvsub nBits!581 i!752) #b10000000000000000000000000000000)))))))

(declare-fun b!238295 () Bool)

(declare-fun array_inv!5320 (array!12702) Bool)

(assert (=> b!238295 (= e!164603 (array_inv!5320 (buf!6054 thiss!1830)))))

(declare-fun b!238296 () Bool)

(declare-fun res!199178 () Bool)

(assert (=> b!238296 (=> (not res!199178) (not e!164605))))

(declare-datatypes ((tuple2!20110 0))(
  ( (tuple2!20111 (_1!10959 (_ BitVec 64)) (_2!10959 BitStream!10122)) )
))
(declare-fun lt!373208 () tuple2!20110)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!238296 (= res!199178 (= (bitIndex!0 (size!5579 (buf!6054 (_2!10959 lt!373208))) (currentByte!11240 (_2!10959 lt!373208)) (currentBit!11235 (_2!10959 lt!373208))) (bvadd (bitIndex!0 (size!5579 (buf!6054 thiss!1830)) (currentByte!11240 thiss!1830) (currentBit!11235 thiss!1830)) lt!373207)))))

(declare-fun b!238297 () Bool)

(assert (=> b!238297 (= e!164606 e!164605)))

(declare-fun res!199179 () Bool)

(assert (=> b!238297 (=> (not res!199179) (not e!164605))))

(assert (=> b!238297 (= res!199179 (= (buf!6054 (_2!10959 lt!373208)) (buf!6054 thiss!1830)))))

(declare-datatypes ((tuple2!20112 0))(
  ( (tuple2!20113 (_1!10960 Bool) (_2!10960 BitStream!10122)) )
))
(declare-fun lt!373209 () tuple2!20112)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!10122 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!20110)

(assert (=> b!238297 (= lt!373208 (readNLeastSignificantBitsLoop!0 (_2!10960 lt!373209) nBits!581 (bvadd #b00000000000000000000000000000001 i!752) (bvor acc!170 (ite (_1!10960 lt!373209) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!581 #b00000000000000000000000000000001) i!752))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun readBit!0 (BitStream!10122) tuple2!20112)

(assert (=> b!238297 (= lt!373209 (readBit!0 thiss!1830))))

(declare-fun b!238298 () Bool)

(declare-fun res!199174 () Bool)

(assert (=> b!238298 (=> (not res!199174) (not e!164606))))

(assert (=> b!238298 (= res!199174 (= (bvand acc!170 (onesLSBLong!0 nBits!581)) acc!170))))

(assert (= (and start!50896 res!199177) b!238292))

(assert (= (and b!238292 res!199176) b!238293))

(assert (= (and b!238293 res!199175) b!238298))

(assert (= (and b!238298 res!199174) b!238291))

(assert (= (and b!238291 res!199173) b!238297))

(assert (= (and b!238297 res!199179) b!238296))

(assert (= (and b!238296 res!199178) b!238294))

(assert (= start!50896 b!238295))

(declare-fun m!360465 () Bool)

(assert (=> start!50896 m!360465))

(declare-fun m!360467 () Bool)

(assert (=> b!238293 m!360467))

(declare-fun m!360469 () Bool)

(assert (=> b!238292 m!360469))

(declare-fun m!360471 () Bool)

(assert (=> b!238296 m!360471))

(declare-fun m!360473 () Bool)

(assert (=> b!238296 m!360473))

(declare-fun m!360475 () Bool)

(assert (=> b!238298 m!360475))

(declare-fun m!360477 () Bool)

(assert (=> b!238295 m!360477))

(declare-fun m!360479 () Bool)

(assert (=> b!238297 m!360479))

(declare-fun m!360481 () Bool)

(assert (=> b!238297 m!360481))

(check-sat (not b!238296) (not b!238295) (not b!238293) (not b!238292) (not start!50896) (not b!238297) (not b!238298))
(check-sat)
