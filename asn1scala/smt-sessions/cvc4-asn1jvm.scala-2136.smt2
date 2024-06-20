; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54100 () Bool)

(assert start!54100)

(declare-fun b!252376 () Bool)

(declare-fun e!174890 () Bool)

(declare-fun e!174881 () Bool)

(assert (=> b!252376 (= e!174890 e!174881)))

(declare-fun res!211445 () Bool)

(assert (=> b!252376 (=> (not res!211445) (not e!174881))))

(declare-datatypes ((array!13724 0))(
  ( (array!13725 (arr!7008 (Array (_ BitVec 32) (_ BitVec 8))) (size!6021 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10964 0))(
  ( (BitStream!10965 (buf!6523 array!13724) (currentByte!11978 (_ BitVec 32)) (currentBit!11973 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18190 0))(
  ( (Unit!18191) )
))
(declare-datatypes ((tuple2!21696 0))(
  ( (tuple2!21697 (_1!11776 Unit!18190) (_2!11776 BitStream!10964)) )
))
(declare-fun lt!392001 () tuple2!21696)

(declare-fun lt!392009 () (_ BitVec 64))

(declare-fun lt!392008 () tuple2!21696)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!252376 (= res!211445 (= (bitIndex!0 (size!6021 (buf!6523 (_2!11776 lt!392008))) (currentByte!11978 (_2!11776 lt!392008)) (currentBit!11973 (_2!11776 lt!392008))) (bvadd (bitIndex!0 (size!6021 (buf!6523 (_2!11776 lt!392001))) (currentByte!11978 (_2!11776 lt!392001)) (currentBit!11973 (_2!11776 lt!392001))) lt!392009)))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!252376 (= lt!392009 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!252377 () Bool)

(declare-fun e!174883 () Bool)

(assert (=> b!252377 (= e!174883 (not true))))

(declare-datatypes ((tuple2!21698 0))(
  ( (tuple2!21699 (_1!11777 BitStream!10964) (_2!11777 Bool)) )
))
(declare-fun lt!391995 () tuple2!21698)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!21700 0))(
  ( (tuple2!21701 (_1!11778 BitStream!10964) (_2!11778 BitStream!10964)) )
))
(declare-fun lt!391994 () tuple2!21700)

(declare-fun checkBitsLoopPure!0 (BitStream!10964 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21698)

(assert (=> b!252377 (= lt!391995 (checkBitsLoopPure!0 (_1!11778 lt!391994) nBits!297 bit!26 from!289))))

(declare-fun thiss!1005 () BitStream!10964)

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!252377 (validate_offset_bits!1 ((_ sign_extend 32) (size!6021 (buf!6523 (_2!11776 lt!392008)))) ((_ sign_extend 32) (currentByte!11978 thiss!1005)) ((_ sign_extend 32) (currentBit!11973 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!392003 () Unit!18190)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10964 array!13724 (_ BitVec 64)) Unit!18190)

(assert (=> b!252377 (= lt!392003 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6523 (_2!11776 lt!392008)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10964) tuple2!21698)

(assert (=> b!252377 (= (_2!11777 (readBitPure!0 (_1!11778 lt!391994))) bit!26)))

(declare-fun lt!392000 () tuple2!21700)

(declare-fun reader!0 (BitStream!10964 BitStream!10964) tuple2!21700)

(assert (=> b!252377 (= lt!392000 (reader!0 (_2!11776 lt!392001) (_2!11776 lt!392008)))))

(assert (=> b!252377 (= lt!391994 (reader!0 thiss!1005 (_2!11776 lt!392008)))))

(declare-fun e!174884 () Bool)

(assert (=> b!252377 e!174884))

(declare-fun res!211444 () Bool)

(assert (=> b!252377 (=> (not res!211444) (not e!174884))))

(declare-fun lt!391997 () tuple2!21698)

(declare-fun lt!392002 () tuple2!21698)

(assert (=> b!252377 (= res!211444 (= (bitIndex!0 (size!6021 (buf!6523 (_1!11777 lt!391997))) (currentByte!11978 (_1!11777 lt!391997)) (currentBit!11973 (_1!11777 lt!391997))) (bitIndex!0 (size!6021 (buf!6523 (_1!11777 lt!392002))) (currentByte!11978 (_1!11777 lt!392002)) (currentBit!11973 (_1!11777 lt!392002)))))))

(declare-fun lt!392006 () Unit!18190)

(declare-fun lt!391996 () BitStream!10964)

(declare-fun readBitPrefixLemma!0 (BitStream!10964 BitStream!10964) Unit!18190)

(assert (=> b!252377 (= lt!392006 (readBitPrefixLemma!0 lt!391996 (_2!11776 lt!392008)))))

(assert (=> b!252377 (= lt!392002 (readBitPure!0 (BitStream!10965 (buf!6523 (_2!11776 lt!392008)) (currentByte!11978 thiss!1005) (currentBit!11973 thiss!1005))))))

(assert (=> b!252377 (= lt!391997 (readBitPure!0 lt!391996))))

(assert (=> b!252377 (= lt!391996 (BitStream!10965 (buf!6523 (_2!11776 lt!392001)) (currentByte!11978 thiss!1005) (currentBit!11973 thiss!1005)))))

(declare-fun e!174888 () Bool)

(assert (=> b!252377 e!174888))

(declare-fun res!211438 () Bool)

(assert (=> b!252377 (=> (not res!211438) (not e!174888))))

(declare-fun isPrefixOf!0 (BitStream!10964 BitStream!10964) Bool)

(assert (=> b!252377 (= res!211438 (isPrefixOf!0 thiss!1005 (_2!11776 lt!392008)))))

(declare-fun lt!391998 () Unit!18190)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10964 BitStream!10964 BitStream!10964) Unit!18190)

(assert (=> b!252377 (= lt!391998 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11776 lt!392001) (_2!11776 lt!392008)))))

