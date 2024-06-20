; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!52504 () Bool)

(assert start!52504)

(declare-fun b!242599 () Bool)

(declare-fun res!202619 () Bool)

(declare-fun e!168195 () Bool)

(assert (=> b!242599 (=> (not res!202619) (not e!168195))))

(declare-datatypes ((array!13315 0))(
  ( (array!13316 (arr!6824 (Array (_ BitVec 32) (_ BitVec 8))) (size!5837 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10596 0))(
  ( (BitStream!10597 (buf!6303 array!13315) (currentByte!11666 (_ BitVec 32)) (currentBit!11661 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10596)

(declare-datatypes ((Unit!17757 0))(
  ( (Unit!17758) )
))
(declare-datatypes ((tuple2!20772 0))(
  ( (tuple2!20773 (_1!11308 Unit!17757) (_2!11308 BitStream!10596)) )
))
(declare-fun lt!378055 () tuple2!20772)

(declare-fun isPrefixOf!0 (BitStream!10596 BitStream!10596) Bool)

(assert (=> b!242599 (= res!202619 (isPrefixOf!0 thiss!1005 (_2!11308 lt!378055)))))

(declare-fun b!242600 () Bool)

(declare-fun e!168199 () Bool)

(declare-datatypes ((tuple2!20774 0))(
  ( (tuple2!20775 (_1!11309 BitStream!10596) (_2!11309 Bool)) )
))
(declare-fun lt!378062 () tuple2!20774)

(declare-fun lt!378058 () tuple2!20774)

(assert (=> b!242600 (= e!168199 (= (_2!11309 lt!378062) (_2!11309 lt!378058)))))

(declare-fun res!202614 () Bool)

(declare-fun e!168198 () Bool)

(assert (=> start!52504 (=> (not res!202614) (not e!168198))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!52504 (= res!202614 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!52504 e!168198))

(assert (=> start!52504 true))

(declare-fun e!168191 () Bool)

(declare-fun inv!12 (BitStream!10596) Bool)

(assert (=> start!52504 (and (inv!12 thiss!1005) e!168191)))

(declare-fun b!242601 () Bool)

(declare-fun e!168192 () Bool)

(declare-fun lt!378054 () tuple2!20774)

(declare-fun lt!378056 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!242601 (= e!168192 (= (bitIndex!0 (size!5837 (buf!6303 (_1!11309 lt!378054))) (currentByte!11666 (_1!11309 lt!378054)) (currentBit!11661 (_1!11309 lt!378054))) lt!378056))))

(declare-fun b!242602 () Bool)

(declare-fun res!202618 () Bool)

(declare-fun e!168194 () Bool)

(assert (=> b!242602 (=> (not res!202618) (not e!168194))))

(declare-fun lt!378047 () tuple2!20772)

(assert (=> b!242602 (= res!202618 (isPrefixOf!0 (_2!11308 lt!378055) (_2!11308 lt!378047)))))

(declare-fun b!242603 () Bool)

(declare-fun res!202613 () Bool)

(assert (=> b!242603 (=> (not res!202613) (not e!168198))))

(assert (=> b!242603 (= res!202613 (bvslt from!289 nBits!297))))

(declare-fun b!242604 () Bool)

(declare-datatypes ((tuple2!20776 0))(
  ( (tuple2!20777 (_1!11310 BitStream!10596) (_2!11310 BitStream!10596)) )
))
(declare-fun lt!378061 () tuple2!20776)

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242604 (= e!168198 (not (validate_offset_bit!0 ((_ sign_extend 32) (size!5837 (buf!6303 (_1!11310 lt!378061)))) ((_ sign_extend 32) (currentByte!11666 (_1!11310 lt!378061))) ((_ sign_extend 32) (currentBit!11661 (_1!11310 lt!378061))))))))

(declare-fun lt!378053 () tuple2!20776)

(declare-fun reader!0 (BitStream!10596 BitStream!10596) tuple2!20776)

(assert (=> b!242604 (= lt!378053 (reader!0 (_2!11308 lt!378055) (_2!11308 lt!378047)))))

(assert (=> b!242604 (= lt!378061 (reader!0 thiss!1005 (_2!11308 lt!378047)))))

(assert (=> b!242604 e!168199))

(declare-fun res!202617 () Bool)

(assert (=> b!242604 (=> (not res!202617) (not e!168199))))

(assert (=> b!242604 (= res!202617 (= (bitIndex!0 (size!5837 (buf!6303 (_1!11309 lt!378062))) (currentByte!11666 (_1!11309 lt!378062)) (currentBit!11661 (_1!11309 lt!378062))) (bitIndex!0 (size!5837 (buf!6303 (_1!11309 lt!378058))) (currentByte!11666 (_1!11309 lt!378058)) (currentBit!11661 (_1!11309 lt!378058)))))))

(declare-fun lt!378051 () Unit!17757)

(declare-fun lt!378059 () BitStream!10596)

(declare-fun readBitPrefixLemma!0 (BitStream!10596 BitStream!10596) Unit!17757)

(assert (=> b!242604 (= lt!378051 (readBitPrefixLemma!0 lt!378059 (_2!11308 lt!378047)))))

(declare-fun readBitPure!0 (BitStream!10596) tuple2!20774)

(assert (=> b!242604 (= lt!378058 (readBitPure!0 (BitStream!10597 (buf!6303 (_2!11308 lt!378047)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005))))))

(assert (=> b!242604 (= lt!378062 (readBitPure!0 lt!378059))))

(assert (=> b!242604 (= lt!378059 (BitStream!10597 (buf!6303 (_2!11308 lt!378055)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005)))))

(declare-fun e!168200 () Bool)

(assert (=> b!242604 e!168200))

(declare-fun res!202620 () Bool)

(assert (=> b!242604 (=> (not res!202620) (not e!168200))))

(assert (=> b!242604 (= res!202620 (isPrefixOf!0 thiss!1005 (_2!11308 lt!378047)))))

(declare-fun lt!378060 () Unit!17757)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10596 BitStream!10596 BitStream!10596) Unit!17757)

(assert (=> b!242604 (= lt!378060 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11308 lt!378055) (_2!11308 lt!378047)))))

(declare-fun e!168196 () Bool)

(assert (=> b!242604 e!168196))

(declare-fun res!202609 () Bool)

(assert (=> b!242604 (=> (not res!202609) (not e!168196))))

(assert (=> b!242604 (= res!202609 (= (size!5837 (buf!6303 (_2!11308 lt!378055))) (size!5837 (buf!6303 (_2!11308 lt!378047)))))))

(declare-fun bit!26 () Bool)

(declare-fun appendNBitsLoop!0 (BitStream!10596 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20772)

(assert (=> b!242604 (= lt!378047 (appendNBitsLoop!0 (_2!11308 lt!378055) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242604 (validate_offset_bits!1 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378055)))) ((_ sign_extend 32) (currentByte!11666 (_2!11308 lt!378055))) ((_ sign_extend 32) (currentBit!11661 (_2!11308 lt!378055))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!378050 () Unit!17757)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10596 BitStream!10596 (_ BitVec 64) (_ BitVec 64)) Unit!17757)

(assert (=> b!242604 (= lt!378050 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11308 lt!378055) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!168197 () Bool)

(assert (=> b!242604 e!168197))

(declare-fun res!202611 () Bool)

(assert (=> b!242604 (=> (not res!202611) (not e!168197))))

(assert (=> b!242604 (= res!202611 (= (size!5837 (buf!6303 thiss!1005)) (size!5837 (buf!6303 (_2!11308 lt!378055)))))))

(declare-fun appendBit!0 (BitStream!10596 Bool) tuple2!20772)

(assert (=> b!242604 (= lt!378055 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!242605 () Bool)

(assert (=> b!242605 (= e!168196 e!168194)))

(declare-fun res!202616 () Bool)

(assert (=> b!242605 (=> (not res!202616) (not e!168194))))

(declare-fun lt!378048 () (_ BitVec 64))

(assert (=> b!242605 (= res!202616 (= (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378047))) (currentByte!11666 (_2!11308 lt!378047)) (currentBit!11661 (_2!11308 lt!378047))) (bvadd (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378055))) (currentByte!11666 (_2!11308 lt!378055)) (currentBit!11661 (_2!11308 lt!378055))) lt!378048)))))

(assert (=> b!242605 (= lt!378048 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!242606 () Bool)

(declare-fun lt!378052 () tuple2!20774)

(declare-fun lt!378063 () tuple2!20776)

(assert (=> b!242606 (= e!168194 (not (or (not (_2!11309 lt!378052)) (not (= (_1!11309 lt!378052) (_2!11310 lt!378063))))))))

(declare-fun checkBitsLoopPure!0 (BitStream!10596 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20774)

(assert (=> b!242606 (= lt!378052 (checkBitsLoopPure!0 (_1!11310 lt!378063) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242606 (validate_offset_bits!1 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378047)))) ((_ sign_extend 32) (currentByte!11666 (_2!11308 lt!378055))) ((_ sign_extend 32) (currentBit!11661 (_2!11308 lt!378055))) lt!378048)))

(declare-fun lt!378049 () Unit!17757)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10596 array!13315 (_ BitVec 64)) Unit!17757)

(assert (=> b!242606 (= lt!378049 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11308 lt!378055) (buf!6303 (_2!11308 lt!378047)) lt!378048))))

(assert (=> b!242606 (= lt!378063 (reader!0 (_2!11308 lt!378055) (_2!11308 lt!378047)))))

(declare-fun b!242607 () Bool)

(declare-fun res!202608 () Bool)

(assert (=> b!242607 (=> (not res!202608) (not e!168200))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!242607 (= res!202608 (invariant!0 (currentBit!11661 thiss!1005) (currentByte!11666 thiss!1005) (size!5837 (buf!6303 (_2!11308 lt!378055)))))))

(declare-fun b!242608 () Bool)

(declare-fun array_inv!5578 (array!13315) Bool)

(assert (=> b!242608 (= e!168191 (array_inv!5578 (buf!6303 thiss!1005)))))

(declare-fun b!242609 () Bool)

(assert (=> b!242609 (= e!168197 e!168195)))

(declare-fun res!202610 () Bool)

(assert (=> b!242609 (=> (not res!202610) (not e!168195))))

