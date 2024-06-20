; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53672 () Bool)

(assert start!53672)

(declare-fun res!208629 () Bool)

(declare-fun e!172737 () Bool)

(assert (=> start!53672 (=> (not res!208629) (not e!172737))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53672 (= res!208629 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53672 e!172737))

(assert (=> start!53672 true))

(declare-datatypes ((array!13581 0))(
  ( (array!13582 (arr!6941 (Array (_ BitVec 32) (_ BitVec 8))) (size!5954 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10830 0))(
  ( (BitStream!10831 (buf!6447 array!13581) (currentByte!11878 (_ BitVec 32)) (currentBit!11873 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10830)

(declare-fun e!172738 () Bool)

(declare-fun inv!12 (BitStream!10830) Bool)

(assert (=> start!53672 (and (inv!12 thiss!1005) e!172738)))

(declare-fun b!249292 () Bool)

(declare-fun res!208632 () Bool)

(declare-fun e!172739 () Bool)

(assert (=> b!249292 (=> (not res!208632) (not e!172739))))

(declare-datatypes ((Unit!18044 0))(
  ( (Unit!18045) )
))
(declare-datatypes ((tuple2!21322 0))(
  ( (tuple2!21323 (_1!11586 Unit!18044) (_2!11586 BitStream!10830)) )
))
(declare-fun lt!388139 () tuple2!21322)

(declare-fun isPrefixOf!0 (BitStream!10830 BitStream!10830) Bool)

(assert (=> b!249292 (= res!208632 (isPrefixOf!0 thiss!1005 (_2!11586 lt!388139)))))

(declare-fun b!249293 () Bool)

(declare-fun res!208633 () Bool)

(assert (=> b!249293 (=> (not res!208633) (not e!172737))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249293 (= res!208633 (validate_offset_bits!1 ((_ sign_extend 32) (size!5954 (buf!6447 thiss!1005))) ((_ sign_extend 32) (currentByte!11878 thiss!1005)) ((_ sign_extend 32) (currentBit!11873 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249294 () Bool)

(declare-fun res!208635 () Bool)

(assert (=> b!249294 (=> (not res!208635) (not e!172737))))

(assert (=> b!249294 (= res!208635 (bvslt from!289 nBits!297))))

(declare-fun b!249295 () Bool)

(assert (=> b!249295 (= e!172737 (not true))))

(declare-fun e!172741 () Bool)

(assert (=> b!249295 e!172741))

(declare-fun res!208634 () Bool)

(assert (=> b!249295 (=> (not res!208634) (not e!172741))))

(assert (=> b!249295 (= res!208634 (= (size!5954 (buf!6447 thiss!1005)) (size!5954 (buf!6447 (_2!11586 lt!388139)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10830 Bool) tuple2!21322)

(assert (=> b!249295 (= lt!388139 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249296 () Bool)

(assert (=> b!249296 (= e!172741 e!172739)))

(declare-fun res!208631 () Bool)

(assert (=> b!249296 (=> (not res!208631) (not e!172739))))

(declare-fun lt!388140 () (_ BitVec 64))

(declare-fun lt!388137 () (_ BitVec 64))

(assert (=> b!249296 (= res!208631 (= lt!388140 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388137)))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249296 (= lt!388140 (bitIndex!0 (size!5954 (buf!6447 (_2!11586 lt!388139))) (currentByte!11878 (_2!11586 lt!388139)) (currentBit!11873 (_2!11586 lt!388139))))))

(assert (=> b!249296 (= lt!388137 (bitIndex!0 (size!5954 (buf!6447 thiss!1005)) (currentByte!11878 thiss!1005) (currentBit!11873 thiss!1005)))))

(declare-fun b!249297 () Bool)

(declare-fun array_inv!5695 (array!13581) Bool)

(assert (=> b!249297 (= e!172738 (array_inv!5695 (buf!6447 thiss!1005)))))

(declare-fun b!249298 () Bool)

(declare-fun e!172740 () Bool)

(declare-datatypes ((tuple2!21324 0))(
  ( (tuple2!21325 (_1!11587 BitStream!10830) (_2!11587 Bool)) )
))
(declare-fun lt!388138 () tuple2!21324)

(assert (=> b!249298 (= e!172740 (= (bitIndex!0 (size!5954 (buf!6447 (_1!11587 lt!388138))) (currentByte!11878 (_1!11587 lt!388138)) (currentBit!11873 (_1!11587 lt!388138))) lt!388140))))

(declare-fun b!249299 () Bool)

(assert (=> b!249299 (= e!172739 e!172740)))

(declare-fun res!208630 () Bool)

(assert (=> b!249299 (=> (not res!208630) (not e!172740))))

(assert (=> b!249299 (= res!208630 (and (= (_2!11587 lt!388138) bit!26) (= (_1!11587 lt!388138) (_2!11586 lt!388139))))))

(declare-fun readBitPure!0 (BitStream!10830) tuple2!21324)

(declare-fun readerFrom!0 (BitStream!10830 (_ BitVec 32) (_ BitVec 32)) BitStream!10830)

(assert (=> b!249299 (= lt!388138 (readBitPure!0 (readerFrom!0 (_2!11586 lt!388139) (currentBit!11873 thiss!1005) (currentByte!11878 thiss!1005))))))

(assert (= (and start!53672 res!208629) b!249293))

(assert (= (and b!249293 res!208633) b!249294))

(assert (= (and b!249294 res!208635) b!249295))

(assert (= (and b!249295 res!208634) b!249296))

(assert (= (and b!249296 res!208631) b!249292))

(assert (= (and b!249292 res!208632) b!249299))

(assert (= (and b!249299 res!208630) b!249298))

(assert (= start!53672 b!249297))

(declare-fun m!375725 () Bool)

(assert (=> b!249298 m!375725))

(declare-fun m!375727 () Bool)

(assert (=> b!249295 m!375727))

(declare-fun m!375729 () Bool)

(assert (=> b!249296 m!375729))

(declare-fun m!375731 () Bool)

(assert (=> b!249296 m!375731))

(declare-fun m!375733 () Bool)

(assert (=> b!249292 m!375733))

(declare-fun m!375735 () Bool)

(assert (=> b!249297 m!375735))

(declare-fun m!375737 () Bool)

(assert (=> start!53672 m!375737))

(declare-fun m!375739 () Bool)

(assert (=> b!249293 m!375739))

(declare-fun m!375741 () Bool)

(assert (=> b!249299 m!375741))

(assert (=> b!249299 m!375741))

(declare-fun m!375743 () Bool)

(assert (=> b!249299 m!375743))

(check-sat (not b!249296) (not b!249295) (not start!53672) (not b!249293) (not b!249297) (not b!249298) (not b!249292) (not b!249299))
