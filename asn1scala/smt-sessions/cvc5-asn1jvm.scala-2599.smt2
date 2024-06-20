; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!64426 () Bool)

(assert start!64426)

(declare-fun b!289115 () Bool)

(declare-fun e!205638 () Bool)

(declare-fun e!205639 () Bool)

(assert (=> b!289115 (= e!205638 e!205639)))

(declare-fun res!238890 () Bool)

(assert (=> b!289115 (=> (not res!238890) (not e!205639))))

(declare-datatypes ((array!17093 0))(
  ( (array!17094 (arr!8389 (Array (_ BitVec 32) (_ BitVec 8))) (size!7393 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12796 0))(
  ( (BitStream!12797 (buf!7459 array!17093) (currentByte!13854 (_ BitVec 32)) (currentBit!13849 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12796)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun from!505 () (_ BitVec 64))

(declare-datatypes ((tuple2!22644 0))(
  ( (tuple2!22645 (_1!12516 Bool) (_2!12516 BitStream!12796)) )
))
(declare-fun lt!418991 () tuple2!22644)

(assert (=> b!289115 (= res!238890 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7393 (buf!7459 thiss!1728)) (size!7393 (buf!7459 (_2!12516 lt!418991))))))))

(declare-fun readBit!0 (BitStream!12796) tuple2!22644)

(assert (=> b!289115 (= lt!418991 (readBit!0 thiss!1728))))

(declare-fun b!289116 () Bool)

(assert (=> b!289116 (= e!205639 false)))

(declare-fun lt!418990 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289116 (= lt!418990 (bitIndex!0 (size!7393 (buf!7459 (_2!12516 lt!418991))) (currentByte!13854 (_2!12516 lt!418991)) (currentBit!13849 (_2!12516 lt!418991))))))

(declare-fun lt!418992 () (_ BitVec 64))

(assert (=> b!289116 (= lt!418992 (bitIndex!0 (size!7393 (buf!7459 thiss!1728)) (currentByte!13854 thiss!1728) (currentBit!13849 thiss!1728)))))

(declare-fun b!289117 () Bool)

(declare-fun res!238892 () Bool)

(assert (=> b!289117 (=> (not res!238892) (not e!205638))))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289117 (= res!238892 (bvslt from!505 to!474))))

(declare-fun res!238891 () Bool)

(assert (=> start!64426 (=> (not res!238891) (not e!205638))))

(declare-fun arr!273 () array!17093)

(assert (=> start!64426 (= res!238891 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7393 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64426 e!205638))

(declare-fun e!205637 () Bool)

(declare-fun inv!12 (BitStream!12796) Bool)

(assert (=> start!64426 (and (inv!12 thiss!1728) e!205637)))

(assert (=> start!64426 true))

(declare-fun array_inv!7005 (array!17093) Bool)

(assert (=> start!64426 (array_inv!7005 arr!273)))

(declare-fun b!289118 () Bool)

(declare-fun res!238889 () Bool)

(assert (=> b!289118 (=> (not res!238889) (not e!205638))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289118 (= res!238889 (validate_offset_bits!1 ((_ sign_extend 32) (size!7393 (buf!7459 thiss!1728))) ((_ sign_extend 32) (currentByte!13854 thiss!1728)) ((_ sign_extend 32) (currentBit!13849 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289119 () Bool)

(assert (=> b!289119 (= e!205637 (array_inv!7005 (buf!7459 thiss!1728)))))

(assert (= (and start!64426 res!238891) b!289118))

(assert (= (and b!289118 res!238889) b!289117))

(assert (= (and b!289117 res!238892) b!289115))

(assert (= (and b!289115 res!238890) b!289116))

(assert (= start!64426 b!289119))

(declare-fun m!421831 () Bool)

(assert (=> b!289116 m!421831))

(declare-fun m!421833 () Bool)

(assert (=> b!289116 m!421833))

(declare-fun m!421835 () Bool)

(assert (=> start!64426 m!421835))

(declare-fun m!421837 () Bool)

(assert (=> start!64426 m!421837))

(declare-fun m!421839 () Bool)

(assert (=> b!289115 m!421839))

(declare-fun m!421841 () Bool)

(assert (=> b!289118 m!421841))

(declare-fun m!421843 () Bool)

(assert (=> b!289119 m!421843))

(push 1)

(assert (not b!289115))

(assert (not b!289118))

(assert (not b!289119))

(assert (not start!64426))

(assert (not b!289116))

(check-sat)