(declare-fun lt!378057 () (_ BitVec 64))

(assert (=> b!242609 (= res!202610 (= lt!378056 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!378057)))))

(assert (=> b!242609 (= lt!378056 (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378055))) (currentByte!11666 (_2!11308 lt!378055)) (currentBit!11661 (_2!11308 lt!378055))))))

(assert (=> b!242609 (= lt!378057 (bitIndex!0 (size!5837 (buf!6303 thiss!1005)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005)))))

(declare-fun b!242610 () Bool)

(assert (=> b!242610 (= e!168200 (invariant!0 (currentBit!11661 thiss!1005) (currentByte!11666 thiss!1005) (size!5837 (buf!6303 (_2!11308 lt!378047)))))))

(declare-fun b!242611 () Bool)

(declare-fun res!202615 () Bool)

(assert (=> b!242611 (=> (not res!202615) (not e!168198))))

(assert (=> b!242611 (= res!202615 (validate_offset_bits!1 ((_ sign_extend 32) (size!5837 (buf!6303 thiss!1005))) ((_ sign_extend 32) (currentByte!11666 thiss!1005)) ((_ sign_extend 32) (currentBit!11661 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!242612 () Bool)

(assert (=> b!242612 (= e!168195 e!168192)))

(declare-fun res!202612 () Bool)

(assert (=> b!242612 (=> (not res!202612) (not e!168192))))

(assert (=> b!242612 (= res!202612 (and (= (_2!11309 lt!378054) bit!26) (= (_1!11309 lt!378054) (_2!11308 lt!378055))))))

(declare-fun readerFrom!0 (BitStream!10596 (_ BitVec 32) (_ BitVec 32)) BitStream!10596)

(assert (=> b!242612 (= lt!378054 (readBitPure!0 (readerFrom!0 (_2!11308 lt!378055) (currentBit!11661 thiss!1005) (currentByte!11666 thiss!1005))))))

(assert (= (and start!52504 res!202614) b!242611))

(assert (= (and b!242611 res!202615) b!242603))

(assert (= (and b!242603 res!202613) b!242604))

(assert (= (and b!242604 res!202611) b!242609))

(assert (= (and b!242609 res!202610) b!242599))

(assert (= (and b!242599 res!202619) b!242612))

(assert (= (and b!242612 res!202612) b!242601))

(assert (= (and b!242604 res!202609) b!242605))

(assert (= (and b!242605 res!202616) b!242602))

(assert (= (and b!242602 res!202618) b!242606))

(assert (= (and b!242604 res!202620) b!242607))

(assert (= (and b!242607 res!202608) b!242610))

(assert (= (and b!242604 res!202617) b!242600))

(assert (= start!52504 b!242608))

(declare-fun m!365501 () Bool)

(assert (=> start!52504 m!365501))

(declare-fun m!365503 () Bool)

(assert (=> b!242601 m!365503))

(declare-fun m!365505 () Bool)

(assert (=> b!242602 m!365505))

(declare-fun m!365507 () Bool)

(assert (=> b!242610 m!365507))

(declare-fun m!365509 () Bool)

(assert (=> b!242599 m!365509))

(declare-fun m!365511 () Bool)

(assert (=> b!242612 m!365511))

(assert (=> b!242612 m!365511))

(declare-fun m!365513 () Bool)

(assert (=> b!242612 m!365513))

(declare-fun m!365515 () Bool)

(assert (=> b!242604 m!365515))

(declare-fun m!365517 () Bool)

(assert (=> b!242604 m!365517))

(declare-fun m!365519 () Bool)

(assert (=> b!242604 m!365519))

(declare-fun m!365521 () Bool)

(assert (=> b!242604 m!365521))

(declare-fun m!365523 () Bool)

(assert (=> b!242604 m!365523))

(declare-fun m!365525 () Bool)

(assert (=> b!242604 m!365525))

(declare-fun m!365527 () Bool)

(assert (=> b!242604 m!365527))

(declare-fun m!365529 () Bool)

(assert (=> b!242604 m!365529))

(declare-fun m!365531 () Bool)

(assert (=> b!242604 m!365531))

(declare-fun m!365533 () Bool)

(assert (=> b!242604 m!365533))

(declare-fun m!365535 () Bool)

(assert (=> b!242604 m!365535))

(declare-fun m!365537 () Bool)

(assert (=> b!242604 m!365537))

(declare-fun m!365539 () Bool)

(assert (=> b!242604 m!365539))

(declare-fun m!365541 () Bool)

(assert (=> b!242604 m!365541))

(declare-fun m!365543 () Bool)

(assert (=> b!242606 m!365543))

(declare-fun m!365545 () Bool)

(assert (=> b!242606 m!365545))

(declare-fun m!365547 () Bool)

(assert (=> b!242606 m!365547))

(assert (=> b!242606 m!365531))

(declare-fun m!365549 () Bool)

(assert (=> b!242609 m!365549))

(declare-fun m!365551 () Bool)

(assert (=> b!242609 m!365551))

(declare-fun m!365553 () Bool)

(assert (=> b!242611 m!365553))

(declare-fun m!365555 () Bool)

(assert (=> b!242608 m!365555))

(declare-fun m!365557 () Bool)

(assert (=> b!242607 m!365557))

(declare-fun m!365559 () Bool)

(assert (=> b!242605 m!365559))

(assert (=> b!242605 m!365549))

(check-sat (not b!242612) (not b!242610) (not start!52504) (not b!242606) (not b!242604) (not b!242599) (not b!242611) (not b!242608) (not b!242607) (not b!242601) (not b!242605) (not b!242609) (not b!242602))
(check-sat)
(get-model)

(declare-fun d!81522 () Bool)

(assert (=> d!81522 (= (invariant!0 (currentBit!11661 thiss!1005) (currentByte!11666 thiss!1005) (size!5837 (buf!6303 (_2!11308 lt!378055)))) (and (bvsge (currentBit!11661 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11661 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11666 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11666 thiss!1005) (size!5837 (buf!6303 (_2!11308 lt!378055)))) (and (= (currentBit!11661 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11666 thiss!1005) (size!5837 (buf!6303 (_2!11308 lt!378055))))))))))

(assert (=> b!242607 d!81522))

(declare-fun d!81524 () Bool)

(declare-datatypes ((tuple2!20784 0))(
  ( (tuple2!20785 (_1!11314 Bool) (_2!11314 BitStream!10596)) )
))
(declare-fun lt!378117 () tuple2!20784)

(declare-fun checkBitsLoop!0 (BitStream!10596 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20784)

(assert (=> d!81524 (= lt!378117 (checkBitsLoop!0 (_1!11310 lt!378063) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!81524 (= (checkBitsLoopPure!0 (_1!11310 lt!378063) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) (tuple2!20775 (_2!11314 lt!378117) (_1!11314 lt!378117)))))

(declare-fun bs!20622 () Bool)

(assert (= bs!20622 d!81524))

(declare-fun m!365621 () Bool)

(assert (=> bs!20622 m!365621))

(assert (=> b!242606 d!81524))

(declare-fun d!81526 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!81526 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378047)))) ((_ sign_extend 32) (currentByte!11666 (_2!11308 lt!378055))) ((_ sign_extend 32) (currentBit!11661 (_2!11308 lt!378055))) lt!378048) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378047)))) ((_ sign_extend 32) (currentByte!11666 (_2!11308 lt!378055))) ((_ sign_extend 32) (currentBit!11661 (_2!11308 lt!378055)))) lt!378048))))

(declare-fun bs!20623 () Bool)

(assert (= bs!20623 d!81526))

(declare-fun m!365623 () Bool)

(assert (=> bs!20623 m!365623))

(assert (=> b!242606 d!81526))

(declare-fun d!81528 () Bool)

(assert (=> d!81528 (validate_offset_bits!1 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378047)))) ((_ sign_extend 32) (currentByte!11666 (_2!11308 lt!378055))) ((_ sign_extend 32) (currentBit!11661 (_2!11308 lt!378055))) lt!378048)))

(declare-fun lt!378120 () Unit!17757)

(declare-fun choose!9 (BitStream!10596 array!13315 (_ BitVec 64) BitStream!10596) Unit!17757)

(assert (=> d!81528 (= lt!378120 (choose!9 (_2!11308 lt!378055) (buf!6303 (_2!11308 lt!378047)) lt!378048 (BitStream!10597 (buf!6303 (_2!11308 lt!378047)) (currentByte!11666 (_2!11308 lt!378055)) (currentBit!11661 (_2!11308 lt!378055)))))))

(assert (=> d!81528 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11308 lt!378055) (buf!6303 (_2!11308 lt!378047)) lt!378048) lt!378120)))

(declare-fun bs!20624 () Bool)

(assert (= bs!20624 d!81528))

(assert (=> bs!20624 m!365545))

(declare-fun m!365625 () Bool)

(assert (=> bs!20624 m!365625))

(assert (=> b!242606 d!81528))

(declare-fun b!242665 () Bool)

(declare-fun res!202666 () Bool)

(declare-fun e!168235 () Bool)

(assert (=> b!242665 (=> (not res!202666) (not e!168235))))

(declare-fun lt!378175 () tuple2!20776)

(assert (=> b!242665 (= res!202666 (isPrefixOf!0 (_2!11310 lt!378175) (_2!11308 lt!378047)))))

(declare-fun b!242666 () Bool)

(declare-fun res!202668 () Bool)

(assert (=> b!242666 (=> (not res!202668) (not e!168235))))

(assert (=> b!242666 (= res!202668 (isPrefixOf!0 (_1!11310 lt!378175) (_2!11308 lt!378055)))))

(declare-fun b!242667 () Bool)

(declare-fun lt!378162 () (_ BitVec 64))

(declare-fun lt!378176 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!10596 (_ BitVec 64)) BitStream!10596)

(assert (=> b!242667 (= e!168235 (= (_1!11310 lt!378175) (withMovedBitIndex!0 (_2!11310 lt!378175) (bvsub lt!378176 lt!378162))))))

(assert (=> b!242667 (or (= (bvand lt!378176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378162 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378176 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378176 lt!378162) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242667 (= lt!378162 (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378047))) (currentByte!11666 (_2!11308 lt!378047)) (currentBit!11661 (_2!11308 lt!378047))))))

