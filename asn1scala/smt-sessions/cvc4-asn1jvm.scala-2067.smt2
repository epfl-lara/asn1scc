; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!52464 () Bool)

(assert start!52464)

(declare-fun b!241779 () Bool)

(declare-fun res!201850 () Bool)

(declare-fun e!167608 () Bool)

(assert (=> b!241779 (=> (not res!201850) (not e!167608))))

(declare-datatypes ((array!13275 0))(
  ( (array!13276 (arr!6804 (Array (_ BitVec 32) (_ BitVec 8))) (size!5817 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10556 0))(
  ( (BitStream!10557 (buf!6283 array!13275) (currentByte!11646 (_ BitVec 32)) (currentBit!11641 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!17717 0))(
  ( (Unit!17718) )
))
(declare-datatypes ((tuple2!20652 0))(
  ( (tuple2!20653 (_1!11248 Unit!17717) (_2!11248 BitStream!10556)) )
))
(declare-fun lt!377229 () tuple2!20652)

(declare-fun lt!377227 () tuple2!20652)

(declare-fun isPrefixOf!0 (BitStream!10556 BitStream!10556) Bool)

(assert (=> b!241779 (= res!201850 (isPrefixOf!0 (_2!11248 lt!377229) (_2!11248 lt!377227)))))

(declare-fun b!241780 () Bool)

(declare-fun res!201856 () Bool)

(declare-fun e!167606 () Bool)

(assert (=> b!241780 (=> (not res!201856) (not e!167606))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(assert (=> b!241780 (= res!201856 (bvslt from!289 nBits!297))))

(declare-fun b!241781 () Bool)

(declare-fun e!167605 () Bool)

(declare-datatypes ((tuple2!20654 0))(
  ( (tuple2!20655 (_1!11249 BitStream!10556) (_2!11249 Bool)) )
))
(declare-fun lt!377230 () tuple2!20654)

(declare-fun lt!377222 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!241781 (= e!167605 (= (bitIndex!0 (size!5817 (buf!6283 (_1!11249 lt!377230))) (currentByte!11646 (_1!11249 lt!377230)) (currentBit!11641 (_1!11249 lt!377230))) lt!377222))))

(declare-fun b!241782 () Bool)

(declare-fun e!167602 () Bool)

(assert (=> b!241782 (= e!167602 e!167605)))

(declare-fun res!201851 () Bool)

(assert (=> b!241782 (=> (not res!201851) (not e!167605))))

(declare-fun bit!26 () Bool)

(assert (=> b!241782 (= res!201851 (and (= (_2!11249 lt!377230) bit!26) (= (_1!11249 lt!377230) (_2!11248 lt!377229))))))

(declare-fun thiss!1005 () BitStream!10556)

(declare-fun readBitPure!0 (BitStream!10556) tuple2!20654)

(declare-fun readerFrom!0 (BitStream!10556 (_ BitVec 32) (_ BitVec 32)) BitStream!10556)

(assert (=> b!241782 (= lt!377230 (readBitPure!0 (readerFrom!0 (_2!11248 lt!377229) (currentBit!11641 thiss!1005) (currentByte!11646 thiss!1005))))))

(declare-fun b!241783 () Bool)

(declare-fun e!167609 () Bool)

(assert (=> b!241783 (= e!167609 true)))

(declare-fun lt!377232 () Bool)

(assert (=> b!241783 (= lt!377232 (isPrefixOf!0 (_2!11248 lt!377229) (_2!11248 lt!377227)))))

(declare-fun b!241784 () Bool)

(declare-fun e!167603 () Bool)

(assert (=> b!241784 (= e!167603 e!167608)))

(declare-fun res!201858 () Bool)

(assert (=> b!241784 (=> (not res!201858) (not e!167608))))

(declare-fun lt!377223 () (_ BitVec 64))

(assert (=> b!241784 (= res!201858 (= (bitIndex!0 (size!5817 (buf!6283 (_2!11248 lt!377227))) (currentByte!11646 (_2!11248 lt!377227)) (currentBit!11641 (_2!11248 lt!377227))) (bvadd (bitIndex!0 (size!5817 (buf!6283 (_2!11248 lt!377229))) (currentByte!11646 (_2!11248 lt!377229)) (currentBit!11641 (_2!11248 lt!377229))) lt!377223)))))

(assert (=> b!241784 (= lt!377223 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun res!201848 () Bool)

(assert (=> start!52464 (=> (not res!201848) (not e!167606))))

(assert (=> start!52464 (= res!201848 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52464 e!167606))

(assert (=> start!52464 true))

(declare-fun e!167604 () Bool)

(declare-fun inv!12 (BitStream!10556) Bool)

(assert (=> start!52464 (and (inv!12 thiss!1005) e!167604)))

(declare-fun b!241785 () Bool)

(declare-fun array_inv!5558 (array!13275) Bool)

(assert (=> b!241785 (= e!167604 (array_inv!5558 (buf!6283 thiss!1005)))))

(declare-fun b!241786 () Bool)

(assert (=> b!241786 (= e!167606 (not e!167609))))

(declare-fun res!201849 () Bool)

(assert (=> b!241786 (=> res!201849 e!167609)))

(assert (=> b!241786 (= res!201849 (not (isPrefixOf!0 thiss!1005 (_2!11248 lt!377229))))))

(assert (=> b!241786 e!167603))

(declare-fun res!201853 () Bool)

(assert (=> b!241786 (=> (not res!201853) (not e!167603))))

(assert (=> b!241786 (= res!201853 (= (size!5817 (buf!6283 (_2!11248 lt!377229))) (size!5817 (buf!6283 (_2!11248 lt!377227)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10556 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20652)

(assert (=> b!241786 (= lt!377227 (appendNBitsLoop!0 (_2!11248 lt!377229) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!241786 (validate_offset_bits!1 ((_ sign_extend 32) (size!5817 (buf!6283 (_2!11248 lt!377229)))) ((_ sign_extend 32) (currentByte!11646 (_2!11248 lt!377229))) ((_ sign_extend 32) (currentBit!11641 (_2!11248 lt!377229))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!377231 () Unit!17717)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10556 BitStream!10556 (_ BitVec 64) (_ BitVec 64)) Unit!17717)

(assert (=> b!241786 (= lt!377231 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11248 lt!377229) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!167607 () Bool)

(assert (=> b!241786 e!167607))

(declare-fun res!201855 () Bool)

(assert (=> b!241786 (=> (not res!201855) (not e!167607))))

(assert (=> b!241786 (= res!201855 (= (size!5817 (buf!6283 thiss!1005)) (size!5817 (buf!6283 (_2!11248 lt!377229)))))))

(declare-fun appendBit!0 (BitStream!10556 Bool) tuple2!20652)

(assert (=> b!241786 (= lt!377229 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!241787 () Bool)

(declare-fun res!201852 () Bool)

(assert (=> b!241787 (=> (not res!201852) (not e!167606))))

(assert (=> b!241787 (= res!201852 (validate_offset_bits!1 ((_ sign_extend 32) (size!5817 (buf!6283 thiss!1005))) ((_ sign_extend 32) (currentByte!11646 thiss!1005)) ((_ sign_extend 32) (currentBit!11641 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!241788 () Bool)

(declare-fun res!201854 () Bool)

(assert (=> b!241788 (=> (not res!201854) (not e!167602))))

(assert (=> b!241788 (= res!201854 (isPrefixOf!0 thiss!1005 (_2!11248 lt!377229)))))

(declare-fun b!241789 () Bool)

(assert (=> b!241789 (= e!167607 e!167602)))

(declare-fun res!201857 () Bool)

(assert (=> b!241789 (=> (not res!201857) (not e!167602))))

(declare-fun lt!377226 () (_ BitVec 64))

(assert (=> b!241789 (= res!201857 (= lt!377222 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!377226)))))

(assert (=> b!241789 (= lt!377222 (bitIndex!0 (size!5817 (buf!6283 (_2!11248 lt!377229))) (currentByte!11646 (_2!11248 lt!377229)) (currentBit!11641 (_2!11248 lt!377229))))))

(assert (=> b!241789 (= lt!377226 (bitIndex!0 (size!5817 (buf!6283 thiss!1005)) (currentByte!11646 thiss!1005) (currentBit!11641 thiss!1005)))))

(declare-fun b!241790 () Bool)

(declare-fun lt!377224 () tuple2!20654)

(declare-datatypes ((tuple2!20656 0))(
  ( (tuple2!20657 (_1!11250 BitStream!10556) (_2!11250 BitStream!10556)) )
))
(declare-fun lt!377225 () tuple2!20656)

(assert (=> b!241790 (= e!167608 (not (or (not (_2!11249 lt!377224)) (not (= (_1!11249 lt!377224) (_2!11250 lt!377225))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10556 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20654)

(assert (=> b!241790 (= lt!377224 (checkBitsLoopPure!0 (_1!11250 lt!377225) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!241790 (validate_offset_bits!1 ((_ sign_extend 32) (size!5817 (buf!6283 (_2!11248 lt!377227)))) ((_ sign_extend 32) (currentByte!11646 (_2!11248 lt!377229))) ((_ sign_extend 32) (currentBit!11641 (_2!11248 lt!377229))) lt!377223)))

(declare-fun lt!377228 () Unit!17717)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10556 array!13275 (_ BitVec 64)) Unit!17717)

(assert (=> b!241790 (= lt!377228 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11248 lt!377229) (buf!6283 (_2!11248 lt!377227)) lt!377223))))

(declare-fun reader!0 (BitStream!10556 BitStream!10556) tuple2!20656)

(assert (=> b!241790 (= lt!377225 (reader!0 (_2!11248 lt!377229) (_2!11248 lt!377227)))))

(assert (= (and start!52464 res!201848) b!241787))

(assert (= (and b!241787 res!201852) b!241780))

(assert (= (and b!241780 res!201856) b!241786))

(assert (= (and b!241786 res!201855) b!241789))

(assert (= (and b!241789 res!201857) b!241788))

(assert (= (and b!241788 res!201854) b!241782))

(assert (= (and b!241782 res!201851) b!241781))

(assert (= (and b!241786 res!201853) b!241784))

(assert (= (and b!241784 res!201858) b!241779))

(assert (= (and b!241779 res!201850) b!241790))

(assert (= (and b!241786 (not res!201849)) b!241783))

(assert (= start!52464 b!241785))

(declare-fun m!364443 () Bool)

(assert (=> b!241779 m!364443))

(declare-fun m!364445 () Bool)

(assert (=> b!241788 m!364445))

(assert (=> b!241783 m!364443))

(declare-fun m!364447 () Bool)

(assert (=> b!241790 m!364447))

(declare-fun m!364449 () Bool)

(assert (=> b!241790 m!364449))

(declare-fun m!364451 () Bool)

(assert (=> b!241790 m!364451))

(declare-fun m!364453 () Bool)

(assert (=> b!241790 m!364453))

(declare-fun m!364455 () Bool)

(assert (=> b!241782 m!364455))

(assert (=> b!241782 m!364455))

(declare-fun m!364457 () Bool)

(assert (=> b!241782 m!364457))

(declare-fun m!364459 () Bool)

(assert (=> b!241789 m!364459))

(declare-fun m!364461 () Bool)

(assert (=> b!241789 m!364461))

(declare-fun m!364463 () Bool)

(assert (=> b!241781 m!364463))

(declare-fun m!364465 () Bool)

(assert (=> b!241786 m!364465))

(declare-fun m!364467 () Bool)

(assert (=> b!241786 m!364467))

(declare-fun m!364469 () Bool)

(assert (=> b!241786 m!364469))

(assert (=> b!241786 m!364445))

(declare-fun m!364471 () Bool)

(assert (=> b!241786 m!364471))

(declare-fun m!364473 () Bool)

(assert (=> b!241784 m!364473))

(assert (=> b!241784 m!364459))

(declare-fun m!364475 () Bool)

(assert (=> start!52464 m!364475))

(declare-fun m!364477 () Bool)

(assert (=> b!241787 m!364477))

(declare-fun m!364479 () Bool)

(assert (=> b!241785 m!364479))

(push 1)

(assert (not b!241783))

(assert (not b!241790))

(assert (not b!241786))

(assert (not b!241785))

(assert (not b!241788))

(assert (not b!241779))

(assert (not b!241782))

(assert (not b!241787))

(assert (not b!241781))

(assert (not b!241789))

(assert (not b!241784))

(assert (not start!52464))

(check-sat)

