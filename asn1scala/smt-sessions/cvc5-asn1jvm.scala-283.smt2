; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!5678 () Bool)

(assert start!5678)

(declare-fun b!23874 () Bool)

(declare-fun res!20575 () Bool)

(declare-fun e!16210 () Bool)

(assert (=> b!23874 (=> res!20575 e!16210)))

(declare-datatypes ((array!1601 0))(
  ( (array!1602 (arr!1142 (Array (_ BitVec 32) (_ BitVec 8))) (size!686 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1204 0))(
  ( (BitStream!1205 (buf!1007 array!1601) (currentByte!2320 (_ BitVec 32)) (currentBit!2315 (_ BitVec 32))) )
))
(declare-fun thiss!1379 () BitStream!1204)

(declare-datatypes ((Unit!2015 0))(
  ( (Unit!2016) )
))
(declare-datatypes ((tuple2!2726 0))(
  ( (tuple2!2727 (_1!1450 Unit!2015) (_2!1450 BitStream!1204)) )
))
(declare-fun lt!34358 () tuple2!2726)

(assert (=> b!23874 (= res!20575 (not (= (size!686 (buf!1007 thiss!1379)) (size!686 (buf!1007 (_2!1450 lt!34358))))))))

(declare-fun b!23875 () Bool)

(declare-fun e!16214 () Bool)

(declare-fun e!16213 () Bool)

(assert (=> b!23875 (= e!16214 e!16213)))

(declare-fun res!20570 () Bool)

(assert (=> b!23875 (=> res!20570 e!16213)))

(declare-fun lt!34360 () tuple2!2726)

(declare-fun isPrefixOf!0 (BitStream!1204 BitStream!1204) Bool)

(assert (=> b!23875 (= res!20570 (not (isPrefixOf!0 thiss!1379 (_2!1450 lt!34360))))))

(declare-fun lt!34363 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!23875 (validate_offset_bits!1 ((_ sign_extend 32) (size!686 (buf!1007 (_2!1450 lt!34360)))) ((_ sign_extend 32) (currentByte!2320 (_2!1450 lt!34360))) ((_ sign_extend 32) (currentBit!2315 (_2!1450 lt!34360))) lt!34363)))

(declare-fun to!314 () (_ BitVec 64))

(declare-fun i!635 () (_ BitVec 64))

(assert (=> b!23875 (= lt!34363 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34362 () Unit!2015)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1204 BitStream!1204 (_ BitVec 64) (_ BitVec 64)) Unit!2015)

(assert (=> b!23875 (= lt!34362 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1450 lt!34360) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun srcBuffer!2 () array!1601)

(declare-fun appendBitFromByte!0 (BitStream!1204 (_ BitVec 8) (_ BitVec 32)) tuple2!2726)

(assert (=> b!23875 (= lt!34360 (appendBitFromByte!0 thiss!1379 (select (arr!1142 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun res!20568 () Bool)

(declare-fun e!16212 () Bool)

(assert (=> start!5678 (=> (not res!20568) (not e!16212))))

(assert (=> start!5678 (= res!20568 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!686 srcBuffer!2))))))))

(assert (=> start!5678 e!16212))

(assert (=> start!5678 true))

(declare-fun array_inv!655 (array!1601) Bool)

(assert (=> start!5678 (array_inv!655 srcBuffer!2)))

(declare-fun e!16219 () Bool)

(declare-fun inv!12 (BitStream!1204) Bool)

(assert (=> start!5678 (and (inv!12 thiss!1379) e!16219)))

(declare-fun b!23876 () Bool)

(declare-fun e!16209 () Bool)

(assert (=> b!23876 (= e!16213 e!16209)))

(declare-fun res!20569 () Bool)

(assert (=> b!23876 (=> res!20569 e!16209)))

(assert (=> b!23876 (= res!20569 (not (isPrefixOf!0 (_2!1450 lt!34360) (_2!1450 lt!34358))))))

(assert (=> b!23876 (isPrefixOf!0 thiss!1379 (_2!1450 lt!34358))))

(declare-fun lt!34356 () Unit!2015)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1204 BitStream!1204 BitStream!1204) Unit!2015)

