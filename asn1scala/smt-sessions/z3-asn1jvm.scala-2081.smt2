; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52744 () Bool)

(assert start!52744)

(declare-fun b!243991 () Bool)

(declare-fun res!203897 () Bool)

(declare-fun e!169109 () Bool)

(assert (=> b!243991 (=> (not res!203897) (not e!169109))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!243991 (= res!203897 (bvslt from!289 nBits!297))))

(declare-fun b!243992 () Bool)

(declare-fun e!169108 () Bool)

(declare-datatypes ((array!13363 0))(
  ( (array!13364 (arr!6845 (Array (_ BitVec 32) (_ BitVec 8))) (size!5858 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10638 0))(
  ( (BitStream!10639 (buf!6330 array!13363) (currentByte!11708 (_ BitVec 32)) (currentBit!11703 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!20910 0))(
  ( (tuple2!20911 (_1!11377 BitStream!10638) (_2!11377 Bool)) )
))
(declare-fun lt!380326 () tuple2!20910)

(declare-fun lt!380327 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!243992 (= e!169108 (= (bitIndex!0 (size!5858 (buf!6330 (_1!11377 lt!380326))) (currentByte!11708 (_1!11377 lt!380326)) (currentBit!11703 (_1!11377 lt!380326))) lt!380327))))

(declare-fun b!243994 () Bool)

(declare-fun res!203889 () Bool)

(declare-fun e!169107 () Bool)

(assert (=> b!243994 (=> (not res!203889) (not e!169107))))

(declare-fun thiss!1005 () BitStream!10638)

(declare-datatypes ((Unit!17811 0))(
  ( (Unit!17812) )
))
(declare-datatypes ((tuple2!20912 0))(
  ( (tuple2!20913 (_1!11378 Unit!17811) (_2!11378 BitStream!10638)) )
))
(declare-fun lt!380336 () tuple2!20912)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!243994 (= res!203889 (invariant!0 (currentBit!11703 thiss!1005) (currentByte!11708 thiss!1005) (size!5858 (buf!6330 (_2!11378 lt!380336)))))))

(declare-fun b!243995 () Bool)

(declare-fun e!169105 () Bool)

(declare-fun e!169104 () Bool)

(assert (=> b!243995 (= e!169105 e!169104)))

(declare-fun res!203891 () Bool)

(assert (=> b!243995 (=> (not res!203891) (not e!169104))))

(declare-fun lt!380332 () (_ BitVec 64))

(assert (=> b!243995 (= res!203891 (= lt!380327 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!380332)))))

(assert (=> b!243995 (= lt!380327 (bitIndex!0 (size!5858 (buf!6330 (_2!11378 lt!380336))) (currentByte!11708 (_2!11378 lt!380336)) (currentBit!11703 (_2!11378 lt!380336))))))

(assert (=> b!243995 (= lt!380332 (bitIndex!0 (size!5858 (buf!6330 thiss!1005)) (currentByte!11708 thiss!1005) (currentBit!11703 thiss!1005)))))

(declare-fun b!243996 () Bool)

(declare-fun res!203890 () Bool)

