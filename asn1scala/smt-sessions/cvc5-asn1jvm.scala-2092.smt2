; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53108 () Bool)

(assert start!53108)

(declare-fun b!246253 () Bool)

(declare-fun e!170599 () Bool)

(declare-datatypes ((array!13436 0))(
  ( (array!13437 (arr!6877 (Array (_ BitVec 32) (_ BitVec 8))) (size!5890 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10702 0))(
  ( (BitStream!10703 (buf!6371 array!13436) (currentByte!11767 (_ BitVec 32)) (currentBit!11762 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21120 0))(
  ( (tuple2!21121 (_1!11482 BitStream!10702) (_2!11482 Bool)) )
))
(declare-fun lt!384193 () tuple2!21120)

(declare-fun lt!384191 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!246253 (= e!170599 (= (bitIndex!0 (size!5890 (buf!6371 (_1!11482 lt!384193))) (currentByte!11767 (_1!11482 lt!384193)) (currentBit!11762 (_1!11482 lt!384193))) lt!384191))))

(declare-fun b!246254 () Bool)

(declare-fun e!170604 () Bool)

(declare-fun lt!384179 () tuple2!21120)

(declare-fun lt!384185 () tuple2!21120)

(assert (=> b!246254 (= e!170604 (= (_2!11482 lt!384179) (_2!11482 lt!384185)))))

(declare-fun b!246255 () Bool)

(declare-fun e!170598 () Bool)

(assert (=> b!246255 (= e!170598 e!170599)))

(declare-fun res!205980 () Bool)

(assert (=> b!246255 (=> (not res!205980) (not e!170599))))

(declare-datatypes ((Unit!17892 0))(
  ( (Unit!17893) )
))
(declare-datatypes ((tuple2!21122 0))(
  ( (tuple2!21123 (_1!11483 Unit!17892) (_2!11483 BitStream!10702)) )
))
(declare-fun lt!384186 () tuple2!21122)

(declare-fun bit!26 () Bool)

(assert (=> b!246255 (= res!205980 (and (= (_2!11482 lt!384193) bit!26) (= (_1!11482 lt!384193) (_2!11483 lt!384186))))))

(declare-fun thiss!1005 () BitStream!10702)

(declare-fun readBitPure!0 (BitStream!10702) tuple2!21120)

(declare-fun readerFrom!0 (BitStream!10702 (_ BitVec 32) (_ BitVec 32)) BitStream!10702)

(assert (=> b!246255 (= lt!384193 (readBitPure!0 (readerFrom!0 (_2!11483 lt!384186) (currentBit!11762 thiss!1005) (currentByte!11767 thiss!1005))))))

(declare-fun b!246256 () Bool)

(declare-fun e!170602 () Bool)

(declare-fun e!170605 () Bool)

(assert (=> b!246256 (= e!170602 e!170605)))

(declare-fun res!205995 () Bool)

(assert (=> b!246256 (=> res!205995 e!170605)))

(declare-fun lt!384192 () tuple2!21122)

(assert (=> b!246256 (= res!205995 (not (= (size!5890 (buf!6371 thiss!1005)) (size!5890 (buf!6371 (_2!11483 lt!384192))))))))

(declare-fun lt!384178 () tuple2!21120)

(declare-fun lt!384198 () tuple2!21120)

(declare-datatypes ((tuple2!21124 0))(
  ( (tuple2!21125 (_1!11484 BitStream!10702) (_2!11484 BitStream!10702)) )
))
(declare-fun lt!384176 () tuple2!21124)

(assert (=> b!246256 (and (= (_2!11482 lt!384178) (_2!11482 lt!384198)) (= (_1!11482 lt!384178) (_2!11484 lt!384176)))))

(declare-fun b!246257 () Bool)

(declare-fun res!205987 () Bool)

(declare-fun e!170609 () Bool)

(assert (=> b!246257 (=> (not res!205987) (not e!170609))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!246257 (= res!205987 (bvslt from!289 nBits!297))))

(declare-fun b!246258 () Bool)

(declare-fun e!170606 () Bool)

(declare-fun lt!384194 () tuple2!21120)

(declare-fun lt!384180 () tuple2!21124)

(assert (=> b!246258 (= e!170606 (not (or (not (_2!11482 lt!384194)) (not (= (_1!11482 lt!384194) (_2!11484 lt!384180))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10702 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21120)

(assert (=> b!246258 (= lt!384194 (checkBitsLoopPure!0 (_1!11484 lt!384180) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384196 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!246258 (validate_offset_bits!1 ((_ sign_extend 32) (size!5890 (buf!6371 (_2!11483 lt!384192)))) ((_ sign_extend 32) (currentByte!11767 (_2!11483 lt!384186))) ((_ sign_extend 32) (currentBit!11762 (_2!11483 lt!384186))) lt!384196)))

(declare-fun lt!384197 () Unit!17892)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10702 array!13436 (_ BitVec 64)) Unit!17892)

(assert (=> b!246258 (= lt!384197 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11483 lt!384186) (buf!6371 (_2!11483 lt!384192)) lt!384196))))

(declare-fun reader!0 (BitStream!10702 BitStream!10702) tuple2!21124)

(assert (=> b!246258 (= lt!384180 (reader!0 (_2!11483 lt!384186) (_2!11483 lt!384192)))))

(declare-fun b!246259 () Bool)

(declare-fun res!205992 () Bool)

(assert (=> b!246259 (=> (not res!205992) (not e!170609))))

(assert (=> b!246259 (= res!205992 (validate_offset_bits!1 ((_ sign_extend 32) (size!5890 (buf!6371 thiss!1005))) ((_ sign_extend 32) (currentByte!11767 thiss!1005)) ((_ sign_extend 32) (currentBit!11762 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!246260 () Bool)

(declare-fun e!170600 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!246260 (= e!170600 (invariant!0 (currentBit!11762 thiss!1005) (currentByte!11767 thiss!1005) (size!5890 (buf!6371 (_2!11483 lt!384192)))))))

(declare-fun b!246261 () Bool)

(declare-fun e!170601 () Bool)

(assert (=> b!246261 (= e!170601 e!170598)))

(declare-fun res!205989 () Bool)

(assert (=> b!246261 (=> (not res!205989) (not e!170598))))

(declare-fun lt!384175 () (_ BitVec 64))

(assert (=> b!246261 (= res!205989 (= lt!384191 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!384175)))))

(assert (=> b!246261 (= lt!384191 (bitIndex!0 (size!5890 (buf!6371 (_2!11483 lt!384186))) (currentByte!11767 (_2!11483 lt!384186)) (currentBit!11762 (_2!11483 lt!384186))))))

(assert (=> b!246261 (= lt!384175 (bitIndex!0 (size!5890 (buf!6371 thiss!1005)) (currentByte!11767 thiss!1005) (currentBit!11762 thiss!1005)))))

(declare-fun res!205985 () Bool)

(assert (=> start!53108 (=> (not res!205985) (not e!170609))))

(assert (=> start!53108 (= res!205985 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53108 e!170609))

(assert (=> start!53108 true))

(declare-fun e!170607 () Bool)

(declare-fun inv!12 (BitStream!10702) Bool)

(assert (=> start!53108 (and (inv!12 thiss!1005) e!170607)))

(declare-fun b!246262 () Bool)

(assert (=> b!246262 (= e!170609 (not e!170602))))

(declare-fun res!205994 () Bool)

(assert (=> b!246262 (=> res!205994 e!170602)))

(declare-fun lt!384183 () tuple2!21124)

(assert (=> b!246262 (= res!205994 (not (= (_1!11482 lt!384198) (_2!11484 lt!384183))))))

(assert (=> b!246262 (= lt!384198 (checkBitsLoopPure!0 (_1!11484 lt!384183) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!384177 () (_ BitVec 64))

(assert (=> b!246262 (validate_offset_bits!1 ((_ sign_extend 32) (size!5890 (buf!6371 (_2!11483 lt!384192)))) ((_ sign_extend 32) (currentByte!11767 (_2!11483 lt!384186))) ((_ sign_extend 32) (currentBit!11762 (_2!11483 lt!384186))) lt!384177)))

(declare-fun lt!384184 () Unit!17892)

(assert (=> b!246262 (= lt!384184 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11483 lt!384186) (buf!6371 (_2!11483 lt!384192)) lt!384177))))

(assert (=> b!246262 (= lt!384178 (checkBitsLoopPure!0 (_1!11484 lt!384176) nBits!297 bit!26 from!289))))

(assert (=> b!246262 (validate_offset_bits!1 ((_ sign_extend 32) (size!5890 (buf!6371 (_2!11483 lt!384192)))) ((_ sign_extend 32) (currentByte!11767 thiss!1005)) ((_ sign_extend 32) (currentBit!11762 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!384188 () Unit!17892)

(assert (=> b!246262 (= lt!384188 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6371 (_2!11483 lt!384192)) (bvsub nBits!297 from!289)))))

(assert (=> b!246262 (= (_2!11482 (readBitPure!0 (_1!11484 lt!384176))) bit!26)))

(assert (=> b!246262 (= lt!384183 (reader!0 (_2!11483 lt!384186) (_2!11483 lt!384192)))))

(assert (=> b!246262 (= lt!384176 (reader!0 thiss!1005 (_2!11483 lt!384192)))))

(assert (=> b!246262 e!170604))

(declare-fun res!205986 () Bool)

(assert (=> b!246262 (=> (not res!205986) (not e!170604))))

(assert (=> b!246262 (= res!205986 (= (bitIndex!0 (size!5890 (buf!6371 (_1!11482 lt!384179))) (currentByte!11767 (_1!11482 lt!384179)) (currentBit!11762 (_1!11482 lt!384179))) (bitIndex!0 (size!5890 (buf!6371 (_1!11482 lt!384185))) (currentByte!11767 (_1!11482 lt!384185)) (currentBit!11762 (_1!11482 lt!384185)))))))

(declare-fun lt!384182 () Unit!17892)

(declare-fun lt!384187 () BitStream!10702)

(declare-fun readBitPrefixLemma!0 (BitStream!10702 BitStream!10702) Unit!17892)

(assert (=> b!246262 (= lt!384182 (readBitPrefixLemma!0 lt!384187 (_2!11483 lt!384192)))))

(assert (=> b!246262 (= lt!384185 (readBitPure!0 (BitStream!10703 (buf!6371 (_2!11483 lt!384192)) (currentByte!11767 thiss!1005) (currentBit!11762 thiss!1005))))))

(assert (=> b!246262 (= lt!384179 (readBitPure!0 lt!384187))))

(assert (=> b!246262 (= lt!384187 (BitStream!10703 (buf!6371 (_2!11483 lt!384186)) (currentByte!11767 thiss!1005) (currentBit!11762 thiss!1005)))))

(assert (=> b!246262 e!170600))

(declare-fun res!205982 () Bool)

(assert (=> b!246262 (=> (not res!205982) (not e!170600))))

(declare-fun isPrefixOf!0 (BitStream!10702 BitStream!10702) Bool)

(assert (=> b!246262 (= res!205982 (isPrefixOf!0 thiss!1005 (_2!11483 lt!384192)))))

(declare-fun lt!384189 () Unit!17892)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10702 BitStream!10702 BitStream!10702) Unit!17892)

(assert (=> b!246262 (= lt!384189 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11483 lt!384186) (_2!11483 lt!384192)))))

(declare-fun e!170603 () Bool)

(assert (=> b!246262 e!170603))

(declare-fun res!205993 () Bool)

(assert (=> b!246262 (=> (not res!205993) (not e!170603))))

(assert (=> b!246262 (= res!205993 (= (size!5890 (buf!6371 (_2!11483 lt!384186))) (size!5890 (buf!6371 (_2!11483 lt!384192)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10702 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21122)

(assert (=> b!246262 (= lt!384192 (appendNBitsLoop!0 (_2!11483 lt!384186) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!246262 (validate_offset_bits!1 ((_ sign_extend 32) (size!5890 (buf!6371 (_2!11483 lt!384186)))) ((_ sign_extend 32) (currentByte!11767 (_2!11483 lt!384186))) ((_ sign_extend 32) (currentBit!11762 (_2!11483 lt!384186))) lt!384177)))

(assert (=> b!246262 (= lt!384177 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!384195 () Unit!17892)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10702 BitStream!10702 (_ BitVec 64) (_ BitVec 64)) Unit!17892)

(assert (=> b!246262 (= lt!384195 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11483 lt!384186) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!246262 e!170601))

(declare-fun res!205988 () Bool)

(assert (=> b!246262 (=> (not res!205988) (not e!170601))))

(assert (=> b!246262 (= res!205988 (= (size!5890 (buf!6371 thiss!1005)) (size!5890 (buf!6371 (_2!11483 lt!384186)))))))

(declare-fun appendBit!0 (BitStream!10702 Bool) tuple2!21122)

(assert (=> b!246262 (= lt!384186 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!246263 () Bool)

(declare-fun res!205984 () Bool)

(assert (=> b!246263 (=> res!205984 e!170602)))

(declare-fun withMovedBitIndex!0 (BitStream!10702 (_ BitVec 64)) BitStream!10702)

(assert (=> b!246263 (= res!205984 (not (= (_1!11484 lt!384183) (withMovedBitIndex!0 (_1!11484 lt!384176) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!246264 () Bool)

(assert (=> b!246264 (= e!170605 true)))

(declare-fun lt!384190 () (_ BitVec 64))

(assert (=> b!246264 (= lt!384190 (bitIndex!0 (size!5890 (buf!6371 (_2!11483 lt!384192))) (currentByte!11767 (_2!11483 lt!384192)) (currentBit!11762 (_2!11483 lt!384192))))))

(declare-fun lt!384181 () (_ BitVec 64))

(assert (=> b!246264 (= lt!384181 (bitIndex!0 (size!5890 (buf!6371 thiss!1005)) (currentByte!11767 thiss!1005) (currentBit!11762 thiss!1005)))))

(declare-fun b!246265 () Bool)

(assert (=> b!246265 (= e!170603 e!170606)))

(declare-fun res!205990 () Bool)

(assert (=> b!246265 (=> (not res!205990) (not e!170606))))

(assert (=> b!246265 (= res!205990 (= (bitIndex!0 (size!5890 (buf!6371 (_2!11483 lt!384192))) (currentByte!11767 (_2!11483 lt!384192)) (currentBit!11762 (_2!11483 lt!384192))) (bvadd (bitIndex!0 (size!5890 (buf!6371 (_2!11483 lt!384186))) (currentByte!11767 (_2!11483 lt!384186)) (currentBit!11762 (_2!11483 lt!384186))) lt!384196)))))

(assert (=> b!246265 (= lt!384196 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!246266 () Bool)

(declare-fun res!205991 () Bool)

(assert (=> b!246266 (=> (not res!205991) (not e!170606))))

(assert (=> b!246266 (= res!205991 (isPrefixOf!0 (_2!11483 lt!384186) (_2!11483 lt!384192)))))

(declare-fun b!246267 () Bool)

(declare-fun res!205981 () Bool)

(assert (=> b!246267 (=> (not res!205981) (not e!170600))))

(assert (=> b!246267 (= res!205981 (invariant!0 (currentBit!11762 thiss!1005) (currentByte!11767 thiss!1005) (size!5890 (buf!6371 (_2!11483 lt!384186)))))))

(declare-fun b!246268 () Bool)

(declare-fun res!205983 () Bool)

(assert (=> b!246268 (=> (not res!205983) (not e!170598))))

(assert (=> b!246268 (= res!205983 (isPrefixOf!0 thiss!1005 (_2!11483 lt!384186)))))

(declare-fun b!246269 () Bool)

(declare-fun array_inv!5631 (array!13436) Bool)

(assert (=> b!246269 (= e!170607 (array_inv!5631 (buf!6371 thiss!1005)))))

(assert (= (and start!53108 res!205985) b!246259))

(assert (= (and b!246259 res!205992) b!246257))

(assert (= (and b!246257 res!205987) b!246262))

(assert (= (and b!246262 res!205988) b!246261))

(assert (= (and b!246261 res!205989) b!246268))

(assert (= (and b!246268 res!205983) b!246255))

(assert (= (and b!246255 res!205980) b!246253))

(assert (= (and b!246262 res!205993) b!246265))

(assert (= (and b!246265 res!205990) b!246266))

(assert (= (and b!246266 res!205991) b!246258))

(assert (= (and b!246262 res!205982) b!246267))

(assert (= (and b!246267 res!205981) b!246260))

(assert (= (and b!246262 res!205986) b!246254))

(assert (= (and b!246262 (not res!205994)) b!246263))

(assert (= (and b!246263 (not res!205984)) b!246256))

(assert (= (and b!246256 (not res!205995)) b!246264))

(assert (= start!53108 b!246269))

(declare-fun m!371405 () Bool)

(assert (=> start!53108 m!371405))

(declare-fun m!371407 () Bool)

(assert (=> b!246260 m!371407))

(declare-fun m!371409 () Bool)

(assert (=> b!246261 m!371409))

(declare-fun m!371411 () Bool)

(assert (=> b!246261 m!371411))

(declare-fun m!371413 () Bool)

(assert (=> b!246268 m!371413))

(declare-fun m!371415 () Bool)

(assert (=> b!246265 m!371415))

(assert (=> b!246265 m!371409))

(declare-fun m!371417 () Bool)

(assert (=> b!246253 m!371417))

(declare-fun m!371419 () Bool)

(assert (=> b!246266 m!371419))

(declare-fun m!371421 () Bool)

(assert (=> b!246267 m!371421))

(declare-fun m!371423 () Bool)

(assert (=> b!246255 m!371423))

(assert (=> b!246255 m!371423))

(declare-fun m!371425 () Bool)

(assert (=> b!246255 m!371425))

(declare-fun m!371427 () Bool)

(assert (=> b!246263 m!371427))

(declare-fun m!371429 () Bool)

(assert (=> b!246262 m!371429))

(declare-fun m!371431 () Bool)

(assert (=> b!246262 m!371431))

(declare-fun m!371433 () Bool)

(assert (=> b!246262 m!371433))

(declare-fun m!371435 () Bool)

(assert (=> b!246262 m!371435))

(declare-fun m!371437 () Bool)

(assert (=> b!246262 m!371437))

(declare-fun m!371439 () Bool)

(assert (=> b!246262 m!371439))

(declare-fun m!371441 () Bool)

(assert (=> b!246262 m!371441))

(declare-fun m!371443 () Bool)

(assert (=> b!246262 m!371443))

(declare-fun m!371445 () Bool)

(assert (=> b!246262 m!371445))

(declare-fun m!371447 () Bool)

(assert (=> b!246262 m!371447))

(declare-fun m!371449 () Bool)

(assert (=> b!246262 m!371449))

(declare-fun m!371451 () Bool)

(assert (=> b!246262 m!371451))

(declare-fun m!371453 () Bool)

(assert (=> b!246262 m!371453))

(declare-fun m!371455 () Bool)

(assert (=> b!246262 m!371455))

(declare-fun m!371457 () Bool)

(assert (=> b!246262 m!371457))

(declare-fun m!371459 () Bool)

(assert (=> b!246262 m!371459))

(declare-fun m!371461 () Bool)

(assert (=> b!246262 m!371461))

(declare-fun m!371463 () Bool)

(assert (=> b!246262 m!371463))

(declare-fun m!371465 () Bool)

(assert (=> b!246262 m!371465))

(declare-fun m!371467 () Bool)

(assert (=> b!246262 m!371467))

(assert (=> b!246264 m!371415))

(assert (=> b!246264 m!371411))

(declare-fun m!371469 () Bool)

(assert (=> b!246269 m!371469))

(declare-fun m!371471 () Bool)

(assert (=> b!246259 m!371471))

(declare-fun m!371473 () Bool)

(assert (=> b!246258 m!371473))

(declare-fun m!371475 () Bool)

(assert (=> b!246258 m!371475))

(declare-fun m!371477 () Bool)

(assert (=> b!246258 m!371477))

(assert (=> b!246258 m!371443))

(push 1)

(assert (not b!246266))

(assert (not b!246265))

(assert (not b!246255))