(assert (=> b!242667 (= lt!378176 (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378055))) (currentByte!11666 (_2!11308 lt!378055)) (currentBit!11661 (_2!11308 lt!378055))))))

(declare-fun d!81530 () Bool)

(assert (=> d!81530 e!168235))

(declare-fun res!202667 () Bool)

(assert (=> d!81530 (=> (not res!202667) (not e!168235))))

(assert (=> d!81530 (= res!202667 (isPrefixOf!0 (_1!11310 lt!378175) (_2!11310 lt!378175)))))

(declare-fun lt!378170 () BitStream!10596)

(assert (=> d!81530 (= lt!378175 (tuple2!20777 lt!378170 (_2!11308 lt!378047)))))

(declare-fun lt!378171 () Unit!17757)

(declare-fun lt!378161 () Unit!17757)

(assert (=> d!81530 (= lt!378171 lt!378161)))

(assert (=> d!81530 (isPrefixOf!0 lt!378170 (_2!11308 lt!378047))))

(assert (=> d!81530 (= lt!378161 (lemmaIsPrefixTransitive!0 lt!378170 (_2!11308 lt!378047) (_2!11308 lt!378047)))))

(declare-fun lt!378178 () Unit!17757)

(declare-fun lt!378174 () Unit!17757)

(assert (=> d!81530 (= lt!378178 lt!378174)))

(assert (=> d!81530 (isPrefixOf!0 lt!378170 (_2!11308 lt!378047))))

(assert (=> d!81530 (= lt!378174 (lemmaIsPrefixTransitive!0 lt!378170 (_2!11308 lt!378055) (_2!11308 lt!378047)))))

(declare-fun lt!378172 () Unit!17757)

(declare-fun e!168236 () Unit!17757)

(assert (=> d!81530 (= lt!378172 e!168236)))

(declare-fun c!11443 () Bool)

(assert (=> d!81530 (= c!11443 (not (= (size!5837 (buf!6303 (_2!11308 lt!378055))) #b00000000000000000000000000000000)))))

(declare-fun lt!378173 () Unit!17757)

(declare-fun lt!378177 () Unit!17757)

(assert (=> d!81530 (= lt!378173 lt!378177)))

(assert (=> d!81530 (isPrefixOf!0 (_2!11308 lt!378047) (_2!11308 lt!378047))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!10596) Unit!17757)

(assert (=> d!81530 (= lt!378177 (lemmaIsPrefixRefl!0 (_2!11308 lt!378047)))))

(declare-fun lt!378165 () Unit!17757)

(declare-fun lt!378164 () Unit!17757)

(assert (=> d!81530 (= lt!378165 lt!378164)))

(assert (=> d!81530 (= lt!378164 (lemmaIsPrefixRefl!0 (_2!11308 lt!378047)))))

(declare-fun lt!378179 () Unit!17757)

(declare-fun lt!378163 () Unit!17757)

(assert (=> d!81530 (= lt!378179 lt!378163)))

(assert (=> d!81530 (isPrefixOf!0 lt!378170 lt!378170)))

(assert (=> d!81530 (= lt!378163 (lemmaIsPrefixRefl!0 lt!378170))))

(declare-fun lt!378180 () Unit!17757)

(declare-fun lt!378169 () Unit!17757)

(assert (=> d!81530 (= lt!378180 lt!378169)))

(assert (=> d!81530 (isPrefixOf!0 (_2!11308 lt!378055) (_2!11308 lt!378055))))

(assert (=> d!81530 (= lt!378169 (lemmaIsPrefixRefl!0 (_2!11308 lt!378055)))))

(assert (=> d!81530 (= lt!378170 (BitStream!10597 (buf!6303 (_2!11308 lt!378047)) (currentByte!11666 (_2!11308 lt!378055)) (currentBit!11661 (_2!11308 lt!378055))))))

(assert (=> d!81530 (isPrefixOf!0 (_2!11308 lt!378055) (_2!11308 lt!378047))))

(assert (=> d!81530 (= (reader!0 (_2!11308 lt!378055) (_2!11308 lt!378047)) lt!378175)))

(declare-fun b!242668 () Bool)

(declare-fun lt!378167 () Unit!17757)

(assert (=> b!242668 (= e!168236 lt!378167)))

(declare-fun lt!378166 () (_ BitVec 64))

(assert (=> b!242668 (= lt!378166 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!378168 () (_ BitVec 64))

(assert (=> b!242668 (= lt!378168 (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378055))) (currentByte!11666 (_2!11308 lt!378055)) (currentBit!11661 (_2!11308 lt!378055))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!13315 array!13315 (_ BitVec 64) (_ BitVec 64)) Unit!17757)

(assert (=> b!242668 (= lt!378167 (arrayBitRangesEqSymmetric!0 (buf!6303 (_2!11308 lt!378055)) (buf!6303 (_2!11308 lt!378047)) lt!378166 lt!378168))))

(declare-fun arrayBitRangesEq!0 (array!13315 array!13315 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!242668 (arrayBitRangesEq!0 (buf!6303 (_2!11308 lt!378047)) (buf!6303 (_2!11308 lt!378055)) lt!378166 lt!378168)))

(declare-fun b!242669 () Bool)

(declare-fun Unit!17761 () Unit!17757)

(assert (=> b!242669 (= e!168236 Unit!17761)))

(assert (= (and d!81530 c!11443) b!242668))

(assert (= (and d!81530 (not c!11443)) b!242669))

(assert (= (and d!81530 res!202667) b!242666))

(assert (= (and b!242666 res!202668) b!242665))

(assert (= (and b!242665 res!202666) b!242667))

(declare-fun m!365627 () Bool)

(assert (=> b!242666 m!365627))

(declare-fun m!365629 () Bool)

(assert (=> d!81530 m!365629))

(declare-fun m!365631 () Bool)

(assert (=> d!81530 m!365631))

(declare-fun m!365633 () Bool)

(assert (=> d!81530 m!365633))

(declare-fun m!365635 () Bool)

(assert (=> d!81530 m!365635))

(declare-fun m!365637 () Bool)

(assert (=> d!81530 m!365637))

(assert (=> d!81530 m!365505))

(declare-fun m!365639 () Bool)

(assert (=> d!81530 m!365639))

(declare-fun m!365641 () Bool)

(assert (=> d!81530 m!365641))

(declare-fun m!365643 () Bool)

(assert (=> d!81530 m!365643))

(declare-fun m!365645 () Bool)

(assert (=> d!81530 m!365645))

(declare-fun m!365647 () Bool)

(assert (=> d!81530 m!365647))

(declare-fun m!365649 () Bool)

(assert (=> b!242667 m!365649))

(assert (=> b!242667 m!365559))

(assert (=> b!242667 m!365549))

(assert (=> b!242668 m!365549))

(declare-fun m!365651 () Bool)

(assert (=> b!242668 m!365651))

(declare-fun m!365653 () Bool)

(assert (=> b!242668 m!365653))

(declare-fun m!365655 () Bool)

(assert (=> b!242665 m!365655))

(assert (=> b!242606 d!81530))

(declare-fun d!81532 () Bool)

(declare-fun e!168239 () Bool)

(assert (=> d!81532 e!168239))

(declare-fun res!202673 () Bool)

(assert (=> d!81532 (=> (not res!202673) (not e!168239))))

(declare-fun lt!378195 () (_ BitVec 64))

(declare-fun lt!378194 () (_ BitVec 64))

(declare-fun lt!378196 () (_ BitVec 64))

(assert (=> d!81532 (= res!202673 (= lt!378196 (bvsub lt!378194 lt!378195)))))

(assert (=> d!81532 (or (= (bvand lt!378194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378195 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378194 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378194 lt!378195) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81532 (= lt!378195 (remainingBits!0 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378047)))) ((_ sign_extend 32) (currentByte!11666 (_2!11308 lt!378047))) ((_ sign_extend 32) (currentBit!11661 (_2!11308 lt!378047)))))))

(declare-fun lt!378193 () (_ BitVec 64))

(declare-fun lt!378198 () (_ BitVec 64))

(assert (=> d!81532 (= lt!378194 (bvmul lt!378193 lt!378198))))

(assert (=> d!81532 (or (= lt!378193 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378198 (bvsdiv (bvmul lt!378193 lt!378198) lt!378193)))))

(assert (=> d!81532 (= lt!378198 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81532 (= lt!378193 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378047)))))))

(assert (=> d!81532 (= lt!378196 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11666 (_2!11308 lt!378047))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11661 (_2!11308 lt!378047)))))))

(assert (=> d!81532 (invariant!0 (currentBit!11661 (_2!11308 lt!378047)) (currentByte!11666 (_2!11308 lt!378047)) (size!5837 (buf!6303 (_2!11308 lt!378047))))))

(assert (=> d!81532 (= (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378047))) (currentByte!11666 (_2!11308 lt!378047)) (currentBit!11661 (_2!11308 lt!378047))) lt!378196)))

(declare-fun b!242674 () Bool)

(declare-fun res!202674 () Bool)

(assert (=> b!242674 (=> (not res!202674) (not e!168239))))

(assert (=> b!242674 (= res!202674 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378196))))

(declare-fun b!242675 () Bool)

(declare-fun lt!378197 () (_ BitVec 64))

(assert (=> b!242675 (= e!168239 (bvsle lt!378196 (bvmul lt!378197 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242675 (or (= lt!378197 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378197 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378197)))))

(assert (=> b!242675 (= lt!378197 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378047)))))))

(assert (= (and d!81532 res!202673) b!242674))

(assert (= (and b!242674 res!202674) b!242675))

(declare-fun m!365657 () Bool)

(assert (=> d!81532 m!365657))

(declare-fun m!365659 () Bool)

(assert (=> d!81532 m!365659))

(assert (=> b!242605 d!81532))

(declare-fun d!81534 () Bool)

(declare-fun e!168240 () Bool)

(assert (=> d!81534 e!168240))

(declare-fun res!202675 () Bool)

(assert (=> d!81534 (=> (not res!202675) (not e!168240))))

(declare-fun lt!378202 () (_ BitVec 64))

(declare-fun lt!378201 () (_ BitVec 64))

(declare-fun lt!378200 () (_ BitVec 64))

