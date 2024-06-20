; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!65320 () Bool)

(assert start!65320)

(declare-fun b!293016 () Bool)

(declare-fun e!209148 () Bool)

(declare-datatypes ((array!17468 0))(
  ( (array!17469 (arr!8593 (Array (_ BitVec 32) (_ BitVec 8))) (size!7567 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!13138 0))(
  ( (BitStream!13139 (buf!7630 array!17468) (currentByte!14094 (_ BitVec 32)) (currentBit!14089 (_ BitVec 32))) )
))
(declare-fun thiss!1728 () BitStream!13138)

(declare-fun array_inv!7179 (array!17468) Bool)

(assert (=> b!293016 (= e!209148 (array_inv!7179 (buf!7630 thiss!1728)))))

(declare-fun b!293014 () Bool)

(declare-fun res!241986 () Bool)

(declare-fun e!209150 () Bool)

(assert (=> b!293014 (=> (not res!241986) (not e!209150))))

(declare-fun from!505 () (_ BitVec 64))

(declare-fun to!474 () (_ BitVec 64))

(assert (=> b!293014 (= res!241986 (bvslt from!505 to!474))))

(declare-fun b!293013 () Bool)

(declare-fun res!241987 () Bool)

(assert (=> b!293013 (=> (not res!241987) (not e!209150))))

(declare-fun nBits!523 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!293013 (= res!241987 (validate_offset_bits!1 ((_ sign_extend 32) (size!7567 (buf!7630 thiss!1728))) ((_ sign_extend 32) (currentByte!14094 thiss!1728)) ((_ sign_extend 32) (currentBit!14089 thiss!1728)) (bvsub nBits!523 from!505)))))

(declare-fun b!293015 () Bool)

(assert (=> b!293015 (= e!209150 (and (bvslt (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b0000000000000000000000000000000010000000000000000000000000000000) (bvslt (bvsdiv from!505 #b0000000000000000000000000000000000000000000000000000000000001000) #b1111111111111111111111111111111110000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22964 0))(
  ( (tuple2!22965 (_1!12787 Bool) (_2!12787 BitStream!13138)) )
))
(declare-fun lt!425160 () tuple2!22964)

(declare-fun readBit!0 (BitStream!13138) tuple2!22964)

(assert (=> b!293015 (= lt!425160 (readBit!0 thiss!1728))))

(declare-fun res!241988 () Bool)

(assert (=> start!65320 (=> (not res!241988) (not e!209150))))

(declare-fun arr!273 () array!17468)

(assert (=> start!65320 (= res!241988 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!523) (bvsle nBits!523 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsge ((_ sign_extend 32) (size!7567 arr!273)) (bvsdiv (bvadd nBits!523 #b0000000000000000000000000000000000000000000000000000000000000111) #b0000000000000000000000000000000000000000000000000000000000001000)) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!505) (bvsle from!505 to!474) (bvsle to!474 nBits!523)))))

(assert (=> start!65320 e!209150))

(declare-fun inv!12 (BitStream!13138) Bool)

(assert (=> start!65320 (and (inv!12 thiss!1728) e!209148)))

(assert (=> start!65320 true))

(assert (=> start!65320 (array_inv!7179 arr!273)))

(assert (= (and start!65320 res!241988) b!293013))

(assert (= (and b!293013 res!241987) b!293014))

(assert (= (and b!293014 res!241986) b!293015))

(assert (= start!65320 b!293016))

(declare-fun m!428605 () Bool)

(assert (=> b!293016 m!428605))

(declare-fun m!428607 () Bool)

(assert (=> b!293013 m!428607))

(declare-fun m!428609 () Bool)

(assert (=> b!293015 m!428609))

(declare-fun m!428611 () Bool)

(assert (=> start!65320 m!428611))

(declare-fun m!428613 () Bool)

(assert (=> start!65320 m!428613))

(push 1)

(assert (not b!293016))

(assert (not start!65320))

(assert (not b!293013))

(assert (not b!293015))

(check-sat)

(pop 1)

(push 1)

(check-sat)