(assert (=> b!243996 (=> (not res!203890) (not e!169109))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!243996 (= res!203890 (validate_offset_bits!1 ((_ sign_extend 32) (size!5858 (buf!6330 thiss!1005))) ((_ sign_extend 32) (currentByte!11708 thiss!1005)) ((_ sign_extend 32) (currentBit!11703 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!243997 () Bool)

(declare-fun res!203899 () Bool)

(assert (=> b!243997 (=> (not res!203899) (not e!169104))))

(declare-fun isPrefixOf!0 (BitStream!10638 BitStream!10638) Bool)

(assert (=> b!243997 (= res!203899 (isPrefixOf!0 thiss!1005 (_2!11378 lt!380336)))))

(declare-fun b!243998 () Bool)

(assert (=> b!243998 (= e!169109 (not true))))

(declare-fun lt!380328 () tuple2!20910)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!20914 0))(
  ( (tuple2!20915 (_1!11379 BitStream!10638) (_2!11379 BitStream!10638)) )
))
(declare-fun lt!380335 () tuple2!20914)

(declare-fun checkBitsLoopPure!0 (BitStream!10638 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20910)

(assert (=> b!243998 (= lt!380328 (checkBitsLoopPure!0 (_1!11379 lt!380335) nBits!297 bit!26 from!289))))

(declare-fun lt!380325 () tuple2!20912)

(assert (=> b!243998 (validate_offset_bits!1 ((_ sign_extend 32) (size!5858 (buf!6330 (_2!11378 lt!380325)))) ((_ sign_extend 32) (currentByte!11708 thiss!1005)) ((_ sign_extend 32) (currentBit!11703 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!380321 () Unit!17811)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10638 array!13363 (_ BitVec 64)) Unit!17811)

(assert (=> b!243998 (= lt!380321 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6330 (_2!11378 lt!380325)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10638) tuple2!20910)

(assert (=> b!243998 (= (_2!11377 (readBitPure!0 (_1!11379 lt!380335))) bit!26)))

(declare-fun lt!380337 () tuple2!20914)

(declare-fun reader!0 (BitStream!10638 BitStream!10638) tuple2!20914)

(assert (=> b!243998 (= lt!380337 (reader!0 (_2!11378 lt!380336) (_2!11378 lt!380325)))))

(assert (=> b!243998 (= lt!380335 (reader!0 thiss!1005 (_2!11378 lt!380325)))))

(declare-fun e!169106 () Bool)

(assert (=> b!243998 e!169106))

(declare-fun res!203894 () Bool)

(assert (=> b!243998 (=> (not res!203894) (not e!169106))))

(declare-fun lt!380322 () tuple2!20910)

(declare-fun lt!380333 () tuple2!20910)

(assert (=> b!243998 (= res!203894 (= (bitIndex!0 (size!5858 (buf!6330 (_1!11377 lt!380322))) (currentByte!11708 (_1!11377 lt!380322)) (currentBit!11703 (_1!11377 lt!380322))) (bitIndex!0 (size!5858 (buf!6330 (_1!11377 lt!380333))) (currentByte!11708 (_1!11377 lt!380333)) (currentBit!11703 (_1!11377 lt!380333)))))))

(declare-fun lt!380334 () Unit!17811)

(declare-fun lt!380330 () BitStream!10638)

(declare-fun readBitPrefixLemma!0 (BitStream!10638 BitStream!10638) Unit!17811)

(assert (=> b!243998 (= lt!380334 (readBitPrefixLemma!0 lt!380330 (_2!11378 lt!380325)))))

(assert (=> b!243998 (= lt!380333 (readBitPure!0 (BitStream!10639 (buf!6330 (_2!11378 lt!380325)) (currentByte!11708 thiss!1005) (currentBit!11703 thiss!1005))))))

(assert (=> b!243998 (= lt!380322 (readBitPure!0 lt!380330))))

(assert (=> b!243998 (= lt!380330 (BitStream!10639 (buf!6330 (_2!11378 lt!380336)) (currentByte!11708 thiss!1005) (currentBit!11703 thiss!1005)))))

(assert (=> b!243998 e!169107))

(declare-fun res!203892 () Bool)

(assert (=> b!243998 (=> (not res!203892) (not e!169107))))

(assert (=> b!243998 (= res!203892 (isPrefixOf!0 thiss!1005 (_2!11378 lt!380325)))))

(declare-fun lt!380324 () Unit!17811)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10638 BitStream!10638 BitStream!10638) Unit!17811)

(assert (=> b!243998 (= lt!380324 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11378 lt!380336) (_2!11378 lt!380325)))))

(declare-fun e!169112 () Bool)

(assert (=> b!243998 e!169112))

(declare-fun res!203896 () Bool)

(assert (=> b!243998 (=> (not res!203896) (not e!169112))))

(assert (=> b!243998 (= res!203896 (= (size!5858 (buf!6330 (_2!11378 lt!380336))) (size!5858 (buf!6330 (_2!11378 lt!380325)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10638 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20912)

(assert (=> b!243998 (= lt!380325 (appendNBitsLoop!0 (_2!11378 lt!380336) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!243998 (validate_offset_bits!1 ((_ sign_extend 32) (size!5858 (buf!6330 (_2!11378 lt!380336)))) ((_ sign_extend 32) (currentByte!11708 (_2!11378 lt!380336))) ((_ sign_extend 32) (currentBit!11703 (_2!11378 lt!380336))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!380320 () Unit!17811)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10638 BitStream!10638 (_ BitVec 64) (_ BitVec 64)) Unit!17811)

(assert (=> b!243998 (= lt!380320 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11378 lt!380336) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!243998 e!169105))

(declare-fun res!203895 () Bool)

(assert (=> b!243998 (=> (not res!203895) (not e!169105))))

(assert (=> b!243998 (= res!203895 (= (size!5858 (buf!6330 thiss!1005)) (size!5858 (buf!6330 (_2!11378 lt!380336)))))))

(declare-fun appendBit!0 (BitStream!10638 Bool) tuple2!20912)

(assert (=> b!243998 (= lt!380336 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!243999 () Bool)

(assert (=> b!243999 (= e!169106 (= (_2!11377 lt!380322) (_2!11377 lt!380333)))))

(declare-fun b!244000 () Bool)

(declare-fun e!169103 () Bool)

(declare-fun lt!380329 () tuple2!20910)

(declare-fun lt!380331 () tuple2!20914)

(assert (=> b!244000 (= e!169103 (not (or (not (_2!11377 lt!380329)) (not (= (_1!11377 lt!380329) (_2!11379 lt!380331))))))))

(assert (=> b!244000 (= lt!380329 (checkBitsLoopPure!0 (_1!11379 lt!380331) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!380323 () (_ BitVec 64))

(assert (=> b!244000 (validate_offset_bits!1 ((_ sign_extend 32) (size!5858 (buf!6330 (_2!11378 lt!380325)))) ((_ sign_extend 32) (currentByte!11708 (_2!11378 lt!380336))) ((_ sign_extend 32) (currentBit!11703 (_2!11378 lt!380336))) lt!380323)))

(declare-fun lt!380319 () Unit!17811)

(assert (=> b!244000 (= lt!380319 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11378 lt!380336) (buf!6330 (_2!11378 lt!380325)) lt!380323))))

(assert (=> b!244000 (= lt!380331 (reader!0 (_2!11378 lt!380336) (_2!11378 lt!380325)))))

(declare-fun b!243993 () Bool)

(declare-fun res!203901 () Bool)

(assert (=> b!243993 (=> (not res!203901) (not e!169103))))

(assert (=> b!243993 (= res!203901 (isPrefixOf!0 (_2!11378 lt!380336) (_2!11378 lt!380325)))))

(declare-fun res!203900 () Bool)

(assert (=> start!52744 (=> (not res!203900) (not e!169109))))

(assert (=> start!52744 (= res!203900 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52744 e!169109))

(assert (=> start!52744 true))

(declare-fun e!169110 () Bool)

(declare-fun inv!12 (BitStream!10638) Bool)

(assert (=> start!52744 (and (inv!12 thiss!1005) e!169110)))

(declare-fun b!244001 () Bool)

(assert (=> b!244001 (= e!169104 e!169108)))

(declare-fun res!203898 () Bool)

(assert (=> b!244001 (=> (not res!203898) (not e!169108))))

(assert (=> b!244001 (= res!203898 (and (= (_2!11377 lt!380326) bit!26) (= (_1!11377 lt!380326) (_2!11378 lt!380336))))))

(declare-fun readerFrom!0 (BitStream!10638 (_ BitVec 32) (_ BitVec 32)) BitStream!10638)

(assert (=> b!244001 (= lt!380326 (readBitPure!0 (readerFrom!0 (_2!11378 lt!380336) (currentBit!11703 thiss!1005) (currentByte!11708 thiss!1005))))))

(declare-fun b!244002 () Bool)

(declare-fun array_inv!5599 (array!13363) Bool)

(assert (=> b!244002 (= e!169110 (array_inv!5599 (buf!6330 thiss!1005)))))

(declare-fun b!244003 () Bool)

(assert (=> b!244003 (= e!169107 (invariant!0 (currentBit!11703 thiss!1005) (currentByte!11708 thiss!1005) (size!5858 (buf!6330 (_2!11378 lt!380325)))))))

(declare-fun b!244004 () Bool)

(assert (=> b!244004 (= e!169112 e!169103)))

(declare-fun res!203893 () Bool)

(assert (=> b!244004 (=> (not res!203893) (not e!169103))))

(assert (=> b!244004 (= res!203893 (= (bitIndex!0 (size!5858 (buf!6330 (_2!11378 lt!380325))) (currentByte!11708 (_2!11378 lt!380325)) (currentBit!11703 (_2!11378 lt!380325))) (bvadd (bitIndex!0 (size!5858 (buf!6330 (_2!11378 lt!380336))) (currentByte!11708 (_2!11378 lt!380336)) (currentBit!11703 (_2!11378 lt!380336))) lt!380323)))))

(assert (=> b!244004 (= lt!380323 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (= (and start!52744 res!203900) b!243996))

(assert (= (and b!243996 res!203890) b!243991))

(assert (= (and b!243991 res!203897) b!243998))

(assert (= (and b!243998 res!203895) b!243995))

(assert (= (and b!243995 res!203891) b!243997))

(assert (= (and b!243997 res!203899) b!244001))

(assert (= (and b!244001 res!203898) b!243992))

(assert (= (and b!243998 res!203896) b!244004))

(assert (= (and b!244004 res!203893) b!243993))

(assert (= (and b!243993 res!203901) b!244000))

(assert (= (and b!243998 res!203892) b!243994))

(assert (= (and b!243994 res!203889) b!244003))

(assert (= (and b!243998 res!203894) b!243999))

(assert (= start!52744 b!244002))

(declare-fun m!367691 () Bool)

(assert (=> b!243993 m!367691))

(declare-fun m!367693 () Bool)

(assert (=> b!243997 m!367693))

(declare-fun m!367695 () Bool)

(assert (=> b!244002 m!367695))

(declare-fun m!367697 () Bool)

(assert (=> start!52744 m!367697))

(declare-fun m!367699 () Bool)

(assert (=> b!243992 m!367699))

(declare-fun m!367701 () Bool)

(assert (=> b!243996 m!367701))

(declare-fun m!367703 () Bool)

(assert (=> b!244000 m!367703))

(declare-fun m!367705 () Bool)

(assert (=> b!244000 m!367705))

(declare-fun m!367707 () Bool)

(assert (=> b!244000 m!367707))

(declare-fun m!367709 () Bool)

(assert (=> b!244000 m!367709))

(declare-fun m!367711 () Bool)

(assert (=> b!244001 m!367711))

(assert (=> b!244001 m!367711))

(declare-fun m!367713 () Bool)

(assert (=> b!244001 m!367713))

(declare-fun m!367715 () Bool)

(assert (=> b!244004 m!367715))

(declare-fun m!367717 () Bool)

(assert (=> b!244004 m!367717))

(declare-fun m!367719 () Bool)

(assert (=> b!243994 m!367719))

(declare-fun m!367721 () Bool)

(assert (=> b!244003 m!367721))

(declare-fun m!367723 () Bool)

(assert (=> b!243998 m!367723))

(declare-fun m!367725 () Bool)

(assert (=> b!243998 m!367725))

(declare-fun m!367727 () Bool)

(assert (=> b!243998 m!367727))

(declare-fun m!367729 () Bool)

(assert (=> b!243998 m!367729))

(declare-fun m!367731 () Bool)

(assert (=> b!243998 m!367731))

(declare-fun m!367733 () Bool)

(assert (=> b!243998 m!367733))

(declare-fun m!367735 () Bool)

(assert (=> b!243998 m!367735))

(declare-fun m!367737 () Bool)

(assert (=> b!243998 m!367737))

(declare-fun m!367739 () Bool)

(assert (=> b!243998 m!367739))

(declare-fun m!367741 () Bool)

(assert (=> b!243998 m!367741))

(declare-fun m!367743 () Bool)

(assert (=> b!243998 m!367743))

(declare-fun m!367745 () Bool)

(assert (=> b!243998 m!367745))

(declare-fun m!367747 () Bool)

(assert (=> b!243998 m!367747))

(declare-fun m!367749 () Bool)

(assert (=> b!243998 m!367749))

(assert (=> b!243998 m!367709))

(declare-fun m!367751 () Bool)

(assert (=> b!243998 m!367751))

(declare-fun m!367753 () Bool)

(assert (=> b!243998 m!367753))

(assert (=> b!243995 m!367717))

(declare-fun m!367755 () Bool)

(assert (=> b!243995 m!367755))

(check-sat (not b!244003) (not b!244001) (not b!243998) (not b!243996) (not b!243994) (not b!244000) (not b!243997) (not b!243992) (not b!243995) (not b!244004) (not b!244002) (not b!243993) (not start!52744))