(assert (=> d!81534 (= res!202675 (= lt!378202 (bvsub lt!378200 lt!378201)))))

(assert (=> d!81534 (or (= (bvand lt!378200 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378201 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378200 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378200 lt!378201) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81534 (= lt!378201 (remainingBits!0 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378055)))) ((_ sign_extend 32) (currentByte!11666 (_2!11308 lt!378055))) ((_ sign_extend 32) (currentBit!11661 (_2!11308 lt!378055)))))))

(declare-fun lt!378199 () (_ BitVec 64))

(declare-fun lt!378204 () (_ BitVec 64))

(assert (=> d!81534 (= lt!378200 (bvmul lt!378199 lt!378204))))

(assert (=> d!81534 (or (= lt!378199 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378204 (bvsdiv (bvmul lt!378199 lt!378204) lt!378199)))))

(assert (=> d!81534 (= lt!378204 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81534 (= lt!378199 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378055)))))))

(assert (=> d!81534 (= lt!378202 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11666 (_2!11308 lt!378055))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11661 (_2!11308 lt!378055)))))))

(assert (=> d!81534 (invariant!0 (currentBit!11661 (_2!11308 lt!378055)) (currentByte!11666 (_2!11308 lt!378055)) (size!5837 (buf!6303 (_2!11308 lt!378055))))))

(assert (=> d!81534 (= (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378055))) (currentByte!11666 (_2!11308 lt!378055)) (currentBit!11661 (_2!11308 lt!378055))) lt!378202)))

(declare-fun b!242676 () Bool)

(declare-fun res!202676 () Bool)

(assert (=> b!242676 (=> (not res!202676) (not e!168240))))

(assert (=> b!242676 (= res!202676 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378202))))

(declare-fun b!242677 () Bool)

(declare-fun lt!378203 () (_ BitVec 64))

(assert (=> b!242677 (= e!168240 (bvsle lt!378202 (bvmul lt!378203 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242677 (or (= lt!378203 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378203 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378203)))))

(assert (=> b!242677 (= lt!378203 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378055)))))))

(assert (= (and d!81534 res!202675) b!242676))

(assert (= (and b!242676 res!202676) b!242677))

(declare-fun m!365661 () Bool)

(assert (=> d!81534 m!365661))

(declare-fun m!365663 () Bool)

(assert (=> d!81534 m!365663))

(assert (=> b!242605 d!81534))

(declare-fun d!81536 () Bool)

(declare-fun res!202685 () Bool)

(declare-fun e!168246 () Bool)

(assert (=> d!81536 (=> (not res!202685) (not e!168246))))

(assert (=> d!81536 (= res!202685 (= (size!5837 (buf!6303 thiss!1005)) (size!5837 (buf!6303 (_2!11308 lt!378047)))))))

(assert (=> d!81536 (= (isPrefixOf!0 thiss!1005 (_2!11308 lt!378047)) e!168246)))

(declare-fun b!242684 () Bool)

(declare-fun res!202683 () Bool)

(assert (=> b!242684 (=> (not res!202683) (not e!168246))))

(assert (=> b!242684 (= res!202683 (bvsle (bitIndex!0 (size!5837 (buf!6303 thiss!1005)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005)) (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378047))) (currentByte!11666 (_2!11308 lt!378047)) (currentBit!11661 (_2!11308 lt!378047)))))))

(declare-fun b!242685 () Bool)

(declare-fun e!168245 () Bool)

(assert (=> b!242685 (= e!168246 e!168245)))

(declare-fun res!202684 () Bool)

(assert (=> b!242685 (=> res!202684 e!168245)))

(assert (=> b!242685 (= res!202684 (= (size!5837 (buf!6303 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!242686 () Bool)

(assert (=> b!242686 (= e!168245 (arrayBitRangesEq!0 (buf!6303 thiss!1005) (buf!6303 (_2!11308 lt!378047)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5837 (buf!6303 thiss!1005)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005))))))

(assert (= (and d!81536 res!202685) b!242684))

(assert (= (and b!242684 res!202683) b!242685))

(assert (= (and b!242685 (not res!202684)) b!242686))

(assert (=> b!242684 m!365551))

(assert (=> b!242684 m!365559))

(assert (=> b!242686 m!365551))

(assert (=> b!242686 m!365551))

(declare-fun m!365665 () Bool)

(assert (=> b!242686 m!365665))

(assert (=> b!242604 d!81536))

(declare-fun d!81538 () Bool)

(declare-fun e!168247 () Bool)

(assert (=> d!81538 e!168247))

(declare-fun res!202686 () Bool)

(assert (=> d!81538 (=> (not res!202686) (not e!168247))))

(declare-fun lt!378208 () (_ BitVec 64))

(declare-fun lt!378207 () (_ BitVec 64))

(declare-fun lt!378206 () (_ BitVec 64))

(assert (=> d!81538 (= res!202686 (= lt!378208 (bvsub lt!378206 lt!378207)))))

(assert (=> d!81538 (or (= (bvand lt!378206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378207 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378206 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378206 lt!378207) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81538 (= lt!378207 (remainingBits!0 ((_ sign_extend 32) (size!5837 (buf!6303 (_1!11309 lt!378062)))) ((_ sign_extend 32) (currentByte!11666 (_1!11309 lt!378062))) ((_ sign_extend 32) (currentBit!11661 (_1!11309 lt!378062)))))))

(declare-fun lt!378205 () (_ BitVec 64))

(declare-fun lt!378210 () (_ BitVec 64))

(assert (=> d!81538 (= lt!378206 (bvmul lt!378205 lt!378210))))

(assert (=> d!81538 (or (= lt!378205 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378210 (bvsdiv (bvmul lt!378205 lt!378210) lt!378205)))))

(assert (=> d!81538 (= lt!378210 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81538 (= lt!378205 ((_ sign_extend 32) (size!5837 (buf!6303 (_1!11309 lt!378062)))))))

(assert (=> d!81538 (= lt!378208 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11666 (_1!11309 lt!378062))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11661 (_1!11309 lt!378062)))))))

(assert (=> d!81538 (invariant!0 (currentBit!11661 (_1!11309 lt!378062)) (currentByte!11666 (_1!11309 lt!378062)) (size!5837 (buf!6303 (_1!11309 lt!378062))))))

(assert (=> d!81538 (= (bitIndex!0 (size!5837 (buf!6303 (_1!11309 lt!378062))) (currentByte!11666 (_1!11309 lt!378062)) (currentBit!11661 (_1!11309 lt!378062))) lt!378208)))

(declare-fun b!242687 () Bool)

(declare-fun res!202687 () Bool)

(assert (=> b!242687 (=> (not res!202687) (not e!168247))))

(assert (=> b!242687 (= res!202687 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378208))))

(declare-fun b!242688 () Bool)

(declare-fun lt!378209 () (_ BitVec 64))

(assert (=> b!242688 (= e!168247 (bvsle lt!378208 (bvmul lt!378209 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242688 (or (= lt!378209 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378209 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378209)))))

(assert (=> b!242688 (= lt!378209 ((_ sign_extend 32) (size!5837 (buf!6303 (_1!11309 lt!378062)))))))

(assert (= (and d!81538 res!202686) b!242687))

(assert (= (and b!242687 res!202687) b!242688))

(declare-fun m!365667 () Bool)

(assert (=> d!81538 m!365667))

(declare-fun m!365669 () Bool)

(assert (=> d!81538 m!365669))

(assert (=> b!242604 d!81538))

(declare-fun d!81540 () Bool)

(declare-fun e!168248 () Bool)

(assert (=> d!81540 e!168248))

(declare-fun res!202688 () Bool)

(assert (=> d!81540 (=> (not res!202688) (not e!168248))))

(declare-fun lt!378212 () (_ BitVec 64))

(declare-fun lt!378214 () (_ BitVec 64))

(declare-fun lt!378213 () (_ BitVec 64))

(assert (=> d!81540 (= res!202688 (= lt!378214 (bvsub lt!378212 lt!378213)))))

(assert (=> d!81540 (or (= (bvand lt!378212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378213 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378212 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378212 lt!378213) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81540 (= lt!378213 (remainingBits!0 ((_ sign_extend 32) (size!5837 (buf!6303 (_1!11309 lt!378058)))) ((_ sign_extend 32) (currentByte!11666 (_1!11309 lt!378058))) ((_ sign_extend 32) (currentBit!11661 (_1!11309 lt!378058)))))))

(declare-fun lt!378211 () (_ BitVec 64))

(declare-fun lt!378216 () (_ BitVec 64))

(assert (=> d!81540 (= lt!378212 (bvmul lt!378211 lt!378216))))

(assert (=> d!81540 (or (= lt!378211 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378216 (bvsdiv (bvmul lt!378211 lt!378216) lt!378211)))))

(assert (=> d!81540 (= lt!378216 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81540 (= lt!378211 ((_ sign_extend 32) (size!5837 (buf!6303 (_1!11309 lt!378058)))))))

(assert (=> d!81540 (= lt!378214 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11666 (_1!11309 lt!378058))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11661 (_1!11309 lt!378058)))))))

(assert (=> d!81540 (invariant!0 (currentBit!11661 (_1!11309 lt!378058)) (currentByte!11666 (_1!11309 lt!378058)) (size!5837 (buf!6303 (_1!11309 lt!378058))))))

(assert (=> d!81540 (= (bitIndex!0 (size!5837 (buf!6303 (_1!11309 lt!378058))) (currentByte!11666 (_1!11309 lt!378058)) (currentBit!11661 (_1!11309 lt!378058))) lt!378214)))

(declare-fun b!242689 () Bool)

(declare-fun res!202689 () Bool)

(assert (=> b!242689 (=> (not res!202689) (not e!168248))))

(assert (=> b!242689 (= res!202689 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378214))))

(declare-fun b!242690 () Bool)

(declare-fun lt!378215 () (_ BitVec 64))

(assert (=> b!242690 (= e!168248 (bvsle lt!378214 (bvmul lt!378215 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242690 (or (= lt!378215 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378215 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378215)))))

(assert (=> b!242690 (= lt!378215 ((_ sign_extend 32) (size!5837 (buf!6303 (_1!11309 lt!378058)))))))

(assert (= (and d!81540 res!202688) b!242689))

(assert (= (and b!242689 res!202689) b!242690))

(declare-fun m!365671 () Bool)

(assert (=> d!81540 m!365671))

(declare-fun m!365673 () Bool)

(assert (=> d!81540 m!365673))

(assert (=> b!242604 d!81540))

(declare-fun b!242703 () Bool)

(declare-fun e!168253 () Bool)

(declare-fun lt!378225 () tuple2!20774)

(declare-fun lt!378227 () tuple2!20772)

(assert (=> b!242703 (= e!168253 (= (bitIndex!0 (size!5837 (buf!6303 (_1!11309 lt!378225))) (currentByte!11666 (_1!11309 lt!378225)) (currentBit!11661 (_1!11309 lt!378225))) (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378227))) (currentByte!11666 (_2!11308 lt!378227)) (currentBit!11661 (_2!11308 lt!378227)))))))

(declare-fun b!242702 () Bool)

(declare-fun e!168254 () Bool)

(assert (=> b!242702 (= e!168254 e!168253)))

(declare-fun res!202699 () Bool)

(assert (=> b!242702 (=> (not res!202699) (not e!168253))))

(assert (=> b!242702 (= res!202699 (and (= (_2!11309 lt!378225) bit!26) (= (_1!11309 lt!378225) (_2!11308 lt!378227))))))

(assert (=> b!242702 (= lt!378225 (readBitPure!0 (readerFrom!0 (_2!11308 lt!378227) (currentBit!11661 thiss!1005) (currentByte!11666 thiss!1005))))))

(declare-fun d!81542 () Bool)

(assert (=> d!81542 e!168254))

(declare-fun res!202700 () Bool)

(assert (=> d!81542 (=> (not res!202700) (not e!168254))))

(assert (=> d!81542 (= res!202700 (= (size!5837 (buf!6303 thiss!1005)) (size!5837 (buf!6303 (_2!11308 lt!378227)))))))

(declare-fun choose!16 (BitStream!10596 Bool) tuple2!20772)

(assert (=> d!81542 (= lt!378227 (choose!16 thiss!1005 bit!26))))

(assert (=> d!81542 (validate_offset_bit!0 ((_ sign_extend 32) (size!5837 (buf!6303 thiss!1005))) ((_ sign_extend 32) (currentByte!11666 thiss!1005)) ((_ sign_extend 32) (currentBit!11661 thiss!1005)))))

(assert (=> d!81542 (= (appendBit!0 thiss!1005 bit!26) lt!378227)))

(declare-fun b!242701 () Bool)

(declare-fun res!202701 () Bool)

(assert (=> b!242701 (=> (not res!202701) (not e!168254))))

(assert (=> b!242701 (= res!202701 (isPrefixOf!0 thiss!1005 (_2!11308 lt!378227)))))

(declare-fun b!242700 () Bool)

(declare-fun res!202698 () Bool)

(assert (=> b!242700 (=> (not res!202698) (not e!168254))))

(declare-fun lt!378226 () (_ BitVec 64))

(declare-fun lt!378228 () (_ BitVec 64))

(assert (=> b!242700 (= res!202698 (= (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378227))) (currentByte!11666 (_2!11308 lt!378227)) (currentBit!11661 (_2!11308 lt!378227))) (bvadd lt!378226 lt!378228)))))

