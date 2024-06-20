; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!53700 () Bool)

(assert start!53700)

(declare-fun b!249628 () Bool)

(declare-fun e!172993 () Bool)

(declare-fun e!172991 () Bool)

(assert (=> b!249628 (= e!172993 e!172991)))

(declare-fun res!208929 () Bool)

(assert (=> b!249628 (=> (not res!208929) (not e!172991))))

(declare-fun lt!388326 () (_ BitVec 64))

(declare-fun lt!388328 () (_ BitVec 64))

(assert (=> b!249628 (= res!208929 (= lt!388326 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!388328)))))

(declare-datatypes ((array!13609 0))(
  ( (array!13610 (arr!6955 (Array (_ BitVec 32) (_ BitVec 8))) (size!5968 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10858 0))(
  ( (BitStream!10859 (buf!6461 array!13609) (currentByte!11892 (_ BitVec 32)) (currentBit!11887 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!18072 0))(
  ( (Unit!18073) )
))
(declare-datatypes ((tuple2!21378 0))(
  ( (tuple2!21379 (_1!11614 Unit!18072) (_2!11614 BitStream!10858)) )
))
(declare-fun lt!388329 () tuple2!21378)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!249628 (= lt!388326 (bitIndex!0 (size!5968 (buf!6461 (_2!11614 lt!388329))) (currentByte!11892 (_2!11614 lt!388329)) (currentBit!11887 (_2!11614 lt!388329))))))

(declare-fun thiss!1005 () BitStream!10858)

(assert (=> b!249628 (= lt!388328 (bitIndex!0 (size!5968 (buf!6461 thiss!1005)) (currentByte!11892 thiss!1005) (currentBit!11887 thiss!1005)))))

(declare-fun b!249629 () Bool)

(declare-fun e!172992 () Bool)

(declare-fun from!289 () (_ BitVec 64))

(assert (=> b!249629 (= e!172992 (not (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!249629 (validate_offset_bits!1 ((_ sign_extend 32) (size!5968 (buf!6461 (_2!11614 lt!388329)))) ((_ sign_extend 32) (currentByte!11892 (_2!11614 lt!388329))) ((_ sign_extend 32) (currentBit!11887 (_2!11614 lt!388329))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!388327 () Unit!18072)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10858 BitStream!10858 (_ BitVec 64) (_ BitVec 64)) Unit!18072)

(assert (=> b!249629 (= lt!388327 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11614 lt!388329) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!249629 e!172993))

(declare-fun res!208927 () Bool)

(assert (=> b!249629 (=> (not res!208927) (not e!172993))))

(assert (=> b!249629 (= res!208927 (= (size!5968 (buf!6461 thiss!1005)) (size!5968 (buf!6461 (_2!11614 lt!388329)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendBit!0 (BitStream!10858 Bool) tuple2!21378)

(assert (=> b!249629 (= lt!388329 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!249630 () Bool)

(declare-fun e!172989 () Bool)

(assert (=> b!249630 (= e!172991 e!172989)))

(declare-fun res!208928 () Bool)

(assert (=> b!249630 (=> (not res!208928) (not e!172989))))

(declare-datatypes ((tuple2!21380 0))(
  ( (tuple2!21381 (_1!11615 BitStream!10858) (_2!11615 Bool)) )
))
(declare-fun lt!388325 () tuple2!21380)

(assert (=> b!249630 (= res!208928 (and (= (_2!11615 lt!388325) bit!26) (= (_1!11615 lt!388325) (_2!11614 lt!388329))))))

(declare-fun readBitPure!0 (BitStream!10858) tuple2!21380)

(declare-fun readerFrom!0 (BitStream!10858 (_ BitVec 32) (_ BitVec 32)) BitStream!10858)

(assert (=> b!249630 (= lt!388325 (readBitPure!0 (readerFrom!0 (_2!11614 lt!388329) (currentBit!11887 thiss!1005) (currentByte!11892 thiss!1005))))))

(declare-fun b!249631 () Bool)

(declare-fun res!208925 () Bool)

(assert (=> b!249631 (=> (not res!208925) (not e!172992))))

(assert (=> b!249631 (= res!208925 (bvslt from!289 nBits!297))))

(declare-fun b!249632 () Bool)

(assert (=> b!249632 (= e!172989 (= (bitIndex!0 (size!5968 (buf!6461 (_1!11615 lt!388325))) (currentByte!11892 (_1!11615 lt!388325)) (currentBit!11887 (_1!11615 lt!388325))) lt!388326))))

(declare-fun b!249634 () Bool)

(declare-fun res!208924 () Bool)

(assert (=> b!249634 (=> (not res!208924) (not e!172992))))

(assert (=> b!249634 (= res!208924 (validate_offset_bits!1 ((_ sign_extend 32) (size!5968 (buf!6461 thiss!1005))) ((_ sign_extend 32) (currentByte!11892 thiss!1005)) ((_ sign_extend 32) (currentBit!11887 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!249635 () Bool)

(declare-fun res!208923 () Bool)

(assert (=> b!249635 (=> (not res!208923) (not e!172991))))

(declare-fun isPrefixOf!0 (BitStream!10858 BitStream!10858) Bool)

(assert (=> b!249635 (= res!208923 (isPrefixOf!0 thiss!1005 (_2!11614 lt!388329)))))

(declare-fun res!208926 () Bool)

(assert (=> start!53700 (=> (not res!208926) (not e!172992))))

(assert (=> start!53700 (= res!208926 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53700 e!172992))

(assert (=> start!53700 true))

(declare-fun e!172990 () Bool)

(declare-fun inv!12 (BitStream!10858) Bool)

(assert (=> start!53700 (and (inv!12 thiss!1005) e!172990)))

(declare-fun b!249633 () Bool)

(declare-fun array_inv!5709 (array!13609) Bool)

(assert (=> b!249633 (= e!172990 (array_inv!5709 (buf!6461 thiss!1005)))))

(assert (= (and start!53700 res!208926) b!249634))

(assert (= (and b!249634 res!208924) b!249631))

(assert (= (and b!249631 res!208925) b!249629))

(assert (= (and b!249629 res!208927) b!249628))

(assert (= (and b!249628 res!208929) b!249635))

(assert (= (and b!249635 res!208923) b!249630))

(assert (= (and b!249630 res!208928) b!249632))

(assert (= start!53700 b!249633))

(declare-fun m!376029 () Bool)

(assert (=> b!249634 m!376029))

(declare-fun m!376031 () Bool)

(assert (=> b!249633 m!376031))

(declare-fun m!376033 () Bool)

(assert (=> b!249635 m!376033))

(declare-fun m!376035 () Bool)

(assert (=> b!249628 m!376035))

(declare-fun m!376037 () Bool)

(assert (=> b!249628 m!376037))

(declare-fun m!376039 () Bool)

(assert (=> b!249632 m!376039))

(declare-fun m!376041 () Bool)

(assert (=> b!249630 m!376041))

(assert (=> b!249630 m!376041))

(declare-fun m!376043 () Bool)

(assert (=> b!249630 m!376043))

(declare-fun m!376045 () Bool)

(assert (=> b!249629 m!376045))

(declare-fun m!376047 () Bool)

(assert (=> b!249629 m!376047))

(declare-fun m!376049 () Bool)

(assert (=> b!249629 m!376049))

(declare-fun m!376051 () Bool)

(assert (=> start!53700 m!376051))

(push 1)

(assert (not b!249634))

(assert (not b!249628))

(assert (not b!249632))

(assert (not b!249630))

(assert (not b!249635))

(assert (not b!249629))

(assert (not b!249633))

(assert (not start!53700))

(check-sat)

(pop 1)

(push 1)

(check-sat)