(assert (=> b!23876 (= lt!34356 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1450 lt!34360) (_2!1450 lt!34358)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1204 array!1601 (_ BitVec 64) (_ BitVec 64)) tuple2!2726)

(assert (=> b!23876 (= lt!34358 (appendBitsMSBFirstLoop!0 (_2!1450 lt!34360) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!16218 () Bool)

(assert (=> b!23876 e!16218))

(declare-fun res!20572 () Bool)

(assert (=> b!23876 (=> (not res!20572) (not e!16218))))

(assert (=> b!23876 (= res!20572 (validate_offset_bits!1 ((_ sign_extend 32) (size!686 (buf!1007 (_2!1450 lt!34360)))) ((_ sign_extend 32) (currentByte!2320 thiss!1379)) ((_ sign_extend 32) (currentBit!2315 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!34351 () Unit!2015)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1204 array!1601 (_ BitVec 64)) Unit!2015)

(assert (=> b!23876 (= lt!34351 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1007 (_2!1450 lt!34360)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!2728 0))(
  ( (tuple2!2729 (_1!1451 BitStream!1204) (_2!1451 BitStream!1204)) )
))
(declare-fun lt!34361 () tuple2!2728)

(declare-fun reader!0 (BitStream!1204 BitStream!1204) tuple2!2728)

(assert (=> b!23876 (= lt!34361 (reader!0 thiss!1379 (_2!1450 lt!34360)))))

(declare-fun b!23877 () Bool)

(declare-fun res!20566 () Bool)

(declare-fun e!16215 () Bool)

(assert (=> b!23877 (=> res!20566 e!16215)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!23877 (= res!20566 (not (invariant!0 (currentBit!2315 (_2!1450 lt!34360)) (currentByte!2320 (_2!1450 lt!34360)) (size!686 (buf!1007 (_2!1450 lt!34358))))))))

(declare-fun b!23878 () Bool)

(assert (=> b!23878 (= e!16209 e!16210)))

(declare-fun res!20576 () Bool)

(assert (=> b!23878 (=> res!20576 e!16210)))

(declare-fun lt!34355 () (_ BitVec 64))

(declare-fun lt!34353 () (_ BitVec 64))

(assert (=> b!23878 (= res!20576 (not (= lt!34353 (bvsub (bvadd lt!34355 to!314) i!635))))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!23878 (= lt!34353 (bitIndex!0 (size!686 (buf!1007 (_2!1450 lt!34358))) (currentByte!2320 (_2!1450 lt!34358)) (currentBit!2315 (_2!1450 lt!34358))))))

(declare-fun b!23879 () Bool)

(declare-fun res!20567 () Bool)

(assert (=> b!23879 (=> res!20567 e!16215)))

(assert (=> b!23879 (= res!20567 (not (invariant!0 (currentBit!2315 (_2!1450 lt!34360)) (currentByte!2320 (_2!1450 lt!34360)) (size!686 (buf!1007 (_2!1450 lt!34360))))))))

(declare-fun b!23880 () Bool)

(declare-fun res!20571 () Bool)

(assert (=> b!23880 (=> res!20571 e!16210)))

(assert (=> b!23880 (= res!20571 (not (invariant!0 (currentBit!2315 (_2!1450 lt!34358)) (currentByte!2320 (_2!1450 lt!34358)) (size!686 (buf!1007 (_2!1450 lt!34358))))))))

(declare-fun b!23881 () Bool)

(assert (=> b!23881 (= e!16215 true)))

(assert (=> b!23881 (validate_offset_bits!1 ((_ sign_extend 32) (size!686 (buf!1007 (_2!1450 lt!34358)))) ((_ sign_extend 32) (currentByte!2320 (_2!1450 lt!34360))) ((_ sign_extend 32) (currentBit!2315 (_2!1450 lt!34360))) lt!34363)))

(declare-fun lt!34352 () Unit!2015)

(assert (=> b!23881 (= lt!34352 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1450 lt!34360) (buf!1007 (_2!1450 lt!34358)) lt!34363))))

(declare-fun lt!34359 () tuple2!2728)

(assert (=> b!23881 (= lt!34359 (reader!0 (_2!1450 lt!34360) (_2!1450 lt!34358)))))

(assert (=> b!23881 (validate_offset_bits!1 ((_ sign_extend 32) (size!686 (buf!1007 (_2!1450 lt!34358)))) ((_ sign_extend 32) (currentByte!2320 thiss!1379)) ((_ sign_extend 32) (currentBit!2315 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!34354 () Unit!2015)

(assert (=> b!23881 (= lt!34354 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1007 (_2!1450 lt!34358)) (bvsub to!314 i!635)))))

(declare-fun lt!34350 () tuple2!2728)

(assert (=> b!23881 (= lt!34350 (reader!0 thiss!1379 (_2!1450 lt!34358)))))

(declare-fun b!23882 () Bool)

(declare-fun e!16216 () Bool)

(assert (=> b!23882 (= e!16216 (= lt!34353 (bvsub (bvsub (bvadd (bitIndex!0 (size!686 (buf!1007 (_2!1450 lt!34360))) (currentByte!2320 (_2!1450 lt!34360)) (currentBit!2315 (_2!1450 lt!34360))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!23883 () Bool)

(declare-fun res!20573 () Bool)

(assert (=> b!23883 (=> (not res!20573) (not e!16212))))

(assert (=> b!23883 (= res!20573 (validate_offset_bits!1 ((_ sign_extend 32) (size!686 (buf!1007 thiss!1379))) ((_ sign_extend 32) (currentByte!2320 thiss!1379)) ((_ sign_extend 32) (currentBit!2315 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!23884 () Bool)

(assert (=> b!23884 (= e!16210 e!16215)))

(declare-fun res!20577 () Bool)

(assert (=> b!23884 (=> res!20577 e!16215)))

(assert (=> b!23884 (= res!20577 (not (= (size!686 (buf!1007 (_2!1450 lt!34360))) (size!686 (buf!1007 (_2!1450 lt!34358))))))))

(assert (=> b!23884 e!16216))

(declare-fun res!20565 () Bool)

(assert (=> b!23884 (=> (not res!20565) (not e!16216))))

(assert (=> b!23884 (= res!20565 (= (size!686 (buf!1007 (_2!1450 lt!34358))) (size!686 (buf!1007 thiss!1379))))))

(declare-fun b!23885 () Bool)

(assert (=> b!23885 (= e!16219 (array_inv!655 (buf!1007 thiss!1379)))))

(declare-fun b!23886 () Bool)

(declare-datatypes ((List!303 0))(
  ( (Nil!300) (Cons!299 (h!418 Bool) (t!1053 List!303)) )
))
(declare-fun head!140 (List!303) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1204 array!1601 (_ BitVec 64) (_ BitVec 64)) List!303)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1204 BitStream!1204 (_ BitVec 64)) List!303)

(assert (=> b!23886 (= e!16218 (= (head!140 (byteArrayBitContentToList!0 (_2!1450 lt!34360) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!140 (bitStreamReadBitsIntoList!0 (_2!1450 lt!34360) (_1!1451 lt!34361) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!23887 () Bool)

(assert (=> b!23887 (= e!16212 (not e!16214))))

(declare-fun res!20574 () Bool)

(assert (=> b!23887 (=> res!20574 e!16214)))

(assert (=> b!23887 (= res!20574 (bvsge i!635 to!314))))

(assert (=> b!23887 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!34357 () Unit!2015)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1204) Unit!2015)

(assert (=> b!23887 (= lt!34357 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> b!23887 (= lt!34355 (bitIndex!0 (size!686 (buf!1007 thiss!1379)) (currentByte!2320 thiss!1379) (currentBit!2315 thiss!1379)))))

(assert (= (and start!5678 res!20568) b!23883))

(assert (= (and b!23883 res!20573) b!23887))

(assert (= (and b!23887 (not res!20574)) b!23875))

(assert (= (and b!23875 (not res!20570)) b!23876))

(assert (= (and b!23876 res!20572) b!23886))

(assert (= (and b!23876 (not res!20569)) b!23878))

(assert (= (and b!23878 (not res!20576)) b!23880))

(assert (= (and b!23880 (not res!20571)) b!23874))

(assert (= (and b!23874 (not res!20575)) b!23884))

(assert (= (and b!23884 res!20565) b!23882))

(assert (= (and b!23884 (not res!20577)) b!23879))

(assert (= (and b!23879 (not res!20567)) b!23877))

(assert (= (and b!23877 (not res!20566)) b!23881))

(assert (= start!5678 b!23885))

(declare-fun m!33597 () Bool)

(assert (=> b!23876 m!33597))

(declare-fun m!33599 () Bool)

(assert (=> b!23876 m!33599))

(declare-fun m!33601 () Bool)

(assert (=> b!23876 m!33601))

(declare-fun m!33603 () Bool)

(assert (=> b!23876 m!33603))

(declare-fun m!33605 () Bool)

(assert (=> b!23876 m!33605))

(declare-fun m!33607 () Bool)

(assert (=> b!23876 m!33607))

(declare-fun m!33609 () Bool)

(assert (=> b!23876 m!33609))

(declare-fun m!33611 () Bool)

(assert (=> b!23883 m!33611))

(declare-fun m!33613 () Bool)

(assert (=> b!23886 m!33613))

(assert (=> b!23886 m!33613))

(declare-fun m!33615 () Bool)

(assert (=> b!23886 m!33615))

(declare-fun m!33617 () Bool)

(assert (=> b!23886 m!33617))

(assert (=> b!23886 m!33617))

(declare-fun m!33619 () Bool)

(assert (=> b!23886 m!33619))

(declare-fun m!33621 () Bool)

(assert (=> b!23880 m!33621))

(declare-fun m!33623 () Bool)

(assert (=> b!23878 m!33623))

(declare-fun m!33625 () Bool)

(assert (=> start!5678 m!33625))

(declare-fun m!33627 () Bool)

(assert (=> start!5678 m!33627))

(declare-fun m!33629 () Bool)

(assert (=> b!23877 m!33629))

(declare-fun m!33631 () Bool)

(assert (=> b!23882 m!33631))

(declare-fun m!33633 () Bool)

(assert (=> b!23879 m!33633))

(declare-fun m!33635 () Bool)

(assert (=> b!23881 m!33635))

(declare-fun m!33637 () Bool)

(assert (=> b!23881 m!33637))

(declare-fun m!33639 () Bool)

(assert (=> b!23881 m!33639))

(declare-fun m!33641 () Bool)

(assert (=> b!23881 m!33641))

(declare-fun m!33643 () Bool)

(assert (=> b!23881 m!33643))

(declare-fun m!33645 () Bool)

(assert (=> b!23881 m!33645))

(declare-fun m!33647 () Bool)

(assert (=> b!23887 m!33647))

(declare-fun m!33649 () Bool)

(assert (=> b!23887 m!33649))

(declare-fun m!33651 () Bool)

(assert (=> b!23887 m!33651))

(declare-fun m!33653 () Bool)

(assert (=> b!23875 m!33653))

(declare-fun m!33655 () Bool)

(assert (=> b!23875 m!33655))

(declare-fun m!33657 () Bool)

(assert (=> b!23875 m!33657))

(assert (=> b!23875 m!33653))

(declare-fun m!33659 () Bool)

(assert (=> b!23875 m!33659))

(declare-fun m!33661 () Bool)

(assert (=> b!23875 m!33661))

(declare-fun m!33663 () Bool)

(assert (=> b!23885 m!33663))

(push 1)