(assert (=> b!242700 (or (not (= (bvand lt!378226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378228 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!378226 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!378226 lt!378228) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242700 (= lt!378228 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!242700 (= lt!378226 (bitIndex!0 (size!5837 (buf!6303 thiss!1005)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005)))))

(assert (= (and d!81542 res!202700) b!242700))

(assert (= (and b!242700 res!202698) b!242701))

(assert (= (and b!242701 res!202701) b!242702))

(assert (= (and b!242702 res!202699) b!242703))

(declare-fun m!365675 () Bool)

(assert (=> b!242702 m!365675))

(assert (=> b!242702 m!365675))

(declare-fun m!365677 () Bool)

(assert (=> b!242702 m!365677))

(declare-fun m!365679 () Bool)

(assert (=> d!81542 m!365679))

(declare-fun m!365681 () Bool)

(assert (=> d!81542 m!365681))

(declare-fun m!365683 () Bool)

(assert (=> b!242701 m!365683))

(declare-fun m!365685 () Bool)

(assert (=> b!242703 m!365685))

(declare-fun m!365687 () Bool)

(assert (=> b!242703 m!365687))

(assert (=> b!242700 m!365687))

(assert (=> b!242700 m!365551))

(assert (=> b!242604 d!81542))

(assert (=> b!242604 d!81530))

(declare-fun d!81544 () Bool)

(assert (=> d!81544 (isPrefixOf!0 thiss!1005 (_2!11308 lt!378047))))

(declare-fun lt!378231 () Unit!17757)

(declare-fun choose!30 (BitStream!10596 BitStream!10596 BitStream!10596) Unit!17757)

(assert (=> d!81544 (= lt!378231 (choose!30 thiss!1005 (_2!11308 lt!378055) (_2!11308 lt!378047)))))

(assert (=> d!81544 (isPrefixOf!0 thiss!1005 (_2!11308 lt!378055))))

(assert (=> d!81544 (= (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11308 lt!378055) (_2!11308 lt!378047)) lt!378231)))

(declare-fun bs!20625 () Bool)

(assert (= bs!20625 d!81544))

(assert (=> bs!20625 m!365517))

(declare-fun m!365689 () Bool)

(assert (=> bs!20625 m!365689))

(assert (=> bs!20625 m!365509))

(assert (=> b!242604 d!81544))

(declare-fun d!81546 () Bool)

(assert (=> d!81546 (= (validate_offset_bit!0 ((_ sign_extend 32) (size!5837 (buf!6303 (_1!11310 lt!378061)))) ((_ sign_extend 32) (currentByte!11666 (_1!11310 lt!378061))) ((_ sign_extend 32) (currentBit!11661 (_1!11310 lt!378061)))) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5837 (buf!6303 (_1!11310 lt!378061)))) ((_ sign_extend 32) (currentByte!11666 (_1!11310 lt!378061))) ((_ sign_extend 32) (currentBit!11661 (_1!11310 lt!378061)))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!20626 () Bool)

(assert (= bs!20626 d!81546))

(declare-fun m!365691 () Bool)

(assert (=> bs!20626 m!365691))

(assert (=> b!242604 d!81546))

(declare-fun d!81548 () Bool)

(declare-fun e!168257 () Bool)

(assert (=> d!81548 e!168257))

(declare-fun res!202704 () Bool)

(assert (=> d!81548 (=> (not res!202704) (not e!168257))))

(declare-fun lt!378243 () tuple2!20774)

(declare-fun lt!378241 () tuple2!20774)

(assert (=> d!81548 (= res!202704 (= (bitIndex!0 (size!5837 (buf!6303 (_1!11309 lt!378243))) (currentByte!11666 (_1!11309 lt!378243)) (currentBit!11661 (_1!11309 lt!378243))) (bitIndex!0 (size!5837 (buf!6303 (_1!11309 lt!378241))) (currentByte!11666 (_1!11309 lt!378241)) (currentBit!11661 (_1!11309 lt!378241)))))))

(declare-fun lt!378240 () BitStream!10596)

(declare-fun lt!378242 () Unit!17757)

(declare-fun choose!50 (BitStream!10596 BitStream!10596 BitStream!10596 tuple2!20774 tuple2!20774 BitStream!10596 Bool tuple2!20774 tuple2!20774 BitStream!10596 Bool) Unit!17757)

(assert (=> d!81548 (= lt!378242 (choose!50 lt!378059 (_2!11308 lt!378047) lt!378240 lt!378243 (tuple2!20775 (_1!11309 lt!378243) (_2!11309 lt!378243)) (_1!11309 lt!378243) (_2!11309 lt!378243) lt!378241 (tuple2!20775 (_1!11309 lt!378241) (_2!11309 lt!378241)) (_1!11309 lt!378241) (_2!11309 lt!378241)))))

(assert (=> d!81548 (= lt!378241 (readBitPure!0 lt!378240))))

(assert (=> d!81548 (= lt!378243 (readBitPure!0 lt!378059))))

(assert (=> d!81548 (= lt!378240 (BitStream!10597 (buf!6303 (_2!11308 lt!378047)) (currentByte!11666 lt!378059) (currentBit!11661 lt!378059)))))

(assert (=> d!81548 (invariant!0 (currentBit!11661 lt!378059) (currentByte!11666 lt!378059) (size!5837 (buf!6303 (_2!11308 lt!378047))))))

(assert (=> d!81548 (= (readBitPrefixLemma!0 lt!378059 (_2!11308 lt!378047)) lt!378242)))

(declare-fun b!242706 () Bool)

(assert (=> b!242706 (= e!168257 (= (_2!11309 lt!378243) (_2!11309 lt!378241)))))

(assert (= (and d!81548 res!202704) b!242706))

(declare-fun m!365693 () Bool)

(assert (=> d!81548 m!365693))

(assert (=> d!81548 m!365521))

(declare-fun m!365695 () Bool)

(assert (=> d!81548 m!365695))

(declare-fun m!365697 () Bool)

(assert (=> d!81548 m!365697))

(declare-fun m!365699 () Bool)

(assert (=> d!81548 m!365699))

(declare-fun m!365701 () Bool)

(assert (=> d!81548 m!365701))

(assert (=> b!242604 d!81548))

(declare-fun b!242707 () Bool)

(declare-fun res!202705 () Bool)

(declare-fun e!168258 () Bool)

(assert (=> b!242707 (=> (not res!202705) (not e!168258))))

(declare-fun lt!378258 () tuple2!20776)

(assert (=> b!242707 (= res!202705 (isPrefixOf!0 (_2!11310 lt!378258) (_2!11308 lt!378047)))))

(declare-fun b!242708 () Bool)

(declare-fun res!202707 () Bool)

(assert (=> b!242708 (=> (not res!202707) (not e!168258))))

(assert (=> b!242708 (= res!202707 (isPrefixOf!0 (_1!11310 lt!378258) thiss!1005))))

(declare-fun lt!378259 () (_ BitVec 64))

(declare-fun lt!378245 () (_ BitVec 64))

(declare-fun b!242709 () Bool)

(assert (=> b!242709 (= e!168258 (= (_1!11310 lt!378258) (withMovedBitIndex!0 (_2!11310 lt!378258) (bvsub lt!378259 lt!378245))))))

(assert (=> b!242709 (or (= (bvand lt!378259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378245 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378259 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378259 lt!378245) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242709 (= lt!378245 (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378047))) (currentByte!11666 (_2!11308 lt!378047)) (currentBit!11661 (_2!11308 lt!378047))))))

(assert (=> b!242709 (= lt!378259 (bitIndex!0 (size!5837 (buf!6303 thiss!1005)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005)))))

(declare-fun d!81550 () Bool)

(assert (=> d!81550 e!168258))

(declare-fun res!202706 () Bool)

(assert (=> d!81550 (=> (not res!202706) (not e!168258))))

(assert (=> d!81550 (= res!202706 (isPrefixOf!0 (_1!11310 lt!378258) (_2!11310 lt!378258)))))

(declare-fun lt!378253 () BitStream!10596)

(assert (=> d!81550 (= lt!378258 (tuple2!20777 lt!378253 (_2!11308 lt!378047)))))

(declare-fun lt!378254 () Unit!17757)

(declare-fun lt!378244 () Unit!17757)

(assert (=> d!81550 (= lt!378254 lt!378244)))

(assert (=> d!81550 (isPrefixOf!0 lt!378253 (_2!11308 lt!378047))))

(assert (=> d!81550 (= lt!378244 (lemmaIsPrefixTransitive!0 lt!378253 (_2!11308 lt!378047) (_2!11308 lt!378047)))))

(declare-fun lt!378261 () Unit!17757)

(declare-fun lt!378257 () Unit!17757)

(assert (=> d!81550 (= lt!378261 lt!378257)))

(assert (=> d!81550 (isPrefixOf!0 lt!378253 (_2!11308 lt!378047))))

(assert (=> d!81550 (= lt!378257 (lemmaIsPrefixTransitive!0 lt!378253 thiss!1005 (_2!11308 lt!378047)))))

(declare-fun lt!378255 () Unit!17757)

(declare-fun e!168259 () Unit!17757)

(assert (=> d!81550 (= lt!378255 e!168259)))

(declare-fun c!11444 () Bool)

(assert (=> d!81550 (= c!11444 (not (= (size!5837 (buf!6303 thiss!1005)) #b00000000000000000000000000000000)))))

(declare-fun lt!378256 () Unit!17757)

(declare-fun lt!378260 () Unit!17757)

(assert (=> d!81550 (= lt!378256 lt!378260)))

(assert (=> d!81550 (isPrefixOf!0 (_2!11308 lt!378047) (_2!11308 lt!378047))))

(assert (=> d!81550 (= lt!378260 (lemmaIsPrefixRefl!0 (_2!11308 lt!378047)))))

(declare-fun lt!378248 () Unit!17757)

(declare-fun lt!378247 () Unit!17757)

(assert (=> d!81550 (= lt!378248 lt!378247)))

(assert (=> d!81550 (= lt!378247 (lemmaIsPrefixRefl!0 (_2!11308 lt!378047)))))

(declare-fun lt!378262 () Unit!17757)

(declare-fun lt!378246 () Unit!17757)

(assert (=> d!81550 (= lt!378262 lt!378246)))

(assert (=> d!81550 (isPrefixOf!0 lt!378253 lt!378253)))

(assert (=> d!81550 (= lt!378246 (lemmaIsPrefixRefl!0 lt!378253))))

(declare-fun lt!378263 () Unit!17757)

(declare-fun lt!378252 () Unit!17757)

(assert (=> d!81550 (= lt!378263 lt!378252)))

(assert (=> d!81550 (isPrefixOf!0 thiss!1005 thiss!1005)))

(assert (=> d!81550 (= lt!378252 (lemmaIsPrefixRefl!0 thiss!1005))))

(assert (=> d!81550 (= lt!378253 (BitStream!10597 (buf!6303 (_2!11308 lt!378047)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005)))))

(assert (=> d!81550 (isPrefixOf!0 thiss!1005 (_2!11308 lt!378047))))

(assert (=> d!81550 (= (reader!0 thiss!1005 (_2!11308 lt!378047)) lt!378258)))

(declare-fun b!242710 () Bool)

(declare-fun lt!378250 () Unit!17757)

(assert (=> b!242710 (= e!168259 lt!378250)))

(declare-fun lt!378249 () (_ BitVec 64))

(assert (=> b!242710 (= lt!378249 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!378251 () (_ BitVec 64))

(assert (=> b!242710 (= lt!378251 (bitIndex!0 (size!5837 (buf!6303 thiss!1005)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005)))))

(assert (=> b!242710 (= lt!378250 (arrayBitRangesEqSymmetric!0 (buf!6303 thiss!1005) (buf!6303 (_2!11308 lt!378047)) lt!378249 lt!378251))))

(assert (=> b!242710 (arrayBitRangesEq!0 (buf!6303 (_2!11308 lt!378047)) (buf!6303 thiss!1005) lt!378249 lt!378251)))

(declare-fun b!242711 () Bool)

(declare-fun Unit!17762 () Unit!17757)

(assert (=> b!242711 (= e!168259 Unit!17762)))

(assert (= (and d!81550 c!11444) b!242710))

(assert (= (and d!81550 (not c!11444)) b!242711))

(assert (= (and d!81550 res!202706) b!242708))

(assert (= (and b!242708 res!202707) b!242707))

(assert (= (and b!242707 res!202705) b!242709))

(declare-fun m!365703 () Bool)

(assert (=> b!242708 m!365703))

(declare-fun m!365705 () Bool)

(assert (=> d!81550 m!365705))

(assert (=> d!81550 m!365631))

(declare-fun m!365707 () Bool)

(assert (=> d!81550 m!365707))

(declare-fun m!365709 () Bool)

(assert (=> d!81550 m!365709))

(declare-fun m!365711 () Bool)

(assert (=> d!81550 m!365711))

(assert (=> d!81550 m!365517))

(declare-fun m!365713 () Bool)

(assert (=> d!81550 m!365713))

(declare-fun m!365715 () Bool)

(assert (=> d!81550 m!365715))

(assert (=> d!81550 m!365643))

(declare-fun m!365717 () Bool)

(assert (=> d!81550 m!365717))

(declare-fun m!365719 () Bool)

(assert (=> d!81550 m!365719))

(declare-fun m!365721 () Bool)

(assert (=> b!242709 m!365721))

(assert (=> b!242709 m!365559))

(assert (=> b!242709 m!365551))

(assert (=> b!242710 m!365551))

(declare-fun m!365723 () Bool)

(assert (=> b!242710 m!365723))

(declare-fun m!365725 () Bool)

(assert (=> b!242710 m!365725))

(declare-fun m!365727 () Bool)

(assert (=> b!242707 m!365727))

(assert (=> b!242604 d!81550))

(declare-fun d!81552 () Bool)

(declare-fun e!168262 () Bool)

(assert (=> d!81552 e!168262))

(declare-fun res!202710 () Bool)

(assert (=> d!81552 (=> (not res!202710) (not e!168262))))

(assert (=> d!81552 (= res!202710 (or (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub nBits!297 from!289) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!378266 () Unit!17757)

(declare-fun choose!27 (BitStream!10596 BitStream!10596 (_ BitVec 64) (_ BitVec 64)) Unit!17757)

(assert (=> d!81552 (= lt!378266 (choose!27 thiss!1005 (_2!11308 lt!378055) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!81552 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub nBits!297 from!289)))))

(assert (=> d!81552 (= (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11308 lt!378055) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001) lt!378266)))

(declare-fun b!242714 () Bool)

(assert (=> b!242714 (= e!168262 (validate_offset_bits!1 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378055)))) ((_ sign_extend 32) (currentByte!11666 (_2!11308 lt!378055))) ((_ sign_extend 32) (currentBit!11661 (_2!11308 lt!378055))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!81552 res!202710) b!242714))

(declare-fun m!365729 () Bool)

(assert (=> d!81552 m!365729))

(assert (=> b!242714 m!365535))

(assert (=> b!242604 d!81552))

(declare-fun d!81554 () Bool)

(declare-fun e!168284 () Bool)

(assert (=> d!81554 e!168284))

(declare-fun res!202748 () Bool)

(assert (=> d!81554 (=> (not res!202748) (not e!168284))))

(declare-fun lt!378326 () tuple2!20772)

(assert (=> d!81554 (= res!202748 (= (size!5837 (buf!6303 (_2!11308 lt!378055))) (size!5837 (buf!6303 (_2!11308 lt!378326)))))))

(declare-fun choose!51 (BitStream!10596 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!20772)

(assert (=> d!81554 (= lt!378326 (choose!51 (_2!11308 lt!378055) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> d!81554 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000))))

(assert (=> d!81554 (= (appendNBitsLoop!0 (_2!11308 lt!378055) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) lt!378326)))

(declare-fun b!242748 () Bool)

(declare-fun res!202747 () Bool)

(assert (=> b!242748 (=> (not res!202747) (not e!168284))))

(declare-fun lt!378328 () (_ BitVec 64))

(declare-fun lt!378324 () (_ BitVec 64))

(assert (=> b!242748 (= res!202747 (= (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378326))) (currentByte!11666 (_2!11308 lt!378326)) (currentBit!11661 (_2!11308 lt!378326))) (bvadd lt!378324 lt!378328)))))

(assert (=> b!242748 (or (not (= (bvand lt!378324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378328 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!378324 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!378324 lt!378328) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242748 (= lt!378328 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242748 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242748 (= lt!378324 (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378055))) (currentByte!11666 (_2!11308 lt!378055)) (currentBit!11661 (_2!11308 lt!378055))))))

(declare-fun b!242749 () Bool)

(declare-fun res!202745 () Bool)

(assert (=> b!242749 (=> (not res!202745) (not e!168284))))

(assert (=> b!242749 (= res!202745 (isPrefixOf!0 (_2!11308 lt!378055) (_2!11308 lt!378326)))))

(declare-fun b!242750 () Bool)

(declare-fun lt!378323 () tuple2!20774)

(declare-fun lt!378321 () tuple2!20776)

(assert (=> b!242750 (= e!168284 (and (_2!11309 lt!378323) (= (_1!11309 lt!378323) (_2!11310 lt!378321))))))

(assert (=> b!242750 (= lt!378323 (checkBitsLoopPure!0 (_1!11310 lt!378321) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun lt!378325 () Unit!17757)

(declare-fun lt!378327 () Unit!17757)

(assert (=> b!242750 (= lt!378325 lt!378327)))

(declare-fun lt!378322 () (_ BitVec 64))

(assert (=> b!242750 (validate_offset_bits!1 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378326)))) ((_ sign_extend 32) (currentByte!11666 (_2!11308 lt!378055))) ((_ sign_extend 32) (currentBit!11661 (_2!11308 lt!378055))) lt!378322)))

(assert (=> b!242750 (= lt!378327 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11308 lt!378055) (buf!6303 (_2!11308 lt!378326)) lt!378322))))

(declare-fun e!168283 () Bool)

(assert (=> b!242750 e!168283))

(declare-fun res!202746 () Bool)

(assert (=> b!242750 (=> (not res!202746) (not e!168283))))

(assert (=> b!242750 (= res!202746 (and (= (size!5837 (buf!6303 (_2!11308 lt!378055))) (size!5837 (buf!6303 (_2!11308 lt!378326)))) (bvsge lt!378322 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242750 (= lt!378322 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!242750 (or (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand nBits!297 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!242750 (= lt!378321 (reader!0 (_2!11308 lt!378055) (_2!11308 lt!378326)))))

(declare-fun b!242751 () Bool)

(assert (=> b!242751 (= e!168283 (validate_offset_bits!1 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378055)))) ((_ sign_extend 32) (currentByte!11666 (_2!11308 lt!378055))) ((_ sign_extend 32) (currentBit!11661 (_2!11308 lt!378055))) lt!378322))))

(assert (= (and d!81554 res!202748) b!242748))

(assert (= (and b!242748 res!202747) b!242749))

(assert (= (and b!242749 res!202745) b!242750))

(assert (= (and b!242750 res!202746) b!242751))

(declare-fun m!365755 () Bool)

(assert (=> b!242749 m!365755))

(declare-fun m!365757 () Bool)

(assert (=> b!242750 m!365757))

(declare-fun m!365759 () Bool)

(assert (=> b!242750 m!365759))

(declare-fun m!365761 () Bool)

(assert (=> b!242750 m!365761))

(declare-fun m!365763 () Bool)

(assert (=> b!242750 m!365763))

(declare-fun m!365765 () Bool)

(assert (=> b!242751 m!365765))

(declare-fun m!365767 () Bool)

(assert (=> b!242748 m!365767))

(assert (=> b!242748 m!365549))

(declare-fun m!365769 () Bool)

(assert (=> d!81554 m!365769))

(assert (=> b!242604 d!81554))

(declare-fun d!81584 () Bool)

(declare-fun lt!378332 () tuple2!20784)

(declare-fun readBit!0 (BitStream!10596) tuple2!20784)

(assert (=> d!81584 (= lt!378332 (readBit!0 (BitStream!10597 (buf!6303 (_2!11308 lt!378047)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005))))))

(assert (=> d!81584 (= (readBitPure!0 (BitStream!10597 (buf!6303 (_2!11308 lt!378047)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005))) (tuple2!20775 (_2!11314 lt!378332) (_1!11314 lt!378332)))))

(declare-fun bs!20633 () Bool)

(assert (= bs!20633 d!81584))

(declare-fun m!365771 () Bool)

(assert (=> bs!20633 m!365771))

(assert (=> b!242604 d!81584))

(declare-fun d!81586 () Bool)

(declare-fun lt!378333 () tuple2!20784)

(assert (=> d!81586 (= lt!378333 (readBit!0 lt!378059))))

(assert (=> d!81586 (= (readBitPure!0 lt!378059) (tuple2!20775 (_2!11314 lt!378333) (_1!11314 lt!378333)))))

(declare-fun bs!20634 () Bool)

(assert (= bs!20634 d!81586))

(declare-fun m!365773 () Bool)

(assert (=> bs!20634 m!365773))

(assert (=> b!242604 d!81586))

(declare-fun d!81588 () Bool)

(assert (=> d!81588 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378055)))) ((_ sign_extend 32) (currentByte!11666 (_2!11308 lt!378055))) ((_ sign_extend 32) (currentBit!11661 (_2!11308 lt!378055))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5837 (buf!6303 (_2!11308 lt!378055)))) ((_ sign_extend 32) (currentByte!11666 (_2!11308 lt!378055))) ((_ sign_extend 32) (currentBit!11661 (_2!11308 lt!378055)))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun bs!20635 () Bool)

(assert (= bs!20635 d!81588))

(assert (=> bs!20635 m!365661))

(assert (=> b!242604 d!81588))

(declare-fun d!81590 () Bool)

(declare-fun res!202751 () Bool)

(declare-fun e!168286 () Bool)

(assert (=> d!81590 (=> (not res!202751) (not e!168286))))

(assert (=> d!81590 (= res!202751 (= (size!5837 (buf!6303 (_2!11308 lt!378055))) (size!5837 (buf!6303 (_2!11308 lt!378047)))))))

(assert (=> d!81590 (= (isPrefixOf!0 (_2!11308 lt!378055) (_2!11308 lt!378047)) e!168286)))

(declare-fun b!242752 () Bool)

(declare-fun res!202749 () Bool)

(assert (=> b!242752 (=> (not res!202749) (not e!168286))))

(assert (=> b!242752 (= res!202749 (bvsle (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378055))) (currentByte!11666 (_2!11308 lt!378055)) (currentBit!11661 (_2!11308 lt!378055))) (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378047))) (currentByte!11666 (_2!11308 lt!378047)) (currentBit!11661 (_2!11308 lt!378047)))))))

