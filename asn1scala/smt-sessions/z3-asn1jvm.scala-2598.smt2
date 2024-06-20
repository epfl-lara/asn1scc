; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!64422 () Bool)

(assert start!64422)

(declare-fun b!289086 () Bool)

(declare-fun res!238868 () Bool)

(declare-fun e!205610 () Bool)

(assert (=> b!289086 (=> (not res!238868) (not e!205610))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!289086 (= res!238868 (bvslt from!505 to!474))))

(declare-fun b!289087 () Bool)

(declare-fun e!205608 () Bool)

(assert (=> b!289087 (= e!205610 e!205608)))

(declare-fun res!238867 () Bool)

(assert (=> b!289087 (=> (not res!238867) (not e!205608))))

(declare-datatypes ((array!17089 0))(
  ( (array!17090 (arr!8387 (Array (_ BitVec 32) (_ BitVec 8))) (size!7391 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!12792 0))(
  ( (BitStream!12793 (buf!7457 array!17089) (currentByte!13852 (_ BitVec 32)) (currentBit!13847 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!12792)

(declare-fun nBits!523 () (_ BitVec 64))

(declare-datatypes ((tuple2!22640 0))(
  ( (tuple2!22641 (_1!12514 Bool) (_2!12514 BitStream!12792)) )
))
(declare-fun lt!418974 () tuple2!22640)

(assert (=> b!289087 (= res!238867 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!523 from!505)) (= (size!7391 (buf!7457 thiss!1728)) (size!7391 (buf!7457 (_2!12514 lt!418974))))))))

(declare-fun readBit!0 (BitStream!12792) tuple2!22640)

(assert (=> b!289087 (= lt!418974 (readBit!0 thiss!1728))))

(declare-fun b!289088 () Bool)

(assert (=> b!289088 (= e!205608 false)))

(declare-fun lt!418973 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!289088 (= lt!418973 (bitIndex!0 (size!7391 (buf!7457 (_2!12514 lt!418974))) (currentByte!13852 (_2!12514 lt!418974)) (currentBit!13847 (_2!12514 lt!418974))))))

(declare-fun lt!418972 () (_ BitVec 64))

(assert (=> b!289088 (= lt!418972 (bitIndex!0 (size!7391 (buf!7457 thiss!1728)) (currentByte!13852 thiss!1728) (currentBit!13847 thiss!1728)))))

(declare-fun b!289089 () Bool)

(declare-fun res!238866 () Bool)

(assert (=> b!289089 (=> (not res!238866) (not e!205610))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!289089 (= res!238866 (validate_offset_bits!1 ((_ sign_extend 32) (size!7391 (buf!7457 thiss!1728))) ((_ sign_extend 32) (currentByte!13852 thiss!1728)) ((_ sign_extend 32) (currentBit!13847 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!289085 () Bool)

(declare-fun e!205607 () Bool)

(declare-fun array_inv!7003 (array!17089) Bool)

(assert (=> b!289085 (= e!205607 (array_inv!7003 (buf!7457 thiss!1728)))))

(declare-fun res!238865 () Bool)

(assert (=> start!64422 (=> (not res!238865) (not e!205610))))

(declare-fun arr!273 () array!17089)

(assert (=> start!64422 (= res!238865 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7391 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!64422 e!205610))

(declare-fun inv!12 (BitStream!12792) Bool)

(assert (=> start!64422 (and (inv!12 thiss!1728) e!205607)))

(assert (=> start!64422 true))

(assert (=> start!64422 (array_inv!7003 arr!273)))

(assert (= (and start!64422 res!238865) b!289089))

(assert (= (and b!289089 res!238866) b!289086))

(assert (= (and b!289086 res!238868) b!289087))

(assert (= (and b!289087 res!238867) b!289088))

(assert (= start!64422 b!289085))

(declare-fun m!421803 () Bool)

(assert (=> b!289089 m!421803))

(declare-fun m!421805 () Bool)

(assert (=> b!289085 m!421805))

(declare-fun m!421807 () Bool)

(assert (=> b!289088 m!421807))

(declare-fun m!421809 () Bool)

(assert (=> b!289088 m!421809))

(declare-fun m!421811 () Bool)

(assert (=> b!289087 m!421811))

(declare-fun m!421813 () Bool)

(assert (=> start!64422 m!421813))

(declare-fun m!421815 () Bool)

(assert (=> start!64422 m!421815))

(check-sat (not b!289087) (not start!64422) (not b!289089) (not b!289088) (not b!289085))