(assert (=> b!252377 e!174890))

(declare-fun res!211441 () Bool)

(assert (=> b!252377 (=> (not res!211441) (not e!174890))))

(assert (=> b!252377 (= res!211441 (= (size!6021 (buf!6523 (_2!11776 lt!392001))) (size!6021 (buf!6523 (_2!11776 lt!392008)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10964 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21696)

(assert (=> b!252377 (= lt!392008 (appendNBitsLoop!0 (_2!11776 lt!392001) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252377 (validate_offset_bits!1 ((_ sign_extend 32) (size!6021 (buf!6523 (_2!11776 lt!392001)))) ((_ sign_extend 32) (currentByte!11978 (_2!11776 lt!392001))) ((_ sign_extend 32) (currentBit!11973 (_2!11776 lt!392001))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!392004 () Unit!18190)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10964 BitStream!10964 (_ BitVec 64) (_ BitVec 64)) Unit!18190)

(assert (=> b!252377 (= lt!392004 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11776 lt!392001) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!174885 () Bool)

(assert (=> b!252377 e!174885))

(declare-fun res!211437 () Bool)

(assert (=> b!252377 (=> (not res!211437) (not e!174885))))

(assert (=> b!252377 (= res!211437 (= (size!6021 (buf!6523 thiss!1005)) (size!6021 (buf!6523 (_2!11776 lt!392001)))))))

(declare-fun appendBit!0 (BitStream!10964 Bool) tuple2!21696)

(assert (=> b!252377 (= lt!392001 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!252378 () Bool)

(declare-fun res!211442 () Bool)

(declare-fun e!174882 () Bool)

(assert (=> b!252378 (=> (not res!211442) (not e!174882))))

(assert (=> b!252378 (= res!211442 (isPrefixOf!0 thiss!1005 (_2!11776 lt!392001)))))

(declare-fun b!252379 () Bool)

(assert (=> b!252379 (= e!174885 e!174882)))

(declare-fun res!211439 () Bool)

(assert (=> b!252379 (=> (not res!211439) (not e!174882))))

(declare-fun lt!392005 () (_ BitVec 64))

(declare-fun lt!392007 () (_ BitVec 64))

(assert (=> b!252379 (= res!211439 (= lt!392005 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!392007)))))

(assert (=> b!252379 (= lt!392005 (bitIndex!0 (size!6021 (buf!6523 (_2!11776 lt!392001))) (currentByte!11978 (_2!11776 lt!392001)) (currentBit!11973 (_2!11776 lt!392001))))))

(assert (=> b!252379 (= lt!392007 (bitIndex!0 (size!6021 (buf!6523 thiss!1005)) (currentByte!11978 thiss!1005) (currentBit!11973 thiss!1005)))))

(declare-fun b!252380 () Bool)

(declare-fun e!174887 () Bool)

(declare-fun lt!392010 () tuple2!21698)

(assert (=> b!252380 (= e!174887 (= (bitIndex!0 (size!6021 (buf!6523 (_1!11777 lt!392010))) (currentByte!11978 (_1!11777 lt!392010)) (currentBit!11973 (_1!11777 lt!392010))) lt!392005))))

(declare-fun res!211446 () Bool)

(assert (=> start!54100 (=> (not res!211446) (not e!174883))))

(assert (=> start!54100 (= res!211446 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54100 e!174883))

(assert (=> start!54100 true))

(declare-fun e!174889 () Bool)

(declare-fun inv!12 (BitStream!10964) Bool)

(assert (=> start!54100 (and (inv!12 thiss!1005) e!174889)))

(declare-fun b!252381 () Bool)

(declare-fun res!211440 () Bool)

(assert (=> b!252381 (=> (not res!211440) (not e!174881))))

(assert (=> b!252381 (= res!211440 (isPrefixOf!0 (_2!11776 lt!392001) (_2!11776 lt!392008)))))

(declare-fun b!252382 () Bool)

(declare-fun res!211436 () Bool)

(assert (=> b!252382 (=> (not res!211436) (not e!174888))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!252382 (= res!211436 (invariant!0 (currentBit!11973 thiss!1005) (currentByte!11978 thiss!1005) (size!6021 (buf!6523 (_2!11776 lt!392001)))))))

(declare-fun b!252383 () Bool)

(declare-fun lt!391999 () tuple2!21698)

(declare-fun lt!391993 () tuple2!21700)

(assert (=> b!252383 (= e!174881 (not (or (not (_2!11777 lt!391999)) (not (= (_1!11777 lt!391999) (_2!11778 lt!391993))))))))

(assert (=> b!252383 (= lt!391999 (checkBitsLoopPure!0 (_1!11778 lt!391993) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!252383 (validate_offset_bits!1 ((_ sign_extend 32) (size!6021 (buf!6523 (_2!11776 lt!392008)))) ((_ sign_extend 32) (currentByte!11978 (_2!11776 lt!392001))) ((_ sign_extend 32) (currentBit!11973 (_2!11776 lt!392001))) lt!392009)))

(declare-fun lt!391992 () Unit!18190)

(assert (=> b!252383 (= lt!391992 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11776 lt!392001) (buf!6523 (_2!11776 lt!392008)) lt!392009))))

(assert (=> b!252383 (= lt!391993 (reader!0 (_2!11776 lt!392001) (_2!11776 lt!392008)))))

(declare-fun b!252384 () Bool)

(declare-fun res!211443 () Bool)

(assert (=> b!252384 (=> (not res!211443) (not e!174883))))

(assert (=> b!252384 (= res!211443 (validate_offset_bits!1 ((_ sign_extend 32) (size!6021 (buf!6523 thiss!1005))) ((_ sign_extend 32) (currentByte!11978 thiss!1005)) ((_ sign_extend 32) (currentBit!11973 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!252385 () Bool)

(declare-fun res!211434 () Bool)

(assert (=> b!252385 (=> (not res!211434) (not e!174883))))

(assert (=> b!252385 (= res!211434 (bvslt from!289 nBits!297))))

(declare-fun b!252386 () Bool)

(assert (=> b!252386 (= e!174882 e!174887)))

(declare-fun res!211435 () Bool)

(assert (=> b!252386 (=> (not res!211435) (not e!174887))))

(assert (=> b!252386 (= res!211435 (and (= (_2!11777 lt!392010) bit!26) (= (_1!11777 lt!392010) (_2!11776 lt!392001))))))

(declare-fun readerFrom!0 (BitStream!10964 (_ BitVec 32) (_ BitVec 32)) BitStream!10964)

(assert (=> b!252386 (= lt!392010 (readBitPure!0 (readerFrom!0 (_2!11776 lt!392001) (currentBit!11973 thiss!1005) (currentByte!11978 thiss!1005))))))

(declare-fun b!252387 () Bool)

(assert (=> b!252387 (= e!174884 (= (_2!11777 lt!391997) (_2!11777 lt!392002)))))

(declare-fun b!252388 () Bool)

(assert (=> b!252388 (= e!174888 (invariant!0 (currentBit!11973 thiss!1005) (currentByte!11978 thiss!1005) (size!6021 (buf!6523 (_2!11776 lt!392008)))))))

(declare-fun b!252389 () Bool)

(declare-fun array_inv!5762 (array!13724) Bool)

(assert (=> b!252389 (= e!174889 (array_inv!5762 (buf!6523 thiss!1005)))))

(assert (= (and start!54100 res!211446) b!252384))

(assert (= (and b!252384 res!211443) b!252385))

(assert (= (and b!252385 res!211434) b!252377))

(assert (= (and b!252377 res!211437) b!252379))

(assert (= (and b!252379 res!211439) b!252378))

(assert (= (and b!252378 res!211442) b!252386))

(assert (= (and b!252386 res!211435) b!252380))

(assert (= (and b!252377 res!211441) b!252376))

(assert (= (and b!252376 res!211445) b!252381))

(assert (= (and b!252381 res!211440) b!252383))

(assert (= (and b!252377 res!211438) b!252382))

(assert (= (and b!252382 res!211436) b!252388))

(assert (= (and b!252377 res!211444) b!252387))

(assert (= start!54100 b!252389))

(declare-fun m!379713 () Bool)

(assert (=> b!252386 m!379713))

(assert (=> b!252386 m!379713))

(declare-fun m!379715 () Bool)

(assert (=> b!252386 m!379715))

(declare-fun m!379717 () Bool)

(assert (=> b!252389 m!379717))

(declare-fun m!379719 () Bool)

(assert (=> b!252381 m!379719))

(declare-fun m!379721 () Bool)

(assert (=> b!252383 m!379721))

(declare-fun m!379723 () Bool)

(assert (=> b!252383 m!379723))

(declare-fun m!379725 () Bool)

(assert (=> b!252383 m!379725))

(declare-fun m!379727 () Bool)

(assert (=> b!252383 m!379727))

(declare-fun m!379729 () Bool)

(assert (=> b!252382 m!379729))

(declare-fun m!379731 () Bool)

(assert (=> b!252377 m!379731))

(assert (=> b!252377 m!379727))

(declare-fun m!379733 () Bool)

(assert (=> b!252377 m!379733))

(declare-fun m!379735 () Bool)

(assert (=> b!252377 m!379735))

(declare-fun m!379737 () Bool)

(assert (=> b!252377 m!379737))

(declare-fun m!379739 () Bool)

(assert (=> b!252377 m!379739))

(declare-fun m!379741 () Bool)

(assert (=> b!252377 m!379741))

(declare-fun m!379743 () Bool)

(assert (=> b!252377 m!379743))

(declare-fun m!379745 () Bool)

(assert (=> b!252377 m!379745))

(declare-fun m!379747 () Bool)

(assert (=> b!252377 m!379747))

(declare-fun m!379749 () Bool)

(assert (=> b!252377 m!379749))

(declare-fun m!379751 () Bool)

(assert (=> b!252377 m!379751))

(declare-fun m!379753 () Bool)

(assert (=> b!252377 m!379753))

(declare-fun m!379755 () Bool)

(assert (=> b!252377 m!379755))

(declare-fun m!379757 () Bool)

(assert (=> b!252377 m!379757))

(declare-fun m!379759 () Bool)

(assert (=> b!252377 m!379759))

(declare-fun m!379761 () Bool)

(assert (=> b!252377 m!379761))

(declare-fun m!379763 () Bool)

(assert (=> b!252388 m!379763))

(declare-fun m!379765 () Bool)

(assert (=> b!252379 m!379765))

(declare-fun m!379767 () Bool)

(assert (=> b!252379 m!379767))

(declare-fun m!379769 () Bool)

(assert (=> start!54100 m!379769))

(declare-fun m!379771 () Bool)

(assert (=> b!252384 m!379771))

(declare-fun m!379773 () Bool)

(assert (=> b!252380 m!379773))

(declare-fun m!379775 () Bool)

(assert (=> b!252378 m!379775))

(declare-fun m!379777 () Bool)

(assert (=> b!252376 m!379777))

(assert (=> b!252376 m!379765))

(push 1)

(assert (not b!252379))

(assert (not b!252386))

(assert (not b!252382))

(assert (not b!252389))

(assert (not b!252376))

(assert (not b!252384))

(assert (not b!252378))

(assert (not start!54100))

(assert (not b!252377))

(assert (not b!252388))

(assert (not b!252383))

(assert (not b!252380))

(assert (not b!252381))

(check-sat)