(declare-fun b!242753 () Bool)

(declare-fun e!168285 () Bool)

(assert (=> b!242753 (= e!168286 e!168285)))

(declare-fun res!202750 () Bool)

(assert (=> b!242753 (=> res!202750 e!168285)))

(assert (=> b!242753 (= res!202750 (= (size!5837 (buf!6303 (_2!11308 lt!378055))) #b00000000000000000000000000000000))))

(declare-fun b!242754 () Bool)

(assert (=> b!242754 (= e!168285 (arrayBitRangesEq!0 (buf!6303 (_2!11308 lt!378055)) (buf!6303 (_2!11308 lt!378047)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378055))) (currentByte!11666 (_2!11308 lt!378055)) (currentBit!11661 (_2!11308 lt!378055)))))))

(assert (= (and d!81590 res!202751) b!242752))

(assert (= (and b!242752 res!202749) b!242753))

(assert (= (and b!242753 (not res!202750)) b!242754))

(assert (=> b!242752 m!365549))

(assert (=> b!242752 m!365559))

(assert (=> b!242754 m!365549))

(assert (=> b!242754 m!365549))

(declare-fun m!365775 () Bool)

(assert (=> b!242754 m!365775))

(assert (=> b!242602 d!81590))

(declare-fun d!81592 () Bool)

(declare-fun lt!378334 () tuple2!20784)

(assert (=> d!81592 (= lt!378334 (readBit!0 (readerFrom!0 (_2!11308 lt!378055) (currentBit!11661 thiss!1005) (currentByte!11666 thiss!1005))))))

(assert (=> d!81592 (= (readBitPure!0 (readerFrom!0 (_2!11308 lt!378055) (currentBit!11661 thiss!1005) (currentByte!11666 thiss!1005))) (tuple2!20775 (_2!11314 lt!378334) (_1!11314 lt!378334)))))

(declare-fun bs!20636 () Bool)

(assert (= bs!20636 d!81592))

(assert (=> bs!20636 m!365511))

(declare-fun m!365777 () Bool)

(assert (=> bs!20636 m!365777))

(assert (=> b!242612 d!81592))

(declare-fun d!81594 () Bool)

(declare-fun e!168289 () Bool)

(assert (=> d!81594 e!168289))

(declare-fun res!202755 () Bool)

(assert (=> d!81594 (=> (not res!202755) (not e!168289))))

(assert (=> d!81594 (= res!202755 (invariant!0 (currentBit!11661 (_2!11308 lt!378055)) (currentByte!11666 (_2!11308 lt!378055)) (size!5837 (buf!6303 (_2!11308 lt!378055)))))))

(assert (=> d!81594 (= (readerFrom!0 (_2!11308 lt!378055) (currentBit!11661 thiss!1005) (currentByte!11666 thiss!1005)) (BitStream!10597 (buf!6303 (_2!11308 lt!378055)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005)))))

(declare-fun b!242757 () Bool)

(assert (=> b!242757 (= e!168289 (invariant!0 (currentBit!11661 thiss!1005) (currentByte!11666 thiss!1005) (size!5837 (buf!6303 (_2!11308 lt!378055)))))))

(assert (= (and d!81594 res!202755) b!242757))

(assert (=> d!81594 m!365663))

(assert (=> b!242757 m!365557))

(assert (=> b!242612 d!81594))

(declare-fun d!81596 () Bool)

(declare-fun e!168290 () Bool)

(assert (=> d!81596 e!168290))

(declare-fun res!202756 () Bool)

(assert (=> d!81596 (=> (not res!202756) (not e!168290))))

(declare-fun lt!378337 () (_ BitVec 64))

(declare-fun lt!378336 () (_ BitVec 64))

(declare-fun lt!378338 () (_ BitVec 64))

(assert (=> d!81596 (= res!202756 (= lt!378338 (bvsub lt!378336 lt!378337)))))

(assert (=> d!81596 (or (= (bvand lt!378336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378337 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378336 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378336 lt!378337) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81596 (= lt!378337 (remainingBits!0 ((_ sign_extend 32) (size!5837 (buf!6303 (_1!11309 lt!378054)))) ((_ sign_extend 32) (currentByte!11666 (_1!11309 lt!378054))) ((_ sign_extend 32) (currentBit!11661 (_1!11309 lt!378054)))))))

(declare-fun lt!378335 () (_ BitVec 64))

(declare-fun lt!378340 () (_ BitVec 64))

(assert (=> d!81596 (= lt!378336 (bvmul lt!378335 lt!378340))))

(assert (=> d!81596 (or (= lt!378335 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378340 (bvsdiv (bvmul lt!378335 lt!378340) lt!378335)))))

(assert (=> d!81596 (= lt!378340 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81596 (= lt!378335 ((_ sign_extend 32) (size!5837 (buf!6303 (_1!11309 lt!378054)))))))

(assert (=> d!81596 (= lt!378338 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11666 (_1!11309 lt!378054))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11661 (_1!11309 lt!378054)))))))

