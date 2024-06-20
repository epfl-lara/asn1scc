; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!48008 () Bool)

(assert start!48008)

(declare-fun res!191434 () Bool)

(declare-fun e!156340 () Bool)

(assert (=> start!48008 (=> (not res!191434) (not e!156340))))

(declare-datatypes ((array!11504 0))(
  ( (array!11505 (arr!6031 (Array (_ BitVec 32) (_ BitVec 8))) (size!5047 (_ BitVec 32))) )
))
(declare-fun arr!308 () array!11504)

(declare-fun i!761 () (_ BitVec 32))

(declare-fun to!496 () (_ BitVec 32))

(assert (=> start!48008 (= res!191434 (and (bvsle #b00000000000000000000000000000000 i!761) (bvsle i!761 to!496) (bvsle to!496 (size!5047 arr!308))))))

(assert (=> start!48008 e!156340))

(assert (=> start!48008 true))

(declare-fun array_inv!4788 (array!11504) Bool)

(assert (=> start!48008 (array_inv!4788 arr!308)))

(declare-datatypes ((BitStream!9190 0))(
  ( (BitStream!9191 (buf!5588 array!11504) (currentByte!10444 (_ BitVec 32)) (currentBit!10439 (_ BitVec 32))) )
))
(declare-fun thiss!1870 () BitStream!9190)

(declare-fun e!156337 () Bool)

(declare-fun inv!12 (BitStream!9190) Bool)

(assert (=> start!48008 (and (inv!12 thiss!1870) e!156337)))

(declare-fun b!228205 () Bool)

(declare-fun res!191433 () Bool)

(assert (=> b!228205 (=> (not res!191433) (not e!156340))))

(assert (=> b!228205 (= res!191433 (bvslt i!761 to!496))))

(declare-fun b!228204 () Bool)

(declare-fun res!191432 () Bool)

(assert (=> b!228204 (=> (not res!191432) (not e!156340))))

(declare-fun validate_offset_bytes!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!228204 (= res!191432 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5047 (buf!5588 thiss!1870))) ((_ sign_extend 32) (currentByte!10444 thiss!1870)) ((_ sign_extend 32) (currentBit!10439 thiss!1870)) (bvsub to!496 i!761)))))

(declare-fun b!228206 () Bool)

(declare-datatypes ((Unit!17134 0))(
  ( (Unit!17135) )
))
(declare-datatypes ((tuple3!1476 0))(
  ( (tuple3!1477 (_1!10706 Unit!17134) (_2!10706 BitStream!9190) (_3!880 array!11504)) )
))
(declare-fun lt!366009 () tuple3!1476)

(assert (=> b!228206 (= e!156340 (not (bvslt i!761 (size!5047 (_3!880 lt!366009)))))))

(declare-datatypes ((tuple2!19652 0))(
  ( (tuple2!19653 (_1!10707 (_ BitVec 8)) (_2!10707 BitStream!9190)) )
))
(declare-fun lt!366015 () tuple2!19652)

(assert (=> b!228206 (and (= (_1!10707 lt!366015) (select (arr!6031 (_3!880 lt!366009)) i!761)) (= (select (arr!6031 (_3!880 lt!366009)) i!761) (_1!10707 lt!366015)))))

(declare-fun lt!366008 () Unit!17134)

(declare-fun lt!366013 () array!11504)

(declare-fun arrayRangesEqImpliesEq!139 (array!11504 array!11504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17134)

(assert (=> b!228206 (= lt!366008 (arrayRangesEqImpliesEq!139 lt!366013 (_3!880 lt!366009) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(declare-fun arrayRangesEq!883 (array!11504 array!11504 (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!228206 (arrayRangesEq!883 arr!308 (_3!880 lt!366009) #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366011 () Unit!17134)

(declare-fun arrayRangesEqTransitive!306 (array!11504 array!11504 array!11504 (_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Unit!17134)

(assert (=> b!228206 (= lt!366011 (arrayRangesEqTransitive!306 arr!308 lt!366013 (_3!880 lt!366009) #b00000000000000000000000000000000 i!761 (bvadd #b00000000000000000000000000000001 i!761)))))

(assert (=> b!228206 (arrayRangesEq!883 arr!308 lt!366013 #b00000000000000000000000000000000 i!761)))

(declare-fun lt!366005 () Unit!17134)

(declare-fun arrayUpdatedAtPrefixLemma!442 (array!11504 (_ BitVec 32) (_ BitVec 8)) Unit!17134)

(assert (=> b!228206 (= lt!366005 (arrayUpdatedAtPrefixLemma!442 arr!308 i!761 (_1!10707 lt!366015)))))

(declare-fun lt!366006 () (_ BitVec 64))

(declare-fun lt!366012 () (_ BitVec 64))

(declare-fun lt!366014 () (_ BitVec 64))

(declare-fun lt!366010 () (_ BitVec 32))

(assert (=> b!228206 (and (= (bvadd lt!366006 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) lt!366010))) lt!366012) (= (bvadd lt!366014 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (bvsub to!496 i!761)))) lt!366012) (= (buf!5588 thiss!1870) (buf!5588 (_2!10706 lt!366009))) (= (size!5047 arr!308) (size!5047 (_3!880 lt!366009))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!228206 (= lt!366012 (bitIndex!0 (size!5047 (buf!5588 (_2!10706 lt!366009))) (currentByte!10444 (_2!10706 lt!366009)) (currentBit!10439 (_2!10706 lt!366009))))))

(assert (=> b!228206 (= lt!366006 (bvadd #b0000000000000000000000000000000000000000000000000000000000001000 lt!366014))))

(assert (=> b!228206 (= lt!366006 (bitIndex!0 (size!5047 (buf!5588 (_2!10707 lt!366015))) (currentByte!10444 (_2!10707 lt!366015)) (currentBit!10439 (_2!10707 lt!366015))))))

(assert (=> b!228206 (= lt!366014 (bitIndex!0 (size!5047 (buf!5588 thiss!1870)) (currentByte!10444 thiss!1870) (currentBit!10439 thiss!1870)))))

(declare-fun readByteArrayLoop!0 (BitStream!9190 array!11504 (_ BitVec 32) (_ BitVec 32)) tuple3!1476)

(assert (=> b!228206 (= lt!366009 (readByteArrayLoop!0 (_2!10707 lt!366015) lt!366013 (bvadd #b00000000000000000000000000000001 i!761) to!496))))

(assert (=> b!228206 (validate_offset_bytes!0 ((_ sign_extend 32) (size!5047 (buf!5588 (_2!10707 lt!366015)))) ((_ sign_extend 32) (currentByte!10444 (_2!10707 lt!366015))) ((_ sign_extend 32) (currentBit!10439 (_2!10707 lt!366015))) lt!366010)))

(assert (=> b!228206 (= lt!366010 (bvsub (bvsub to!496 i!761) #b00000000000000000000000000000001))))

(declare-fun lt!366007 () Unit!17134)

(declare-fun validateOffsetBytesFromBitIndexLemma!0 (BitStream!9190 BitStream!9190 (_ BitVec 64) (_ BitVec 32)) Unit!17134)

(assert (=> b!228206 (= lt!366007 (validateOffsetBytesFromBitIndexLemma!0 thiss!1870 (_2!10707 lt!366015) #b0000000000000000000000000000000000000000000000000000000000001000 (bvsub to!496 i!761)))))

(assert (=> b!228206 (= lt!366013 (array!11505 (store (arr!6031 arr!308) i!761 (_1!10707 lt!366015)) (size!5047 arr!308)))))

(declare-fun readByte!0 (BitStream!9190) tuple2!19652)

(assert (=> b!228206 (= lt!366015 (readByte!0 thiss!1870))))

(declare-fun b!228207 () Bool)

(assert (=> b!228207 (= e!156337 (array_inv!4788 (buf!5588 thiss!1870)))))

(assert (= (and start!48008 res!191434) b!228204))

(assert (= (and b!228204 res!191432) b!228205))

(assert (= (and b!228205 res!191433) b!228206))

(assert (= start!48008 b!228207))

(declare-fun m!351613 () Bool)

(assert (=> start!48008 m!351613))

(declare-fun m!351615 () Bool)

(assert (=> start!48008 m!351615))

(declare-fun m!351617 () Bool)

(assert (=> b!228204 m!351617))

(declare-fun m!351619 () Bool)

(assert (=> b!228206 m!351619))

(declare-fun m!351621 () Bool)

(assert (=> b!228206 m!351621))

(declare-fun m!351623 () Bool)

(assert (=> b!228206 m!351623))

(declare-fun m!351625 () Bool)

(assert (=> b!228206 m!351625))

(declare-fun m!351627 () Bool)

(assert (=> b!228206 m!351627))

(declare-fun m!351629 () Bool)

(assert (=> b!228206 m!351629))

(declare-fun m!351631 () Bool)

(assert (=> b!228206 m!351631))

(declare-fun m!351633 () Bool)

(assert (=> b!228206 m!351633))

(declare-fun m!351635 () Bool)

(assert (=> b!228206 m!351635))

(declare-fun m!351637 () Bool)

(assert (=> b!228206 m!351637))

(declare-fun m!351639 () Bool)

(assert (=> b!228206 m!351639))

(declare-fun m!351641 () Bool)

(assert (=> b!228206 m!351641))

(declare-fun m!351643 () Bool)

(assert (=> b!228206 m!351643))

(declare-fun m!351645 () Bool)

(assert (=> b!228206 m!351645))

(declare-fun m!351647 () Bool)

(assert (=> b!228207 m!351647))

(push 1)

(assert (not b!228204))

(assert (not start!48008))

(assert (not b!228206))

(assert (not b!228207))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