(assert (=> d!81596 (invariant!0 (currentBit!11661 (_1!11309 lt!378054)) (currentByte!11666 (_1!11309 lt!378054)) (size!5837 (buf!6303 (_1!11309 lt!378054))))))

(assert (=> d!81596 (= (bitIndex!0 (size!5837 (buf!6303 (_1!11309 lt!378054))) (currentByte!11666 (_1!11309 lt!378054)) (currentBit!11661 (_1!11309 lt!378054))) lt!378338)))

(declare-fun b!242758 () Bool)

(declare-fun res!202757 () Bool)

(assert (=> b!242758 (=> (not res!202757) (not e!168290))))

(assert (=> b!242758 (= res!202757 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378338))))

(declare-fun b!242759 () Bool)

(declare-fun lt!378339 () (_ BitVec 64))

(assert (=> b!242759 (= e!168290 (bvsle lt!378338 (bvmul lt!378339 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242759 (or (= lt!378339 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378339 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378339)))))

(assert (=> b!242759 (= lt!378339 ((_ sign_extend 32) (size!5837 (buf!6303 (_1!11309 lt!378054)))))))

(assert (= (and d!81596 res!202756) b!242758))

(assert (= (and b!242758 res!202757) b!242759))

(declare-fun m!365779 () Bool)

(assert (=> d!81596 m!365779))

(declare-fun m!365781 () Bool)

(assert (=> d!81596 m!365781))

(assert (=> b!242601 d!81596))

(declare-fun d!81598 () Bool)

(assert (=> d!81598 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!5837 (buf!6303 thiss!1005))) ((_ sign_extend 32) (currentByte!11666 thiss!1005)) ((_ sign_extend 32) (currentBit!11661 thiss!1005)) (bvsub nBits!297 from!289)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!5837 (buf!6303 thiss!1005))) ((_ sign_extend 32) (currentByte!11666 thiss!1005)) ((_ sign_extend 32) (currentBit!11661 thiss!1005))) (bvsub nBits!297 from!289)))))

(declare-fun bs!20637 () Bool)

(assert (= bs!20637 d!81598))

(declare-fun m!365783 () Bool)

(assert (=> bs!20637 m!365783))

(assert (=> b!242611 d!81598))

(declare-fun d!81600 () Bool)

(assert (=> d!81600 (= (invariant!0 (currentBit!11661 thiss!1005) (currentByte!11666 thiss!1005) (size!5837 (buf!6303 (_2!11308 lt!378047)))) (and (bvsge (currentBit!11661 thiss!1005) #b00000000000000000000000000000000) (bvslt (currentBit!11661 thiss!1005) #b00000000000000000000000000001000) (bvsge (currentByte!11666 thiss!1005) #b00000000000000000000000000000000) (or (bvslt (currentByte!11666 thiss!1005) (size!5837 (buf!6303 (_2!11308 lt!378047)))) (and (= (currentBit!11661 thiss!1005) #b00000000000000000000000000000000) (= (currentByte!11666 thiss!1005) (size!5837 (buf!6303 (_2!11308 lt!378047))))))))))

(assert (=> b!242610 d!81600))

(declare-fun d!81602 () Bool)

(declare-fun res!202760 () Bool)

(declare-fun e!168292 () Bool)

(assert (=> d!81602 (=> (not res!202760) (not e!168292))))

(assert (=> d!81602 (= res!202760 (= (size!5837 (buf!6303 thiss!1005)) (size!5837 (buf!6303 (_2!11308 lt!378055)))))))

(assert (=> d!81602 (= (isPrefixOf!0 thiss!1005 (_2!11308 lt!378055)) e!168292)))

(declare-fun b!242760 () Bool)

(declare-fun res!202758 () Bool)

(assert (=> b!242760 (=> (not res!202758) (not e!168292))))

(assert (=> b!242760 (= res!202758 (bvsle (bitIndex!0 (size!5837 (buf!6303 thiss!1005)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005)) (bitIndex!0 (size!5837 (buf!6303 (_2!11308 lt!378055))) (currentByte!11666 (_2!11308 lt!378055)) (currentBit!11661 (_2!11308 lt!378055)))))))

(declare-fun b!242761 () Bool)

(declare-fun e!168291 () Bool)

(assert (=> b!242761 (= e!168292 e!168291)))

(declare-fun res!202759 () Bool)

(assert (=> b!242761 (=> res!202759 e!168291)))

(assert (=> b!242761 (= res!202759 (= (size!5837 (buf!6303 thiss!1005)) #b00000000000000000000000000000000))))

(declare-fun b!242762 () Bool)

(assert (=> b!242762 (= e!168291 (arrayBitRangesEq!0 (buf!6303 thiss!1005) (buf!6303 (_2!11308 lt!378055)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!5837 (buf!6303 thiss!1005)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005))))))

(assert (= (and d!81602 res!202760) b!242760))

(assert (= (and b!242760 res!202758) b!242761))

(assert (= (and b!242761 (not res!202759)) b!242762))

(assert (=> b!242760 m!365551))

(assert (=> b!242760 m!365549))

(assert (=> b!242762 m!365551))

(assert (=> b!242762 m!365551))

(declare-fun m!365785 () Bool)

(assert (=> b!242762 m!365785))

(assert (=> b!242599 d!81602))

(assert (=> b!242609 d!81534))

(declare-fun d!81604 () Bool)

(declare-fun e!168293 () Bool)

(assert (=> d!81604 e!168293))

(declare-fun res!202761 () Bool)

(assert (=> d!81604 (=> (not res!202761) (not e!168293))))

(declare-fun lt!378343 () (_ BitVec 64))

(declare-fun lt!378342 () (_ BitVec 64))

(declare-fun lt!378344 () (_ BitVec 64))

(assert (=> d!81604 (= res!202761 (= lt!378344 (bvsub lt!378342 lt!378343)))))

(assert (=> d!81604 (or (= (bvand lt!378342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!378343 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!378342 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!378342 lt!378343) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!81604 (= lt!378343 (remainingBits!0 ((_ sign_extend 32) (size!5837 (buf!6303 thiss!1005))) ((_ sign_extend 32) (currentByte!11666 thiss!1005)) ((_ sign_extend 32) (currentBit!11661 thiss!1005))))))

(declare-fun lt!378341 () (_ BitVec 64))

(declare-fun lt!378346 () (_ BitVec 64))

(assert (=> d!81604 (= lt!378342 (bvmul lt!378341 lt!378346))))

(assert (=> d!81604 (or (= lt!378341 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!378346 (bvsdiv (bvmul lt!378341 lt!378346) lt!378341)))))

(assert (=> d!81604 (= lt!378346 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!81604 (= lt!378341 ((_ sign_extend 32) (size!5837 (buf!6303 thiss!1005))))))

(assert (=> d!81604 (= lt!378344 (bvadd (bvmul ((_ sign_extend 32) (currentByte!11666 thiss!1005)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!11661 thiss!1005))))))

(assert (=> d!81604 (invariant!0 (currentBit!11661 thiss!1005) (currentByte!11666 thiss!1005) (size!5837 (buf!6303 thiss!1005)))))

(assert (=> d!81604 (= (bitIndex!0 (size!5837 (buf!6303 thiss!1005)) (currentByte!11666 thiss!1005) (currentBit!11661 thiss!1005)) lt!378344)))

(declare-fun b!242763 () Bool)

(declare-fun res!202762 () Bool)

(assert (=> b!242763 (=> (not res!202762) (not e!168293))))

(assert (=> b!242763 (= res!202762 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!378344))))

(declare-fun b!242764 () Bool)

(declare-fun lt!378345 () (_ BitVec 64))

(assert (=> b!242764 (= e!168293 (bvsle lt!378344 (bvmul lt!378345 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!242764 (or (= lt!378345 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!378345 #b0000000000000000000000000000000000000000000000000000000000001000) lt!378345)))))

(assert (=> b!242764 (= lt!378345 ((_ sign_extend 32) (size!5837 (buf!6303 thiss!1005))))))

(assert (= (and d!81604 res!202761) b!242763))

(assert (= (and b!242763 res!202762) b!242764))

(assert (=> d!81604 m!365783))

(declare-fun m!365787 () Bool)

(assert (=> d!81604 m!365787))

(assert (=> b!242609 d!81604))

(declare-fun d!81606 () Bool)

(assert (=> d!81606 (= (inv!12 thiss!1005) (invariant!0 (currentBit!11661 thiss!1005) (currentByte!11666 thiss!1005) (size!5837 (buf!6303 thiss!1005))))))

(declare-fun bs!20638 () Bool)

(assert (= bs!20638 d!81606))

(assert (=> bs!20638 m!365787))

(assert (=> start!52504 d!81606))

(declare-fun d!81608 () Bool)

(assert (=> d!81608 (= (array_inv!5578 (buf!6303 thiss!1005)) (bvsge (size!5837 (buf!6303 thiss!1005)) #b00000000000000000000000000000000))))

(assert (=> b!242608 d!81608))

(check-sat (not d!81554) (not d!81524) (not b!242667) (not b!242757) (not b!242707) (not b!242750) (not d!81526) (not d!81542) (not b!242665) (not d!81592) (not d!81606) (not b!242752) (not b!242710) (not b!242668) (not b!242749) (not d!81530) (not b!242686) (not d!81552) (not d!81550) (not b!242701) (not d!81594) (not d!81588) (not b!242709) (not d!81596) (not b!242702) (not b!242760) (not b!242700) (not b!242751) (not b!242714) (not d!81534) (not d!81548) (not d!81532) (not d!81584) (not d!81528) (not d!81598) (not b!242748) (not b!242684) (not d!81544) (not d!81540) (not d!81546) (not d!81538) (not b!242703) (not d!81586) (not b!242754) (not b!242762) (not b!242708) (not b!242666) (not d!81604))
(check-sat)
