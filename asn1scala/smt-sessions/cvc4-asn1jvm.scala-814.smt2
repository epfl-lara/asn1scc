; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!24042 () Bool)

(assert start!24042)

(declare-datatypes ((array!5397 0))(
  ( (array!5398 (arr!3035 (Array (_ BitVec 32) (_ BitVec 8))) (size!2442 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!4358 0))(
  ( (BitStream!4359 (buf!2879 array!5397) (currentByte!5570 (_ BitVec 32)) (currentBit!5565 (_ BitVec 32))) )
))
(declare-fun lt!190821 () BitStream!4358)

(declare-fun b!121737 () Bool)

(declare-fun thiss!1305 () BitStream!4358)

(declare-fun e!79756 () Bool)

(declare-datatypes ((tuple2!10244 0))(
  ( (tuple2!10245 (_1!5387 BitStream!4358) (_2!5387 BitStream!4358)) )
))
(declare-fun lt!190832 () tuple2!10244)

(declare-datatypes ((Unit!7499 0))(
  ( (Unit!7500) )
))
(declare-datatypes ((tuple2!10246 0))(
  ( (tuple2!10247 (_1!5388 Unit!7499) (_2!5388 BitStream!4358)) )
))
(declare-fun lt!190818 () tuple2!10246)

(declare-fun lt!190838 () (_ BitVec 64))

(declare-fun lt!190820 () (_ BitVec 64))

(assert (=> b!121737 (= e!79756 (or (not (= (_1!5387 lt!190832) lt!190821)) (not (= (size!2442 (buf!2879 thiss!1305)) (size!2442 (buf!2879 (_2!5388 lt!190818))))) (let ((bdg!6310 (bvand lt!190820 #b1000000000000000000000000000000000000000000000000000000000000000))) (or (not (= bdg!6310 (bvand lt!190838 #b1000000000000000000000000000000000000000000000000000000000000000))) (= bdg!6310 (bvand (bvadd lt!190820 lt!190838) #b1000000000000000000000000000000000000000000000000000000000000000))))))))

(declare-fun e!79754 () Bool)

(assert (=> b!121737 e!79754))

(declare-fun res!100847 () Bool)

(assert (=> b!121737 (=> (not res!100847) (not e!79754))))

(declare-fun lt!190817 () (_ BitVec 64))

(declare-fun lt!190837 () (_ BitVec 64))

(declare-fun withMovedBitIndex!0 (BitStream!4358 (_ BitVec 64)) BitStream!4358)

(assert (=> b!121737 (= res!100847 (= (_1!5387 lt!190832) (withMovedBitIndex!0 (_2!5387 lt!190832) (bvsub lt!190817 lt!190837))))))

(declare-fun lt!190841 () tuple2!10246)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121737 (= lt!190817 (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190841))) (currentByte!5570 (_2!5388 lt!190841)) (currentBit!5565 (_2!5388 lt!190841))))))

(declare-fun lt!190829 () tuple2!10244)

(assert (=> b!121737 (= (_1!5387 lt!190829) (withMovedBitIndex!0 (_2!5387 lt!190829) (bvsub lt!190820 lt!190837)))))

(assert (=> b!121737 (= lt!190837 (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190818))) (currentByte!5570 (_2!5388 lt!190818)) (currentBit!5565 (_2!5388 lt!190818))))))

(assert (=> b!121737 (= lt!190820 (bitIndex!0 (size!2442 (buf!2879 thiss!1305)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305)))))

(declare-datatypes ((tuple2!10248 0))(
  ( (tuple2!10249 (_1!5389 BitStream!4358) (_2!5389 (_ BitVec 64))) )
))
(declare-fun lt!190840 () tuple2!10248)

(declare-fun lt!190824 () tuple2!10248)

(assert (=> b!121737 (and (= (_2!5389 lt!190840) (_2!5389 lt!190824)) (= (_1!5389 lt!190840) (_1!5389 lt!190824)))))

(declare-fun nBits!396 () (_ BitVec 32))

(declare-fun lt!190823 () Unit!7499)

(declare-fun i!615 () (_ BitVec 32))

(declare-fun lt!190836 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPrefixLemma!0 (BitStream!4358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) Unit!7499)

(assert (=> b!121737 (= lt!190823 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5387 lt!190829) nBits!396 i!615 lt!190836))))

(declare-fun lt!190819 () (_ BitVec 64))

(declare-fun readNLeastSignificantBitsLoopPure!0 (BitStream!4358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10248)

(assert (=> b!121737 (= lt!190824 (readNLeastSignificantBitsLoopPure!0 lt!190821 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190819))))

(assert (=> b!121737 (= lt!190821 (withMovedBitIndex!0 (_1!5387 lt!190829) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun b!121738 () Bool)

(declare-fun e!79757 () Bool)

(declare-datatypes ((tuple2!10250 0))(
  ( (tuple2!10251 (_1!5390 BitStream!4358) (_2!5390 Bool)) )
))
(declare-fun lt!190835 () tuple2!10250)

(declare-fun lt!190827 () (_ BitVec 64))

(assert (=> b!121738 (= e!79757 (= (bitIndex!0 (size!2442 (buf!2879 (_1!5390 lt!190835))) (currentByte!5570 (_1!5390 lt!190835)) (currentBit!5565 (_1!5390 lt!190835))) lt!190827))))

(declare-fun res!100853 () Bool)

(declare-fun e!79750 () Bool)

(assert (=> start!24042 (=> (not res!100853) (not e!79750))))

(assert (=> start!24042 (= res!100853 (and (bvsle #b00000000000000000000000000000000 i!615) (bvsle i!615 nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000)))))

(assert (=> start!24042 e!79750))

(assert (=> start!24042 true))

(declare-fun e!79758 () Bool)

(declare-fun inv!12 (BitStream!4358) Bool)

(assert (=> start!24042 (and (inv!12 thiss!1305) e!79758)))

(declare-fun b!121739 () Bool)

(declare-fun e!79748 () Bool)

(assert (=> b!121739 (= e!79748 (not e!79756))))

(declare-fun res!100851 () Bool)

(assert (=> b!121739 (=> res!100851 e!79756)))

(declare-fun lt!190830 () tuple2!10248)

(assert (=> b!121739 (= res!100851 (not (= (_1!5389 lt!190830) (_2!5387 lt!190832))))))

(assert (=> b!121739 (= lt!190830 (readNLeastSignificantBitsLoopPure!0 (_1!5387 lt!190832) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190819))))

(declare-fun lt!190845 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121739 (validate_offset_bits!1 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190818)))) ((_ sign_extend 32) (currentByte!5570 (_2!5388 lt!190841))) ((_ sign_extend 32) (currentBit!5565 (_2!5388 lt!190841))) lt!190845)))

(declare-fun lt!190833 () Unit!7499)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!4358 array!5397 (_ BitVec 64)) Unit!7499)

(assert (=> b!121739 (= lt!190833 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5388 lt!190841) (buf!2879 (_2!5388 lt!190818)) lt!190845))))

(assert (=> b!121739 (= lt!190845 ((_ sign_extend 32) (bvsub (bvsub nBits!396 i!615) #b00000000000000000000000000000001)))))

(declare-fun lt!190839 () tuple2!10250)

(declare-fun lt!190843 () (_ BitVec 64))

(assert (=> b!121739 (= lt!190819 (bvor lt!190836 (ite (_2!5390 lt!190839) lt!190843 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121739 (= lt!190840 (readNLeastSignificantBitsLoopPure!0 (_1!5387 lt!190829) nBits!396 i!615 lt!190836))))

(assert (=> b!121739 (validate_offset_bits!1 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190818)))) ((_ sign_extend 32) (currentByte!5570 thiss!1305)) ((_ sign_extend 32) (currentBit!5565 thiss!1305)) lt!190838)))

(declare-fun lt!190826 () Unit!7499)

(assert (=> b!121739 (= lt!190826 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2879 (_2!5388 lt!190818)) lt!190838))))

(declare-fun v!199 () (_ BitVec 64))

(declare-fun onesLSBLong!0 ((_ BitVec 32)) (_ BitVec 64))

(assert (=> b!121739 (= lt!190836 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 i!615)))))))

(declare-fun lt!190842 () Bool)

(assert (=> b!121739 (= (_2!5390 lt!190839) lt!190842)))

(declare-fun readBitPure!0 (BitStream!4358) tuple2!10250)

(assert (=> b!121739 (= lt!190839 (readBitPure!0 (_1!5387 lt!190829)))))

(declare-fun reader!0 (BitStream!4358 BitStream!4358) tuple2!10244)

(assert (=> b!121739 (= lt!190832 (reader!0 (_2!5388 lt!190841) (_2!5388 lt!190818)))))

(assert (=> b!121739 (= lt!190829 (reader!0 thiss!1305 (_2!5388 lt!190818)))))

(declare-fun e!79755 () Bool)

(assert (=> b!121739 e!79755))

(declare-fun res!100846 () Bool)

(assert (=> b!121739 (=> (not res!100846) (not e!79755))))

(declare-fun lt!190834 () tuple2!10250)

(declare-fun lt!190825 () tuple2!10250)

(assert (=> b!121739 (= res!100846 (= (bitIndex!0 (size!2442 (buf!2879 (_1!5390 lt!190834))) (currentByte!5570 (_1!5390 lt!190834)) (currentBit!5565 (_1!5390 lt!190834))) (bitIndex!0 (size!2442 (buf!2879 (_1!5390 lt!190825))) (currentByte!5570 (_1!5390 lt!190825)) (currentBit!5565 (_1!5390 lt!190825)))))))

(declare-fun lt!190831 () Unit!7499)

(declare-fun lt!190822 () BitStream!4358)

(declare-fun readBitPrefixLemma!0 (BitStream!4358 BitStream!4358) Unit!7499)

(assert (=> b!121739 (= lt!190831 (readBitPrefixLemma!0 lt!190822 (_2!5388 lt!190818)))))

(assert (=> b!121739 (= lt!190825 (readBitPure!0 (BitStream!4359 (buf!2879 (_2!5388 lt!190818)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305))))))

(assert (=> b!121739 (= lt!190834 (readBitPure!0 lt!190822))))

(assert (=> b!121739 (= lt!190822 (BitStream!4359 (buf!2879 (_2!5388 lt!190841)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305)))))

(declare-fun e!79751 () Bool)

(assert (=> b!121739 e!79751))

(declare-fun res!100850 () Bool)

(assert (=> b!121739 (=> (not res!100850) (not e!79751))))

(declare-fun isPrefixOf!0 (BitStream!4358 BitStream!4358) Bool)

(assert (=> b!121739 (= res!100850 (isPrefixOf!0 thiss!1305 (_2!5388 lt!190818)))))

(declare-fun lt!190844 () Unit!7499)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!4358 BitStream!4358 BitStream!4358) Unit!7499)

(assert (=> b!121739 (= lt!190844 (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5388 lt!190841) (_2!5388 lt!190818)))))

(declare-fun appendNLeastSignificantBitsLoop!0 (BitStream!4358 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) tuple2!10246)

(assert (=> b!121739 (= lt!190818 (appendNLeastSignificantBitsLoop!0 (_2!5388 lt!190841) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)))))

(declare-fun e!79749 () Bool)

(assert (=> b!121739 e!79749))

(declare-fun res!100849 () Bool)

(assert (=> b!121739 (=> (not res!100849) (not e!79749))))

(assert (=> b!121739 (= res!100849 (= (size!2442 (buf!2879 thiss!1305)) (size!2442 (buf!2879 (_2!5388 lt!190841)))))))

(declare-fun appendBit!0 (BitStream!4358 Bool) tuple2!10246)

(assert (=> b!121739 (= lt!190841 (appendBit!0 thiss!1305 lt!190842))))

(assert (=> b!121739 (= lt!190842 (not (= (bvand v!199 lt!190843) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!121739 (= lt!190843 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))))))

(declare-fun b!121740 () Bool)

(declare-fun array_inv!2244 (array!5397) Bool)

(assert (=> b!121740 (= e!79758 (array_inv!2244 (buf!2879 thiss!1305)))))

(declare-fun b!121741 () Bool)

(declare-fun res!100857 () Bool)

(assert (=> b!121741 (=> (not res!100857) (not e!79748))))

(assert (=> b!121741 (= res!100857 (= (bvand v!199 (onesLSBLong!0 nBits!396)) v!199))))

(declare-fun b!121742 () Bool)

(assert (=> b!121742 (= e!79750 e!79748)))

(declare-fun res!100845 () Bool)

(assert (=> b!121742 (=> (not res!100845) (not e!79748))))

(assert (=> b!121742 (= res!100845 (validate_offset_bits!1 ((_ sign_extend 32) (size!2442 (buf!2879 thiss!1305))) ((_ sign_extend 32) (currentByte!5570 thiss!1305)) ((_ sign_extend 32) (currentBit!5565 thiss!1305)) lt!190838))))

(assert (=> b!121742 (= lt!190838 ((_ sign_extend 32) (bvsub nBits!396 i!615)))))

(declare-fun b!121743 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!121743 (= e!79751 (invariant!0 (currentBit!5565 thiss!1305) (currentByte!5570 thiss!1305) (size!2442 (buf!2879 (_2!5388 lt!190818)))))))

(declare-fun b!121744 () Bool)

(declare-fun e!79753 () Bool)

(assert (=> b!121744 (= e!79753 e!79757)))

(declare-fun res!100848 () Bool)

(assert (=> b!121744 (=> (not res!100848) (not e!79757))))

(assert (=> b!121744 (= res!100848 (and (= (_2!5390 lt!190835) lt!190842) (= (_1!5390 lt!190835) (_2!5388 lt!190841))))))

(declare-fun readerFrom!0 (BitStream!4358 (_ BitVec 32) (_ BitVec 32)) BitStream!4358)

(assert (=> b!121744 (= lt!190835 (readBitPure!0 (readerFrom!0 (_2!5388 lt!190841) (currentBit!5565 thiss!1305) (currentByte!5570 thiss!1305))))))

(declare-fun b!121745 () Bool)

(declare-fun res!100856 () Bool)

(assert (=> b!121745 (=> (not res!100856) (not e!79748))))

(assert (=> b!121745 (= res!100856 (bvslt i!615 nBits!396))))

(declare-fun b!121746 () Bool)

(declare-fun res!100852 () Bool)

(assert (=> b!121746 (=> (not res!100852) (not e!79753))))

(assert (=> b!121746 (= res!100852 (isPrefixOf!0 thiss!1305 (_2!5388 lt!190841)))))

(declare-fun b!121747 () Bool)

(assert (=> b!121747 (= e!79754 (and (= lt!190820 (bvsub lt!190817 #b0000000000000000000000000000000000000000000000000000000000000001)) (or (not (= (_1!5387 lt!190832) lt!190821)) (and (= (_2!5389 lt!190840) (_2!5389 lt!190830)) (= (_1!5389 lt!190840) (_2!5387 lt!190829))))))))

(declare-fun b!121748 () Bool)

(assert (=> b!121748 (= e!79755 (= (_2!5390 lt!190834) (_2!5390 lt!190825)))))

(declare-fun b!121749 () Bool)

(assert (=> b!121749 (= e!79749 e!79753)))

(declare-fun res!100855 () Bool)

(assert (=> b!121749 (=> (not res!100855) (not e!79753))))

(declare-fun lt!190828 () (_ BitVec 64))

(assert (=> b!121749 (= res!100855 (= lt!190827 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!190828)))))

(assert (=> b!121749 (= lt!190827 (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190841))) (currentByte!5570 (_2!5388 lt!190841)) (currentBit!5565 (_2!5388 lt!190841))))))

(assert (=> b!121749 (= lt!190828 (bitIndex!0 (size!2442 (buf!2879 thiss!1305)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305)))))

(declare-fun b!121750 () Bool)

(declare-fun res!100854 () Bool)

(assert (=> b!121750 (=> (not res!100854) (not e!79751))))

(assert (=> b!121750 (= res!100854 (invariant!0 (currentBit!5565 thiss!1305) (currentByte!5570 thiss!1305) (size!2442 (buf!2879 (_2!5388 lt!190841)))))))

(assert (= (and start!24042 res!100853) b!121742))

(assert (= (and b!121742 res!100845) b!121741))

(assert (= (and b!121741 res!100857) b!121745))

(assert (= (and b!121745 res!100856) b!121739))

(assert (= (and b!121739 res!100849) b!121749))

(assert (= (and b!121749 res!100855) b!121746))

(assert (= (and b!121746 res!100852) b!121744))

(assert (= (and b!121744 res!100848) b!121738))

(assert (= (and b!121739 res!100850) b!121750))

(assert (= (and b!121750 res!100854) b!121743))

(assert (= (and b!121739 res!100846) b!121748))

(assert (= (and b!121739 (not res!100851)) b!121737))

(assert (= (and b!121737 res!100847) b!121747))

(assert (= start!24042 b!121740))

(declare-fun m!184575 () Bool)

(assert (=> b!121737 m!184575))

(declare-fun m!184577 () Bool)

(assert (=> b!121737 m!184577))

(declare-fun m!184579 () Bool)

(assert (=> b!121737 m!184579))

(declare-fun m!184581 () Bool)

(assert (=> b!121737 m!184581))

(declare-fun m!184583 () Bool)

(assert (=> b!121737 m!184583))

(declare-fun m!184585 () Bool)

(assert (=> b!121737 m!184585))

(declare-fun m!184587 () Bool)

(assert (=> b!121737 m!184587))

(declare-fun m!184589 () Bool)

(assert (=> b!121737 m!184589))

(declare-fun m!184591 () Bool)

(assert (=> b!121742 m!184591))

(declare-fun m!184593 () Bool)

(assert (=> b!121741 m!184593))

(assert (=> b!121749 m!184581))

(assert (=> b!121749 m!184583))

(declare-fun m!184595 () Bool)

(assert (=> b!121750 m!184595))

(declare-fun m!184597 () Bool)

(assert (=> start!24042 m!184597))

(declare-fun m!184599 () Bool)

(assert (=> b!121743 m!184599))

(declare-fun m!184601 () Bool)

(assert (=> b!121739 m!184601))

(declare-fun m!184603 () Bool)

(assert (=> b!121739 m!184603))

(declare-fun m!184605 () Bool)

(assert (=> b!121739 m!184605))

(declare-fun m!184607 () Bool)

(assert (=> b!121739 m!184607))

(declare-fun m!184609 () Bool)

(assert (=> b!121739 m!184609))

(declare-fun m!184611 () Bool)

(assert (=> b!121739 m!184611))

(declare-fun m!184613 () Bool)

(assert (=> b!121739 m!184613))

(declare-fun m!184615 () Bool)

(assert (=> b!121739 m!184615))

(declare-fun m!184617 () Bool)

(assert (=> b!121739 m!184617))

(declare-fun m!184619 () Bool)

(assert (=> b!121739 m!184619))

(declare-fun m!184621 () Bool)

(assert (=> b!121739 m!184621))

(declare-fun m!184623 () Bool)

(assert (=> b!121739 m!184623))

(declare-fun m!184625 () Bool)

(assert (=> b!121739 m!184625))

(declare-fun m!184627 () Bool)

(assert (=> b!121739 m!184627))

(declare-fun m!184629 () Bool)

(assert (=> b!121739 m!184629))

(declare-fun m!184631 () Bool)

(assert (=> b!121739 m!184631))

(declare-fun m!184633 () Bool)

(assert (=> b!121739 m!184633))

(declare-fun m!184635 () Bool)

(assert (=> b!121739 m!184635))

(declare-fun m!184637 () Bool)

(assert (=> b!121739 m!184637))

(declare-fun m!184639 () Bool)

(assert (=> b!121738 m!184639))

(declare-fun m!184641 () Bool)

(assert (=> b!121744 m!184641))

(assert (=> b!121744 m!184641))

(declare-fun m!184643 () Bool)

(assert (=> b!121744 m!184643))

(declare-fun m!184645 () Bool)

(assert (=> b!121746 m!184645))

(declare-fun m!184647 () Bool)

(assert (=> b!121740 m!184647))

(push 1)

(assert (not b!121743))

(assert (not b!121744))

(assert (not b!121739))

(assert (not b!121741))

(assert (not start!24042))

(assert (not b!121738))

(assert (not b!121750))

(assert (not b!121749))

(assert (not b!121742))

(assert (not b!121740))

(assert (not b!121746))

(assert (not b!121737))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(get-model)

(pop 1)

(declare-fun d!39246 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!39246 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2442 (buf!2879 thiss!1305))) ((_ sign_extend 32) (currentByte!5570 thiss!1305)) ((_ sign_extend 32) (currentBit!5565 thiss!1305)) lt!190838) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2442 (buf!2879 thiss!1305))) ((_ sign_extend 32) (currentByte!5570 thiss!1305)) ((_ sign_extend 32) (currentBit!5565 thiss!1305))) lt!190838))))

(declare-fun bs!9494 () Bool)

(assert (= bs!9494 d!39246))

(declare-fun m!184691 () Bool)

(assert (=> bs!9494 m!184691))

(assert (=> b!121742 d!39246))

(declare-fun d!39248 () Bool)

(assert (=> d!39248 (= (invariant!0 (currentBit!5565 thiss!1305) (currentByte!5570 thiss!1305) (size!2442 (buf!2879 (_2!5388 lt!190818)))) (and (bvsge (currentBit!5565 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5565 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5570 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5570 thiss!1305) (size!2442 (buf!2879 (_2!5388 lt!190818)))) (and (= (currentBit!5565 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5570 thiss!1305) (size!2442 (buf!2879 (_2!5388 lt!190818))))))))))

(assert (=> b!121743 d!39248))

(declare-fun d!39250 () Bool)

(declare-datatypes ((tuple2!10258 0))(
  ( (tuple2!10259 (_1!5394 Bool) (_2!5394 BitStream!4358)) )
))
(declare-fun lt!190926 () tuple2!10258)

(declare-fun readBit!0 (BitStream!4358) tuple2!10258)

(assert (=> d!39250 (= lt!190926 (readBit!0 (readerFrom!0 (_2!5388 lt!190841) (currentBit!5565 thiss!1305) (currentByte!5570 thiss!1305))))))

(assert (=> d!39250 (= (readBitPure!0 (readerFrom!0 (_2!5388 lt!190841) (currentBit!5565 thiss!1305) (currentByte!5570 thiss!1305))) (tuple2!10251 (_2!5394 lt!190926) (_1!5394 lt!190926)))))

(declare-fun bs!9495 () Bool)

(assert (= bs!9495 d!39250))

(assert (=> bs!9495 m!184641))

(declare-fun m!184693 () Bool)

(assert (=> bs!9495 m!184693))

(assert (=> b!121744 d!39250))

(declare-fun d!39252 () Bool)

(declare-fun e!79770 () Bool)

(assert (=> d!39252 e!79770))

(declare-fun res!100876 () Bool)

(assert (=> d!39252 (=> (not res!100876) (not e!79770))))

(assert (=> d!39252 (= res!100876 (invariant!0 (currentBit!5565 (_2!5388 lt!190841)) (currentByte!5570 (_2!5388 lt!190841)) (size!2442 (buf!2879 (_2!5388 lt!190841)))))))

(assert (=> d!39252 (= (readerFrom!0 (_2!5388 lt!190841) (currentBit!5565 thiss!1305) (currentByte!5570 thiss!1305)) (BitStream!4359 (buf!2879 (_2!5388 lt!190841)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305)))))

(declare-fun b!121774 () Bool)

(assert (=> b!121774 (= e!79770 (invariant!0 (currentBit!5565 thiss!1305) (currentByte!5570 thiss!1305) (size!2442 (buf!2879 (_2!5388 lt!190841)))))))

(assert (= (and d!39252 res!100876) b!121774))

(declare-fun m!184697 () Bool)

(assert (=> d!39252 m!184697))

(assert (=> b!121774 m!184595))

(assert (=> b!121744 d!39252))

(declare-fun d!39258 () Bool)

(declare-fun res!100883 () Bool)

(declare-fun e!79776 () Bool)

(assert (=> d!39258 (=> (not res!100883) (not e!79776))))

(assert (=> d!39258 (= res!100883 (= (size!2442 (buf!2879 thiss!1305)) (size!2442 (buf!2879 (_2!5388 lt!190841)))))))

(assert (=> d!39258 (= (isPrefixOf!0 thiss!1305 (_2!5388 lt!190841)) e!79776)))

(declare-fun b!121781 () Bool)

(declare-fun res!100885 () Bool)

(assert (=> b!121781 (=> (not res!100885) (not e!79776))))

(assert (=> b!121781 (= res!100885 (bvsle (bitIndex!0 (size!2442 (buf!2879 thiss!1305)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305)) (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190841))) (currentByte!5570 (_2!5388 lt!190841)) (currentBit!5565 (_2!5388 lt!190841)))))))

(declare-fun b!121782 () Bool)

(declare-fun e!79775 () Bool)

(assert (=> b!121782 (= e!79776 e!79775)))

(declare-fun res!100884 () Bool)

(assert (=> b!121782 (=> res!100884 e!79775)))

(assert (=> b!121782 (= res!100884 (= (size!2442 (buf!2879 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!121783 () Bool)

(declare-fun arrayBitRangesEq!0 (array!5397 array!5397 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!121783 (= e!79775 (arrayBitRangesEq!0 (buf!2879 thiss!1305) (buf!2879 (_2!5388 lt!190841)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2442 (buf!2879 thiss!1305)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305))))))

(assert (= (and d!39258 res!100883) b!121781))

(assert (= (and b!121781 res!100885) b!121782))

(assert (= (and b!121782 (not res!100884)) b!121783))

(assert (=> b!121781 m!184583))

(assert (=> b!121781 m!184581))

(assert (=> b!121783 m!184583))

(assert (=> b!121783 m!184583))

(declare-fun m!184699 () Bool)

(assert (=> b!121783 m!184699))

(assert (=> b!121746 d!39258))

(declare-fun d!39260 () Bool)

(declare-fun e!79785 () Bool)

(assert (=> d!39260 e!79785))

(declare-fun res!100901 () Bool)

(assert (=> d!39260 (=> (not res!100901) (not e!79785))))

(declare-fun lt!190965 () (_ BitVec 64))

(declare-fun lt!190966 () (_ BitVec 64))

(declare-fun lt!190964 () (_ BitVec 64))

(assert (=> d!39260 (= res!100901 (= lt!190964 (bvsub lt!190965 lt!190966)))))

(assert (=> d!39260 (or (= (bvand lt!190965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!190966 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!190965 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!190965 lt!190966) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39260 (= lt!190966 (remainingBits!0 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190841)))) ((_ sign_extend 32) (currentByte!5570 (_2!5388 lt!190841))) ((_ sign_extend 32) (currentBit!5565 (_2!5388 lt!190841)))))))

(declare-fun lt!190967 () (_ BitVec 64))

(declare-fun lt!190968 () (_ BitVec 64))

(assert (=> d!39260 (= lt!190965 (bvmul lt!190967 lt!190968))))

(assert (=> d!39260 (or (= lt!190967 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!190968 (bvsdiv (bvmul lt!190967 lt!190968) lt!190967)))))

(assert (=> d!39260 (= lt!190968 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39260 (= lt!190967 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190841)))))))

(assert (=> d!39260 (= lt!190964 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5570 (_2!5388 lt!190841))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5565 (_2!5388 lt!190841)))))))

(assert (=> d!39260 (invariant!0 (currentBit!5565 (_2!5388 lt!190841)) (currentByte!5570 (_2!5388 lt!190841)) (size!2442 (buf!2879 (_2!5388 lt!190841))))))

(assert (=> d!39260 (= (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190841))) (currentByte!5570 (_2!5388 lt!190841)) (currentBit!5565 (_2!5388 lt!190841))) lt!190964)))

(declare-fun b!121797 () Bool)

(declare-fun res!100900 () Bool)

(assert (=> b!121797 (=> (not res!100900) (not e!79785))))

(assert (=> b!121797 (= res!100900 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!190964))))

(declare-fun b!121798 () Bool)

(declare-fun lt!190969 () (_ BitVec 64))

(assert (=> b!121798 (= e!79785 (bvsle lt!190964 (bvmul lt!190969 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121798 (or (= lt!190969 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!190969 #b0000000000000000000000000000000000000000000000000000000000001000) lt!190969)))))

(assert (=> b!121798 (= lt!190969 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190841)))))))

(assert (= (and d!39260 res!100901) b!121797))

(assert (= (and b!121797 res!100900) b!121798))

(declare-fun m!184715 () Bool)

(assert (=> d!39260 m!184715))

(assert (=> d!39260 m!184697))

(assert (=> b!121737 d!39260))

(declare-fun d!39276 () Bool)

(declare-datatypes ((tuple2!10260 0))(
  ( (tuple2!10261 (_1!5395 (_ BitVec 64)) (_2!5395 BitStream!4358)) )
))
(declare-fun lt!190972 () tuple2!10260)

(declare-fun readNLeastSignificantBitsLoop!0 (BitStream!4358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64)) tuple2!10260)

(assert (=> d!39276 (= lt!190972 (readNLeastSignificantBitsLoop!0 lt!190821 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190819))))

(assert (=> d!39276 (= (readNLeastSignificantBitsLoopPure!0 lt!190821 nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190819) (tuple2!10249 (_2!5395 lt!190972) (_1!5395 lt!190972)))))

(declare-fun bs!9501 () Bool)

(assert (= bs!9501 d!39276))

(declare-fun m!184717 () Bool)

(assert (=> bs!9501 m!184717))

(assert (=> b!121737 d!39276))

(declare-fun d!39278 () Bool)

(declare-fun e!79788 () Bool)

(assert (=> d!39278 e!79788))

(declare-fun res!100904 () Bool)

(assert (=> d!39278 (=> (not res!100904) (not e!79788))))

(declare-fun lt!190977 () BitStream!4358)

(declare-fun lt!190978 () (_ BitVec 64))

(assert (=> d!39278 (= res!100904 (= (bvadd lt!190978 (bvsub lt!190817 lt!190837)) (bitIndex!0 (size!2442 (buf!2879 lt!190977)) (currentByte!5570 lt!190977) (currentBit!5565 lt!190977))))))

(assert (=> d!39278 (or (not (= (bvand lt!190978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!190817 lt!190837) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!190978 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!190978 (bvsub lt!190817 lt!190837)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39278 (= lt!190978 (bitIndex!0 (size!2442 (buf!2879 (_2!5387 lt!190832))) (currentByte!5570 (_2!5387 lt!190832)) (currentBit!5565 (_2!5387 lt!190832))))))

(declare-fun moveBitIndex!0 (BitStream!4358 (_ BitVec 64)) tuple2!10246)

(assert (=> d!39278 (= lt!190977 (_2!5388 (moveBitIndex!0 (_2!5387 lt!190832) (bvsub lt!190817 lt!190837))))))

(declare-fun moveBitIndexPrecond!0 (BitStream!4358 (_ BitVec 64)) Bool)

(assert (=> d!39278 (moveBitIndexPrecond!0 (_2!5387 lt!190832) (bvsub lt!190817 lt!190837))))

(assert (=> d!39278 (= (withMovedBitIndex!0 (_2!5387 lt!190832) (bvsub lt!190817 lt!190837)) lt!190977)))

(declare-fun b!121801 () Bool)

(assert (=> b!121801 (= e!79788 (= (size!2442 (buf!2879 (_2!5387 lt!190832))) (size!2442 (buf!2879 lt!190977))))))

(assert (= (and d!39278 res!100904) b!121801))

(declare-fun m!184719 () Bool)

(assert (=> d!39278 m!184719))

(declare-fun m!184721 () Bool)

(assert (=> d!39278 m!184721))

(declare-fun m!184723 () Bool)

(assert (=> d!39278 m!184723))

(declare-fun m!184725 () Bool)

(assert (=> d!39278 m!184725))

(assert (=> b!121737 d!39278))

(declare-fun d!39280 () Bool)

(declare-fun e!79789 () Bool)

(assert (=> d!39280 e!79789))

(declare-fun res!100905 () Bool)

(assert (=> d!39280 (=> (not res!100905) (not e!79789))))

(declare-fun lt!190980 () (_ BitVec 64))

(declare-fun lt!190979 () BitStream!4358)

(assert (=> d!39280 (= res!100905 (= (bvadd lt!190980 #b0000000000000000000000000000000000000000000000000000000000000001) (bitIndex!0 (size!2442 (buf!2879 lt!190979)) (currentByte!5570 lt!190979) (currentBit!5565 lt!190979))))))

(assert (=> d!39280 (or (not (= (bvand lt!190980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!190980 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!190980 #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39280 (= lt!190980 (bitIndex!0 (size!2442 (buf!2879 (_1!5387 lt!190829))) (currentByte!5570 (_1!5387 lt!190829)) (currentBit!5565 (_1!5387 lt!190829))))))

(assert (=> d!39280 (= lt!190979 (_2!5388 (moveBitIndex!0 (_1!5387 lt!190829) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> d!39280 (moveBitIndexPrecond!0 (_1!5387 lt!190829) #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> d!39280 (= (withMovedBitIndex!0 (_1!5387 lt!190829) #b0000000000000000000000000000000000000000000000000000000000000001) lt!190979)))

(declare-fun b!121802 () Bool)

(assert (=> b!121802 (= e!79789 (= (size!2442 (buf!2879 (_1!5387 lt!190829))) (size!2442 (buf!2879 lt!190979))))))

(assert (= (and d!39280 res!100905) b!121802))

(declare-fun m!184727 () Bool)

(assert (=> d!39280 m!184727))

(declare-fun m!184729 () Bool)

(assert (=> d!39280 m!184729))

(declare-fun m!184731 () Bool)

(assert (=> d!39280 m!184731))

(declare-fun m!184733 () Bool)

(assert (=> d!39280 m!184733))

(assert (=> b!121737 d!39280))

(declare-fun d!39282 () Bool)

(declare-fun lt!190994 () tuple2!10248)

(declare-fun lt!190996 () tuple2!10248)

(assert (=> d!39282 (and (= (_2!5389 lt!190994) (_2!5389 lt!190996)) (= (_1!5389 lt!190994) (_1!5389 lt!190996)))))

(declare-fun lt!190995 () Unit!7499)

(declare-fun lt!190997 () (_ BitVec 64))

(declare-fun lt!190993 () BitStream!4358)

(declare-fun lt!190998 () Bool)

(declare-fun choose!45 (BitStream!4358 (_ BitVec 32) (_ BitVec 32) (_ BitVec 64) tuple2!10248 tuple2!10248 BitStream!4358 (_ BitVec 64) Bool BitStream!4358 (_ BitVec 64) tuple2!10248 tuple2!10248 BitStream!4358 (_ BitVec 64)) Unit!7499)

(assert (=> d!39282 (= lt!190995 (choose!45 (_1!5387 lt!190829) nBits!396 i!615 lt!190836 lt!190994 (tuple2!10249 (_1!5389 lt!190994) (_2!5389 lt!190994)) (_1!5389 lt!190994) (_2!5389 lt!190994) lt!190998 lt!190993 lt!190997 lt!190996 (tuple2!10249 (_1!5389 lt!190996) (_2!5389 lt!190996)) (_1!5389 lt!190996) (_2!5389 lt!190996)))))

(assert (=> d!39282 (= lt!190996 (readNLeastSignificantBitsLoopPure!0 lt!190993 nBits!396 (bvadd i!615 #b00000000000000000000000000000001) lt!190997))))

(assert (=> d!39282 (= lt!190997 (bvor lt!190836 (ite lt!190998 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) i!615))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39282 (= lt!190993 (withMovedBitIndex!0 (_1!5387 lt!190829) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!39282 (= lt!190998 (_2!5390 (readBitPure!0 (_1!5387 lt!190829))))))

(assert (=> d!39282 (= lt!190994 (readNLeastSignificantBitsLoopPure!0 (_1!5387 lt!190829) nBits!396 i!615 lt!190836))))

(assert (=> d!39282 (= (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5387 lt!190829) nBits!396 i!615 lt!190836) lt!190995)))

(declare-fun bs!9503 () Bool)

(assert (= bs!9503 d!39282))

(declare-fun m!184735 () Bool)

(assert (=> bs!9503 m!184735))

(declare-fun m!184737 () Bool)

(assert (=> bs!9503 m!184737))

(assert (=> bs!9503 m!184625))

(assert (=> bs!9503 m!184577))

(assert (=> bs!9503 m!184617))

(assert (=> b!121737 d!39282))

(declare-fun d!39284 () Bool)

(declare-fun e!79790 () Bool)

(assert (=> d!39284 e!79790))

(declare-fun res!100907 () Bool)

(assert (=> d!39284 (=> (not res!100907) (not e!79790))))

(declare-fun lt!191000 () (_ BitVec 64))

(declare-fun lt!190999 () (_ BitVec 64))

(declare-fun lt!191001 () (_ BitVec 64))

(assert (=> d!39284 (= res!100907 (= lt!190999 (bvsub lt!191000 lt!191001)))))

(assert (=> d!39284 (or (= (bvand lt!191000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191000 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191000 lt!191001) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39284 (= lt!191001 (remainingBits!0 ((_ sign_extend 32) (size!2442 (buf!2879 thiss!1305))) ((_ sign_extend 32) (currentByte!5570 thiss!1305)) ((_ sign_extend 32) (currentBit!5565 thiss!1305))))))

(declare-fun lt!191002 () (_ BitVec 64))

(declare-fun lt!191003 () (_ BitVec 64))

(assert (=> d!39284 (= lt!191000 (bvmul lt!191002 lt!191003))))

(assert (=> d!39284 (or (= lt!191002 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191003 (bvsdiv (bvmul lt!191002 lt!191003) lt!191002)))))

(assert (=> d!39284 (= lt!191003 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39284 (= lt!191002 ((_ sign_extend 32) (size!2442 (buf!2879 thiss!1305))))))

(assert (=> d!39284 (= lt!190999 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5570 thiss!1305)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5565 thiss!1305))))))

(assert (=> d!39284 (invariant!0 (currentBit!5565 thiss!1305) (currentByte!5570 thiss!1305) (size!2442 (buf!2879 thiss!1305)))))

(assert (=> d!39284 (= (bitIndex!0 (size!2442 (buf!2879 thiss!1305)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305)) lt!190999)))

(declare-fun b!121803 () Bool)

(declare-fun res!100906 () Bool)

(assert (=> b!121803 (=> (not res!100906) (not e!79790))))

(assert (=> b!121803 (= res!100906 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!190999))))

(declare-fun b!121804 () Bool)

(declare-fun lt!191004 () (_ BitVec 64))

(assert (=> b!121804 (= e!79790 (bvsle lt!190999 (bvmul lt!191004 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121804 (or (= lt!191004 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191004 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191004)))))

(assert (=> b!121804 (= lt!191004 ((_ sign_extend 32) (size!2442 (buf!2879 thiss!1305))))))

(assert (= (and d!39284 res!100907) b!121803))

(assert (= (and b!121803 res!100906) b!121804))

(assert (=> d!39284 m!184691))

(declare-fun m!184739 () Bool)

(assert (=> d!39284 m!184739))

(assert (=> b!121737 d!39284))

(declare-fun d!39286 () Bool)

(declare-fun e!79791 () Bool)

(assert (=> d!39286 e!79791))

(declare-fun res!100909 () Bool)

(assert (=> d!39286 (=> (not res!100909) (not e!79791))))

(declare-fun lt!191007 () (_ BitVec 64))

(declare-fun lt!191005 () (_ BitVec 64))

(declare-fun lt!191006 () (_ BitVec 64))

(assert (=> d!39286 (= res!100909 (= lt!191005 (bvsub lt!191006 lt!191007)))))

(assert (=> d!39286 (or (= (bvand lt!191006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191007 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191006 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191006 lt!191007) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39286 (= lt!191007 (remainingBits!0 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190818)))) ((_ sign_extend 32) (currentByte!5570 (_2!5388 lt!190818))) ((_ sign_extend 32) (currentBit!5565 (_2!5388 lt!190818)))))))

(declare-fun lt!191008 () (_ BitVec 64))

(declare-fun lt!191009 () (_ BitVec 64))

(assert (=> d!39286 (= lt!191006 (bvmul lt!191008 lt!191009))))

(assert (=> d!39286 (or (= lt!191008 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191009 (bvsdiv (bvmul lt!191008 lt!191009) lt!191008)))))

(assert (=> d!39286 (= lt!191009 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39286 (= lt!191008 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190818)))))))

(assert (=> d!39286 (= lt!191005 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5570 (_2!5388 lt!190818))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5565 (_2!5388 lt!190818)))))))

(assert (=> d!39286 (invariant!0 (currentBit!5565 (_2!5388 lt!190818)) (currentByte!5570 (_2!5388 lt!190818)) (size!2442 (buf!2879 (_2!5388 lt!190818))))))

(assert (=> d!39286 (= (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190818))) (currentByte!5570 (_2!5388 lt!190818)) (currentBit!5565 (_2!5388 lt!190818))) lt!191005)))

(declare-fun b!121805 () Bool)

(declare-fun res!100908 () Bool)

(assert (=> b!121805 (=> (not res!100908) (not e!79791))))

(assert (=> b!121805 (= res!100908 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!191005))))

(declare-fun b!121806 () Bool)

(declare-fun lt!191010 () (_ BitVec 64))

(assert (=> b!121806 (= e!79791 (bvsle lt!191005 (bvmul lt!191010 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121806 (or (= lt!191010 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191010 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191010)))))

(assert (=> b!121806 (= lt!191010 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190818)))))))

(assert (= (and d!39286 res!100909) b!121805))

(assert (= (and b!121805 res!100908) b!121806))

(declare-fun m!184741 () Bool)

(assert (=> d!39286 m!184741))

(declare-fun m!184743 () Bool)

(assert (=> d!39286 m!184743))

(assert (=> b!121737 d!39286))

(declare-fun d!39288 () Bool)

(declare-fun e!79792 () Bool)

(assert (=> d!39288 e!79792))

(declare-fun res!100910 () Bool)

(assert (=> d!39288 (=> (not res!100910) (not e!79792))))

(declare-fun lt!191011 () BitStream!4358)

(declare-fun lt!191012 () (_ BitVec 64))

(assert (=> d!39288 (= res!100910 (= (bvadd lt!191012 (bvsub lt!190820 lt!190837)) (bitIndex!0 (size!2442 (buf!2879 lt!191011)) (currentByte!5570 lt!191011) (currentBit!5565 lt!191011))))))

(assert (=> d!39288 (or (not (= (bvand lt!191012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!190820 lt!190837) #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!191012 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!191012 (bvsub lt!190820 lt!190837)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39288 (= lt!191012 (bitIndex!0 (size!2442 (buf!2879 (_2!5387 lt!190829))) (currentByte!5570 (_2!5387 lt!190829)) (currentBit!5565 (_2!5387 lt!190829))))))

(assert (=> d!39288 (= lt!191011 (_2!5388 (moveBitIndex!0 (_2!5387 lt!190829) (bvsub lt!190820 lt!190837))))))

(assert (=> d!39288 (moveBitIndexPrecond!0 (_2!5387 lt!190829) (bvsub lt!190820 lt!190837))))

(assert (=> d!39288 (= (withMovedBitIndex!0 (_2!5387 lt!190829) (bvsub lt!190820 lt!190837)) lt!191011)))

(declare-fun b!121807 () Bool)

(assert (=> b!121807 (= e!79792 (= (size!2442 (buf!2879 (_2!5387 lt!190829))) (size!2442 (buf!2879 lt!191011))))))

(assert (= (and d!39288 res!100910) b!121807))

(declare-fun m!184745 () Bool)

(assert (=> d!39288 m!184745))

(declare-fun m!184747 () Bool)

(assert (=> d!39288 m!184747))

(declare-fun m!184749 () Bool)

(assert (=> d!39288 m!184749))

(declare-fun m!184751 () Bool)

(assert (=> d!39288 m!184751))

(assert (=> b!121737 d!39288))

(assert (=> b!121749 d!39260))

(assert (=> b!121749 d!39284))

(declare-fun d!39290 () Bool)

(declare-fun e!79793 () Bool)

(assert (=> d!39290 e!79793))

(declare-fun res!100912 () Bool)

(assert (=> d!39290 (=> (not res!100912) (not e!79793))))

(declare-fun lt!191014 () (_ BitVec 64))

(declare-fun lt!191013 () (_ BitVec 64))

(declare-fun lt!191015 () (_ BitVec 64))

(assert (=> d!39290 (= res!100912 (= lt!191013 (bvsub lt!191014 lt!191015)))))

(assert (=> d!39290 (or (= (bvand lt!191014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191015 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191014 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191014 lt!191015) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39290 (= lt!191015 (remainingBits!0 ((_ sign_extend 32) (size!2442 (buf!2879 (_1!5390 lt!190835)))) ((_ sign_extend 32) (currentByte!5570 (_1!5390 lt!190835))) ((_ sign_extend 32) (currentBit!5565 (_1!5390 lt!190835)))))))

(declare-fun lt!191016 () (_ BitVec 64))

(declare-fun lt!191017 () (_ BitVec 64))

(assert (=> d!39290 (= lt!191014 (bvmul lt!191016 lt!191017))))

(assert (=> d!39290 (or (= lt!191016 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191017 (bvsdiv (bvmul lt!191016 lt!191017) lt!191016)))))

(assert (=> d!39290 (= lt!191017 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39290 (= lt!191016 ((_ sign_extend 32) (size!2442 (buf!2879 (_1!5390 lt!190835)))))))

(assert (=> d!39290 (= lt!191013 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5570 (_1!5390 lt!190835))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5565 (_1!5390 lt!190835)))))))

(assert (=> d!39290 (invariant!0 (currentBit!5565 (_1!5390 lt!190835)) (currentByte!5570 (_1!5390 lt!190835)) (size!2442 (buf!2879 (_1!5390 lt!190835))))))

(assert (=> d!39290 (= (bitIndex!0 (size!2442 (buf!2879 (_1!5390 lt!190835))) (currentByte!5570 (_1!5390 lt!190835)) (currentBit!5565 (_1!5390 lt!190835))) lt!191013)))

(declare-fun b!121808 () Bool)

(declare-fun res!100911 () Bool)

(assert (=> b!121808 (=> (not res!100911) (not e!79793))))

(assert (=> b!121808 (= res!100911 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!191013))))

(declare-fun b!121809 () Bool)

(declare-fun lt!191018 () (_ BitVec 64))

(assert (=> b!121809 (= e!79793 (bvsle lt!191013 (bvmul lt!191018 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!121809 (or (= lt!191018 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191018 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191018)))))

(assert (=> b!121809 (= lt!191018 ((_ sign_extend 32) (size!2442 (buf!2879 (_1!5390 lt!190835)))))))

(assert (= (and d!39290 res!100912) b!121808))

(assert (= (and b!121808 res!100911) b!121809))

(declare-fun m!184753 () Bool)

(assert (=> d!39290 m!184753))

(declare-fun m!184755 () Bool)

(assert (=> d!39290 m!184755))

(assert (=> b!121738 d!39290))

(declare-fun d!39292 () Bool)

(assert (=> d!39292 (= (invariant!0 (currentBit!5565 thiss!1305) (currentByte!5570 thiss!1305) (size!2442 (buf!2879 (_2!5388 lt!190841)))) (and (bvsge (currentBit!5565 thiss!1305) #b00000000000000000000000000000000) (bvslt (currentBit!5565 thiss!1305) #b00000000000000000000000000001000) (bvsge (currentByte!5570 thiss!1305) #b00000000000000000000000000000000) (or (bvslt (currentByte!5570 thiss!1305) (size!2442 (buf!2879 (_2!5388 lt!190841)))) (and (= (currentBit!5565 thiss!1305) #b00000000000000000000000000000000) (= (currentByte!5570 thiss!1305) (size!2442 (buf!2879 (_2!5388 lt!190841))))))))))

(assert (=> b!121750 d!39292))

(declare-fun d!39294 () Bool)

(assert (=> d!39294 (= (onesLSBLong!0 (bvsub nBits!396 i!615)) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 (bvsub nBits!396 i!615)))))))

(assert (=> b!121739 d!39294))

(declare-fun d!39296 () Bool)

(assert (=> d!39296 (validate_offset_bits!1 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190818)))) ((_ sign_extend 32) (currentByte!5570 (_2!5388 lt!190841))) ((_ sign_extend 32) (currentBit!5565 (_2!5388 lt!190841))) lt!190845)))

(declare-fun lt!191021 () Unit!7499)

(declare-fun choose!9 (BitStream!4358 array!5397 (_ BitVec 64) BitStream!4358) Unit!7499)

(assert (=> d!39296 (= lt!191021 (choose!9 (_2!5388 lt!190841) (buf!2879 (_2!5388 lt!190818)) lt!190845 (BitStream!4359 (buf!2879 (_2!5388 lt!190818)) (currentByte!5570 (_2!5388 lt!190841)) (currentBit!5565 (_2!5388 lt!190841)))))))

(assert (=> d!39296 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5388 lt!190841) (buf!2879 (_2!5388 lt!190818)) lt!190845) lt!191021)))

(declare-fun bs!9504 () Bool)

(assert (= bs!9504 d!39296))

(assert (=> bs!9504 m!184633))

(declare-fun m!184757 () Bool)

(assert (=> bs!9504 m!184757))

(assert (=> b!121739 d!39296))

(declare-fun d!39298 () Bool)

(assert (=> d!39298 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190818)))) ((_ sign_extend 32) (currentByte!5570 thiss!1305)) ((_ sign_extend 32) (currentBit!5565 thiss!1305)) lt!190838) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190818)))) ((_ sign_extend 32) (currentByte!5570 thiss!1305)) ((_ sign_extend 32) (currentBit!5565 thiss!1305))) lt!190838))))

(declare-fun bs!9505 () Bool)

(assert (= bs!9505 d!39298))

(declare-fun m!184759 () Bool)

(assert (=> bs!9505 m!184759))

(assert (=> b!121739 d!39298))

(declare-fun d!39300 () Bool)

(assert (=> d!39300 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190818)))) ((_ sign_extend 32) (currentByte!5570 (_2!5388 lt!190841))) ((_ sign_extend 32) (currentBit!5565 (_2!5388 lt!190841))) lt!190845) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190818)))) ((_ sign_extend 32) (currentByte!5570 (_2!5388 lt!190841))) ((_ sign_extend 32) (currentBit!5565 (_2!5388 lt!190841)))) lt!190845))))

(declare-fun bs!9506 () Bool)

(assert (= bs!9506 d!39300))

(declare-fun m!184761 () Bool)

(assert (=> bs!9506 m!184761))

(assert (=> b!121739 d!39300))

(declare-fun b!122005 () Bool)

(declare-fun e!79901 () tuple2!10246)

(declare-fun lt!191636 () Unit!7499)

(assert (=> b!122005 (= e!79901 (tuple2!10247 lt!191636 (_2!5388 lt!190841)))))

(declare-fun lt!191645 () BitStream!4358)

(assert (=> b!122005 (= lt!191645 (_2!5388 lt!190841))))

(declare-fun lemmaIsPrefixRefl!0 (BitStream!4358) Unit!7499)

(assert (=> b!122005 (= lt!191636 (lemmaIsPrefixRefl!0 lt!191645))))

(declare-fun call!1598 () Bool)

(assert (=> b!122005 call!1598))

(declare-fun b!122006 () Bool)

(declare-fun e!79907 () Bool)

(declare-fun lt!191608 () (_ BitVec 64))

(assert (=> b!122006 (= e!79907 (validate_offset_bits!1 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190841)))) ((_ sign_extend 32) (currentByte!5570 (_2!5388 lt!190841))) ((_ sign_extend 32) (currentBit!5565 (_2!5388 lt!190841))) lt!191608))))

(declare-fun bm!1595 () Bool)

(declare-fun lt!191623 () tuple2!10246)

(declare-fun c!7325 () Bool)

(assert (=> bm!1595 (= call!1598 (isPrefixOf!0 (ite c!7325 (_2!5388 lt!190841) lt!191645) (ite c!7325 (_2!5388 lt!191623) lt!191645)))))

(declare-fun b!122008 () Bool)

(declare-fun res!101070 () Bool)

(assert (=> b!122008 (= res!101070 call!1598)))

(declare-fun e!79903 () Bool)

(assert (=> b!122008 (=> (not res!101070) (not e!79903))))

(declare-fun b!122009 () Bool)

(declare-fun e!79904 () Bool)

(declare-fun lt!191635 () tuple2!10250)

(assert (=> b!122009 (= e!79904 (= (bitIndex!0 (size!2442 (buf!2879 (_1!5390 lt!191635))) (currentByte!5570 (_1!5390 lt!191635)) (currentBit!5565 (_1!5390 lt!191635))) (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!191623))) (currentByte!5570 (_2!5388 lt!191623)) (currentBit!5565 (_2!5388 lt!191623)))))))

(declare-fun b!122010 () Bool)

(declare-fun e!79905 () Bool)

(declare-fun lt!191610 () tuple2!10250)

(declare-fun lt!191609 () tuple2!10250)

(assert (=> b!122010 (= e!79905 (= (_2!5390 lt!191610) (_2!5390 lt!191609)))))

(declare-fun b!122011 () Bool)

(assert (=> b!122011 (= lt!191635 (readBitPure!0 (readerFrom!0 (_2!5388 lt!191623) (currentBit!5565 (_2!5388 lt!190841)) (currentByte!5570 (_2!5388 lt!190841)))))))

(declare-fun lt!191630 () Bool)

(declare-fun res!101066 () Bool)

(assert (=> b!122011 (= res!101066 (and (= (_2!5390 lt!191635) lt!191630) (= (_1!5390 lt!191635) (_2!5388 lt!191623))))))

(assert (=> b!122011 (=> (not res!101066) (not e!79904))))

(assert (=> b!122011 (= e!79903 e!79904)))

(declare-fun b!122012 () Bool)

(declare-fun res!101067 () Bool)

(declare-fun e!79906 () Bool)

(assert (=> b!122012 (=> (not res!101067) (not e!79906))))

(declare-fun lt!191639 () tuple2!10246)

(declare-fun lt!191628 () (_ BitVec 64))

(declare-fun lt!191622 () (_ BitVec 64))

(assert (=> b!122012 (= res!101067 (= (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!191639))) (currentByte!5570 (_2!5388 lt!191639)) (currentBit!5565 (_2!5388 lt!191639))) (bvadd lt!191622 lt!191628)))))

(assert (=> b!122012 (or (not (= (bvand lt!191622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191628 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!191622 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!191622 lt!191628) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122012 (= lt!191628 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!122012 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!122012 (= lt!191622 (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190841))) (currentByte!5570 (_2!5388 lt!190841)) (currentBit!5565 (_2!5388 lt!190841))))))

(declare-fun lt!191619 () tuple2!10244)

(declare-fun lt!191615 () tuple2!10248)

(declare-fun b!122013 () Bool)

(assert (=> b!122013 (= e!79906 (and (= (_2!5389 lt!191615) v!199) (= (_1!5389 lt!191615) (_2!5387 lt!191619))))))

(declare-fun lt!191648 () (_ BitVec 64))

(assert (=> b!122013 (= lt!191615 (readNLeastSignificantBitsLoopPure!0 (_1!5387 lt!191619) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191648))))

(declare-fun lt!191644 () Unit!7499)

(declare-fun lt!191606 () Unit!7499)

(assert (=> b!122013 (= lt!191644 lt!191606)))

(assert (=> b!122013 (validate_offset_bits!1 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!191639)))) ((_ sign_extend 32) (currentByte!5570 (_2!5388 lt!190841))) ((_ sign_extend 32) (currentBit!5565 (_2!5388 lt!190841))) lt!191608)))

(assert (=> b!122013 (= lt!191606 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5388 lt!190841) (buf!2879 (_2!5388 lt!191639)) lt!191608))))

(assert (=> b!122013 e!79907))

(declare-fun res!101073 () Bool)

(assert (=> b!122013 (=> (not res!101073) (not e!79907))))

(assert (=> b!122013 (= res!101073 (and (= (size!2442 (buf!2879 (_2!5388 lt!190841))) (size!2442 (buf!2879 (_2!5388 lt!191639)))) (bvsge lt!191608 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122013 (= lt!191608 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(assert (=> b!122013 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!122013 (= lt!191648 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(assert (=> b!122013 (or (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvadd #b00000000000000000000000000000001 i!615) #b10000000000000000000000000000000)) (= (bvand nBits!396 #b10000000000000000000000000000000) (bvand (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b10000000000000000000000000000000)))))

(assert (=> b!122013 (= lt!191619 (reader!0 (_2!5388 lt!190841) (_2!5388 lt!191639)))))

(declare-fun b!122014 () Bool)

(declare-fun res!101071 () Bool)

(assert (=> b!122014 (= res!101071 (= (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!191623))) (currentByte!5570 (_2!5388 lt!191623)) (currentBit!5565 (_2!5388 lt!191623))) (bvadd (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190841))) (currentByte!5570 (_2!5388 lt!190841)) (currentBit!5565 (_2!5388 lt!190841))) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!122014 (=> (not res!101071) (not e!79903))))

(declare-fun b!122015 () Bool)

(declare-fun e!79902 () (_ BitVec 64))

(assert (=> b!122015 (= e!79902 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun b!122007 () Bool)

(declare-fun lt!191618 () tuple2!10246)

(declare-fun Unit!7517 () Unit!7499)

(assert (=> b!122007 (= e!79901 (tuple2!10247 Unit!7517 (_2!5388 lt!191618)))))

(assert (=> b!122007 (= lt!191630 (not (= (bvand v!199 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615))))) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122007 (= lt!191623 (appendBit!0 (_2!5388 lt!190841) lt!191630))))

(declare-fun res!101069 () Bool)

(assert (=> b!122007 (= res!101069 (= (size!2442 (buf!2879 (_2!5388 lt!190841))) (size!2442 (buf!2879 (_2!5388 lt!191623)))))))

(assert (=> b!122007 (=> (not res!101069) (not e!79903))))

(assert (=> b!122007 e!79903))

(declare-fun lt!191627 () tuple2!10246)

(assert (=> b!122007 (= lt!191627 lt!191623)))

(assert (=> b!122007 (= lt!191618 (appendNLeastSignificantBitsLoop!0 (_2!5388 lt!191627) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001)))))

(declare-fun lt!191612 () Unit!7499)

(assert (=> b!122007 (= lt!191612 (lemmaIsPrefixTransitive!0 (_2!5388 lt!190841) (_2!5388 lt!191627) (_2!5388 lt!191618)))))

(assert (=> b!122007 (isPrefixOf!0 (_2!5388 lt!190841) (_2!5388 lt!191618))))

(declare-fun lt!191646 () Unit!7499)

(assert (=> b!122007 (= lt!191646 lt!191612)))

(assert (=> b!122007 (invariant!0 (currentBit!5565 (_2!5388 lt!190841)) (currentByte!5570 (_2!5388 lt!190841)) (size!2442 (buf!2879 (_2!5388 lt!191627))))))

(declare-fun lt!191633 () BitStream!4358)

(assert (=> b!122007 (= lt!191633 (BitStream!4359 (buf!2879 (_2!5388 lt!191627)) (currentByte!5570 (_2!5388 lt!190841)) (currentBit!5565 (_2!5388 lt!190841))))))

(assert (=> b!122007 (invariant!0 (currentBit!5565 lt!191633) (currentByte!5570 lt!191633) (size!2442 (buf!2879 (_2!5388 lt!191618))))))

(declare-fun lt!191616 () BitStream!4358)

(assert (=> b!122007 (= lt!191616 (BitStream!4359 (buf!2879 (_2!5388 lt!191618)) (currentByte!5570 lt!191633) (currentBit!5565 lt!191633)))))

(assert (=> b!122007 (= lt!191610 (readBitPure!0 lt!191633))))

(assert (=> b!122007 (= lt!191609 (readBitPure!0 lt!191616))))

(declare-fun lt!191641 () Unit!7499)

(assert (=> b!122007 (= lt!191641 (readBitPrefixLemma!0 lt!191633 (_2!5388 lt!191618)))))

(declare-fun res!101072 () Bool)

(assert (=> b!122007 (= res!101072 (= (bitIndex!0 (size!2442 (buf!2879 (_1!5390 lt!191610))) (currentByte!5570 (_1!5390 lt!191610)) (currentBit!5565 (_1!5390 lt!191610))) (bitIndex!0 (size!2442 (buf!2879 (_1!5390 lt!191609))) (currentByte!5570 (_1!5390 lt!191609)) (currentBit!5565 (_1!5390 lt!191609)))))))

(assert (=> b!122007 (=> (not res!101072) (not e!79905))))

(assert (=> b!122007 e!79905))

(declare-fun lt!191640 () Unit!7499)

(assert (=> b!122007 (= lt!191640 lt!191641)))

(declare-fun lt!191617 () tuple2!10244)

(assert (=> b!122007 (= lt!191617 (reader!0 (_2!5388 lt!190841) (_2!5388 lt!191618)))))

(declare-fun lt!191614 () tuple2!10244)

(assert (=> b!122007 (= lt!191614 (reader!0 (_2!5388 lt!191627) (_2!5388 lt!191618)))))

(declare-fun lt!191629 () tuple2!10250)

(assert (=> b!122007 (= lt!191629 (readBitPure!0 (_1!5387 lt!191617)))))

(assert (=> b!122007 (= (_2!5390 lt!191629) lt!191630)))

(declare-fun lt!191611 () Unit!7499)

(declare-fun Unit!7518 () Unit!7499)

(assert (=> b!122007 (= lt!191611 Unit!7518)))

(declare-fun lt!191632 () (_ BitVec 64))

(assert (=> b!122007 (= lt!191632 (bvand v!199 (bvnot (onesLSBLong!0 (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))))

(declare-fun lt!191649 () (_ BitVec 64))

(assert (=> b!122007 (= lt!191649 ((_ sign_extend 32) (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615))))))

(declare-fun lt!191621 () Unit!7499)

(assert (=> b!122007 (= lt!191621 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5388 lt!190841) (buf!2879 (_2!5388 lt!191618)) lt!191649))))

(assert (=> b!122007 (validate_offset_bits!1 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!191618)))) ((_ sign_extend 32) (currentByte!5570 (_2!5388 lt!190841))) ((_ sign_extend 32) (currentBit!5565 (_2!5388 lt!190841))) lt!191649)))

(declare-fun lt!191642 () Unit!7499)

(assert (=> b!122007 (= lt!191642 lt!191621)))

(declare-fun lt!191626 () tuple2!10248)

(assert (=> b!122007 (= lt!191626 (readNLeastSignificantBitsLoopPure!0 (_1!5387 lt!191617) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191632))))

(declare-fun lt!191634 () (_ BitVec 64))

(assert (=> b!122007 (= lt!191634 ((_ sign_extend 32) (bvsub (bvsub nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) #b00000000000000000000000000000001)))))

(declare-fun lt!191625 () Unit!7499)

(assert (=> b!122007 (= lt!191625 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!5388 lt!191627) (buf!2879 (_2!5388 lt!191618)) lt!191634))))

(assert (=> b!122007 (validate_offset_bits!1 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!191618)))) ((_ sign_extend 32) (currentByte!5570 (_2!5388 lt!191627))) ((_ sign_extend 32) (currentBit!5565 (_2!5388 lt!191627))) lt!191634)))

(declare-fun lt!191620 () Unit!7499)

(assert (=> b!122007 (= lt!191620 lt!191625)))

(declare-fun lt!191631 () tuple2!10248)

(assert (=> b!122007 (= lt!191631 (readNLeastSignificantBitsLoopPure!0 (_1!5387 lt!191614) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!191632 (ite (_2!5390 lt!191629) (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))) #b0000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!191647 () tuple2!10248)

(assert (=> b!122007 (= lt!191647 (readNLeastSignificantBitsLoopPure!0 (_1!5387 lt!191617) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191632))))

(declare-fun c!7326 () Bool)

(assert (=> b!122007 (= c!7326 (_2!5390 (readBitPure!0 (_1!5387 lt!191617))))))

(declare-fun lt!191624 () tuple2!10248)

(assert (=> b!122007 (= lt!191624 (readNLeastSignificantBitsLoopPure!0 (withMovedBitIndex!0 (_1!5387 lt!191617) #b0000000000000000000000000000000000000000000000000000000000000001) nBits!396 (bvadd #b00000000000000000000000000000001 i!615 #b00000000000000000000000000000001) (bvor lt!191632 e!79902)))))

(declare-fun lt!191607 () Unit!7499)

(assert (=> b!122007 (= lt!191607 (readNLeastSignificantBitsLoopPrefixLemma!0 (_1!5387 lt!191617) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!191632))))

(assert (=> b!122007 (and (= (_2!5389 lt!191647) (_2!5389 lt!191624)) (= (_1!5389 lt!191647) (_1!5389 lt!191624)))))

(declare-fun lt!191638 () Unit!7499)

(assert (=> b!122007 (= lt!191638 lt!191607)))

(assert (=> b!122007 (= (_1!5387 lt!191617) (withMovedBitIndex!0 (_2!5387 lt!191617) (bvsub (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190841))) (currentByte!5570 (_2!5388 lt!190841)) (currentBit!5565 (_2!5388 lt!190841))) (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!191618))) (currentByte!5570 (_2!5388 lt!191618)) (currentBit!5565 (_2!5388 lt!191618))))))))

(declare-fun lt!191605 () Unit!7499)

(declare-fun Unit!7519 () Unit!7499)

(assert (=> b!122007 (= lt!191605 Unit!7519)))

(assert (=> b!122007 (= (_1!5387 lt!191614) (withMovedBitIndex!0 (_2!5387 lt!191614) (bvsub (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!191627))) (currentByte!5570 (_2!5388 lt!191627)) (currentBit!5565 (_2!5388 lt!191627))) (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!191618))) (currentByte!5570 (_2!5388 lt!191618)) (currentBit!5565 (_2!5388 lt!191618))))))))

(declare-fun lt!191637 () Unit!7499)

(declare-fun Unit!7520 () Unit!7499)

(assert (=> b!122007 (= lt!191637 Unit!7520)))

(assert (=> b!122007 (= (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190841))) (currentByte!5570 (_2!5388 lt!190841)) (currentBit!5565 (_2!5388 lt!190841))) (bvsub (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!191627))) (currentByte!5570 (_2!5388 lt!191627)) (currentBit!5565 (_2!5388 lt!191627))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!191613 () Unit!7499)

(declare-fun Unit!7521 () Unit!7499)

(assert (=> b!122007 (= lt!191613 Unit!7521)))

(assert (=> b!122007 (= (_2!5389 lt!191626) (_2!5389 lt!191631))))

(declare-fun lt!191643 () Unit!7499)

(declare-fun Unit!7522 () Unit!7499)

(assert (=> b!122007 (= lt!191643 Unit!7522)))

(assert (=> b!122007 (= (_1!5389 lt!191626) (_2!5387 lt!191617))))

(declare-fun d!39302 () Bool)

(assert (=> d!39302 e!79906))

(declare-fun res!101065 () Bool)

(assert (=> d!39302 (=> (not res!101065) (not e!79906))))

(assert (=> d!39302 (= res!101065 (= (size!2442 (buf!2879 (_2!5388 lt!190841))) (size!2442 (buf!2879 (_2!5388 lt!191639)))))))

(assert (=> d!39302 (= lt!191639 e!79901)))

(assert (=> d!39302 (= c!7325 (bvslt (bvadd #b00000000000000000000000000000001 i!615) nBits!396))))

(assert (=> d!39302 (and (bvsle #b00000000000000000000000000000000 (bvadd #b00000000000000000000000000000001 i!615)) (bvsle (bvadd #b00000000000000000000000000000001 i!615) nBits!396) (bvsle nBits!396 #b00000000000000000000000001000000))))

(assert (=> d!39302 (= (appendNLeastSignificantBitsLoop!0 (_2!5388 lt!190841) v!199 nBits!396 (bvadd #b00000000000000000000000000000001 i!615)) lt!191639)))

(declare-fun b!122016 () Bool)

(declare-fun res!101068 () Bool)

(assert (=> b!122016 (=> (not res!101068) (not e!79906))))

(assert (=> b!122016 (= res!101068 (isPrefixOf!0 (_2!5388 lt!190841) (_2!5388 lt!191639)))))

(declare-fun b!122017 () Bool)

(assert (=> b!122017 (= e!79902 (bvshl #b0000000000000000000000000000000000000000000000000000000000000001 ((_ sign_extend 32) (bvsub (bvsub nBits!396 #b00000000000000000000000000000001) (bvadd #b00000000000000000000000000000001 i!615)))))))

(assert (= (and d!39302 c!7325) b!122007))

(assert (= (and d!39302 (not c!7325)) b!122005))

(assert (= (and b!122007 res!101069) b!122014))

(assert (= (and b!122014 res!101071) b!122008))

(assert (= (and b!122008 res!101070) b!122011))

(assert (= (and b!122011 res!101066) b!122009))

(assert (= (and b!122007 res!101072) b!122010))

(assert (= (and b!122007 c!7326) b!122017))

(assert (= (and b!122007 (not c!7326)) b!122015))

(assert (= (or b!122008 b!122005) bm!1595))

(assert (= (and d!39302 res!101065) b!122012))

(assert (= (and b!122012 res!101067) b!122016))

(assert (= (and b!122016 res!101068) b!122013))

(assert (= (and b!122013 res!101073) b!122006))

(declare-fun m!185127 () Bool)

(assert (=> b!122009 m!185127))

(declare-fun m!185131 () Bool)

(assert (=> b!122009 m!185131))

(declare-fun m!185135 () Bool)

(assert (=> b!122006 m!185135))

(declare-fun m!185139 () Bool)

(assert (=> bm!1595 m!185139))

(declare-fun m!185143 () Bool)

(assert (=> b!122011 m!185143))

(assert (=> b!122011 m!185143))

(declare-fun m!185147 () Bool)

(assert (=> b!122011 m!185147))

(declare-fun m!185149 () Bool)

(assert (=> b!122013 m!185149))

(declare-fun m!185151 () Bool)

(assert (=> b!122013 m!185151))

(declare-fun m!185153 () Bool)

(assert (=> b!122013 m!185153))

(declare-fun m!185155 () Bool)

(assert (=> b!122013 m!185155))

(declare-fun m!185157 () Bool)

(assert (=> b!122013 m!185157))

(declare-fun m!185159 () Bool)

(assert (=> b!122012 m!185159))

(assert (=> b!122012 m!184581))

(declare-fun m!185161 () Bool)

(assert (=> b!122016 m!185161))

(assert (=> b!122014 m!185131))

(assert (=> b!122014 m!184581))

(declare-fun m!185163 () Bool)

(assert (=> b!122005 m!185163))

(declare-fun m!185165 () Bool)

(assert (=> b!122007 m!185165))

(declare-fun m!185167 () Bool)

(assert (=> b!122007 m!185167))

(declare-fun m!185169 () Bool)

(assert (=> b!122007 m!185169))

(assert (=> b!122007 m!184581))

(assert (=> b!122007 m!185151))

(declare-fun m!185171 () Bool)

(assert (=> b!122007 m!185171))

(declare-fun m!185173 () Bool)

(assert (=> b!122007 m!185173))

(declare-fun m!185175 () Bool)

(assert (=> b!122007 m!185175))

(declare-fun m!185177 () Bool)

(assert (=> b!122007 m!185177))

(declare-fun m!185179 () Bool)

(assert (=> b!122007 m!185179))

(declare-fun m!185181 () Bool)

(assert (=> b!122007 m!185181))

(declare-fun m!185183 () Bool)

(assert (=> b!122007 m!185183))

(declare-fun m!185185 () Bool)

(assert (=> b!122007 m!185185))

(declare-fun m!185187 () Bool)

(assert (=> b!122007 m!185187))

(declare-fun m!185189 () Bool)

(assert (=> b!122007 m!185189))

(declare-fun m!185191 () Bool)

(assert (=> b!122007 m!185191))

(declare-fun m!185193 () Bool)

(assert (=> b!122007 m!185193))

(declare-fun m!185195 () Bool)

(assert (=> b!122007 m!185195))

(declare-fun m!185197 () Bool)

(assert (=> b!122007 m!185197))

(declare-fun m!185199 () Bool)

(assert (=> b!122007 m!185199))

(declare-fun m!185201 () Bool)

(assert (=> b!122007 m!185201))

(declare-fun m!185203 () Bool)

(assert (=> b!122007 m!185203))

(declare-fun m!185205 () Bool)

(assert (=> b!122007 m!185205))

(assert (=> b!122007 m!185187))

(declare-fun m!185207 () Bool)

(assert (=> b!122007 m!185207))

(declare-fun m!185209 () Bool)

(assert (=> b!122007 m!185209))

(declare-fun m!185211 () Bool)

(assert (=> b!122007 m!185211))

(declare-fun m!185213 () Bool)

(assert (=> b!122007 m!185213))

(declare-fun m!185215 () Bool)

(assert (=> b!122007 m!185215))

(declare-fun m!185217 () Bool)

(assert (=> b!122007 m!185217))

(assert (=> b!121739 d!39302))

(declare-fun d!39384 () Bool)

(declare-fun lt!191654 () tuple2!10258)

(assert (=> d!39384 (= lt!191654 (readBit!0 (BitStream!4359 (buf!2879 (_2!5388 lt!190818)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305))))))

(assert (=> d!39384 (= (readBitPure!0 (BitStream!4359 (buf!2879 (_2!5388 lt!190818)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305))) (tuple2!10251 (_2!5394 lt!191654) (_1!5394 lt!191654)))))

(declare-fun bs!9526 () Bool)

(assert (= bs!9526 d!39384))

(declare-fun m!185219 () Bool)

(assert (=> bs!9526 m!185219))

(assert (=> b!121739 d!39384))

(declare-fun b!122051 () Bool)

(declare-fun res!101104 () Bool)

(declare-fun e!79928 () Bool)

(assert (=> b!122051 (=> (not res!101104) (not e!79928))))

(declare-fun lt!191753 () tuple2!10244)

(assert (=> b!122051 (= res!101104 (isPrefixOf!0 (_2!5387 lt!191753) (_2!5388 lt!190818)))))

(declare-fun b!122052 () Bool)

(declare-fun e!79929 () Unit!7499)

(declare-fun lt!191759 () Unit!7499)

(assert (=> b!122052 (= e!79929 lt!191759)))

(declare-fun lt!191744 () (_ BitVec 64))

(assert (=> b!122052 (= lt!191744 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!191762 () (_ BitVec 64))

(assert (=> b!122052 (= lt!191762 (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190841))) (currentByte!5570 (_2!5388 lt!190841)) (currentBit!5565 (_2!5388 lt!190841))))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!5397 array!5397 (_ BitVec 64) (_ BitVec 64)) Unit!7499)

(assert (=> b!122052 (= lt!191759 (arrayBitRangesEqSymmetric!0 (buf!2879 (_2!5388 lt!190841)) (buf!2879 (_2!5388 lt!190818)) lt!191744 lt!191762))))

(assert (=> b!122052 (arrayBitRangesEq!0 (buf!2879 (_2!5388 lt!190818)) (buf!2879 (_2!5388 lt!190841)) lt!191744 lt!191762)))

(declare-fun d!39386 () Bool)

(assert (=> d!39386 e!79928))

(declare-fun res!101103 () Bool)

(assert (=> d!39386 (=> (not res!101103) (not e!79928))))

(assert (=> d!39386 (= res!101103 (isPrefixOf!0 (_1!5387 lt!191753) (_2!5387 lt!191753)))))

(declare-fun lt!191747 () BitStream!4358)

(assert (=> d!39386 (= lt!191753 (tuple2!10245 lt!191747 (_2!5388 lt!190818)))))

(declare-fun lt!191752 () Unit!7499)

(declare-fun lt!191761 () Unit!7499)

(assert (=> d!39386 (= lt!191752 lt!191761)))

(assert (=> d!39386 (isPrefixOf!0 lt!191747 (_2!5388 lt!190818))))

(assert (=> d!39386 (= lt!191761 (lemmaIsPrefixTransitive!0 lt!191747 (_2!5388 lt!190818) (_2!5388 lt!190818)))))

(declare-fun lt!191757 () Unit!7499)

(declare-fun lt!191745 () Unit!7499)

(assert (=> d!39386 (= lt!191757 lt!191745)))

(assert (=> d!39386 (isPrefixOf!0 lt!191747 (_2!5388 lt!190818))))

(assert (=> d!39386 (= lt!191745 (lemmaIsPrefixTransitive!0 lt!191747 (_2!5388 lt!190841) (_2!5388 lt!190818)))))

(declare-fun lt!191751 () Unit!7499)

(assert (=> d!39386 (= lt!191751 e!79929)))

(declare-fun c!7329 () Bool)

(assert (=> d!39386 (= c!7329 (not (= (size!2442 (buf!2879 (_2!5388 lt!190841))) #b00000000000000000000000000000000)))))

(declare-fun lt!191754 () Unit!7499)

(declare-fun lt!191749 () Unit!7499)

(assert (=> d!39386 (= lt!191754 lt!191749)))

(assert (=> d!39386 (isPrefixOf!0 (_2!5388 lt!190818) (_2!5388 lt!190818))))

(assert (=> d!39386 (= lt!191749 (lemmaIsPrefixRefl!0 (_2!5388 lt!190818)))))

(declare-fun lt!191756 () Unit!7499)

(declare-fun lt!191748 () Unit!7499)

(assert (=> d!39386 (= lt!191756 lt!191748)))

(assert (=> d!39386 (= lt!191748 (lemmaIsPrefixRefl!0 (_2!5388 lt!190818)))))

(declare-fun lt!191750 () Unit!7499)

(declare-fun lt!191755 () Unit!7499)

(assert (=> d!39386 (= lt!191750 lt!191755)))

(assert (=> d!39386 (isPrefixOf!0 lt!191747 lt!191747)))

(assert (=> d!39386 (= lt!191755 (lemmaIsPrefixRefl!0 lt!191747))))

(declare-fun lt!191743 () Unit!7499)

(declare-fun lt!191758 () Unit!7499)

(assert (=> d!39386 (= lt!191743 lt!191758)))

(assert (=> d!39386 (isPrefixOf!0 (_2!5388 lt!190841) (_2!5388 lt!190841))))

(assert (=> d!39386 (= lt!191758 (lemmaIsPrefixRefl!0 (_2!5388 lt!190841)))))

(assert (=> d!39386 (= lt!191747 (BitStream!4359 (buf!2879 (_2!5388 lt!190818)) (currentByte!5570 (_2!5388 lt!190841)) (currentBit!5565 (_2!5388 lt!190841))))))

(assert (=> d!39386 (isPrefixOf!0 (_2!5388 lt!190841) (_2!5388 lt!190818))))

(assert (=> d!39386 (= (reader!0 (_2!5388 lt!190841) (_2!5388 lt!190818)) lt!191753)))

(declare-fun lt!191760 () (_ BitVec 64))

(declare-fun b!122053 () Bool)

(declare-fun lt!191746 () (_ BitVec 64))

(assert (=> b!122053 (= e!79928 (= (_1!5387 lt!191753) (withMovedBitIndex!0 (_2!5387 lt!191753) (bvsub lt!191746 lt!191760))))))

(assert (=> b!122053 (or (= (bvand lt!191746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191760 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191746 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191746 lt!191760) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122053 (= lt!191760 (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190818))) (currentByte!5570 (_2!5388 lt!190818)) (currentBit!5565 (_2!5388 lt!190818))))))

(assert (=> b!122053 (= lt!191746 (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190841))) (currentByte!5570 (_2!5388 lt!190841)) (currentBit!5565 (_2!5388 lt!190841))))))

(declare-fun b!122054 () Bool)

(declare-fun res!101105 () Bool)

(assert (=> b!122054 (=> (not res!101105) (not e!79928))))

(assert (=> b!122054 (= res!101105 (isPrefixOf!0 (_1!5387 lt!191753) (_2!5388 lt!190841)))))

(declare-fun b!122055 () Bool)

(declare-fun Unit!7523 () Unit!7499)

(assert (=> b!122055 (= e!79929 Unit!7523)))

(assert (= (and d!39386 c!7329) b!122052))

(assert (= (and d!39386 (not c!7329)) b!122055))

(assert (= (and d!39386 res!101103) b!122054))

(assert (= (and b!122054 res!101105) b!122051))

(assert (= (and b!122051 res!101104) b!122053))

(declare-fun m!185273 () Bool)

(assert (=> b!122054 m!185273))

(assert (=> b!122052 m!184581))

(declare-fun m!185275 () Bool)

(assert (=> b!122052 m!185275))

(declare-fun m!185277 () Bool)

(assert (=> b!122052 m!185277))

(declare-fun m!185279 () Bool)

(assert (=> b!122053 m!185279))

(assert (=> b!122053 m!184585))

(assert (=> b!122053 m!184581))

(declare-fun m!185281 () Bool)

(assert (=> d!39386 m!185281))

(declare-fun m!185283 () Bool)

(assert (=> d!39386 m!185283))

(declare-fun m!185285 () Bool)

(assert (=> d!39386 m!185285))

(declare-fun m!185287 () Bool)

(assert (=> d!39386 m!185287))

(declare-fun m!185289 () Bool)

(assert (=> d!39386 m!185289))

(declare-fun m!185291 () Bool)

(assert (=> d!39386 m!185291))

(declare-fun m!185293 () Bool)

(assert (=> d!39386 m!185293))

(declare-fun m!185295 () Bool)

(assert (=> d!39386 m!185295))

(declare-fun m!185297 () Bool)

(assert (=> d!39386 m!185297))

(declare-fun m!185299 () Bool)

(assert (=> d!39386 m!185299))

(declare-fun m!185301 () Bool)

(assert (=> d!39386 m!185301))

(declare-fun m!185303 () Bool)

(assert (=> b!122051 m!185303))

(assert (=> b!121739 d!39386))

(declare-fun d!39414 () Bool)

(declare-fun lt!191775 () tuple2!10258)

(assert (=> d!39414 (= lt!191775 (readBit!0 lt!190822))))

(assert (=> d!39414 (= (readBitPure!0 lt!190822) (tuple2!10251 (_2!5394 lt!191775) (_1!5394 lt!191775)))))

(declare-fun bs!9530 () Bool)

(assert (= bs!9530 d!39414))

(declare-fun m!185305 () Bool)

(assert (=> bs!9530 m!185305))

(assert (=> b!121739 d!39414))

(declare-fun d!39416 () Bool)

(declare-fun e!79930 () Bool)

(assert (=> d!39416 e!79930))

(declare-fun res!101107 () Bool)

(assert (=> d!39416 (=> (not res!101107) (not e!79930))))

(declare-fun lt!191778 () (_ BitVec 64))

(declare-fun lt!191776 () (_ BitVec 64))

(declare-fun lt!191777 () (_ BitVec 64))

(assert (=> d!39416 (= res!101107 (= lt!191776 (bvsub lt!191777 lt!191778)))))

(assert (=> d!39416 (or (= (bvand lt!191777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191778 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191777 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191777 lt!191778) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39416 (= lt!191778 (remainingBits!0 ((_ sign_extend 32) (size!2442 (buf!2879 (_1!5390 lt!190825)))) ((_ sign_extend 32) (currentByte!5570 (_1!5390 lt!190825))) ((_ sign_extend 32) (currentBit!5565 (_1!5390 lt!190825)))))))

(declare-fun lt!191779 () (_ BitVec 64))

(declare-fun lt!191780 () (_ BitVec 64))

(assert (=> d!39416 (= lt!191777 (bvmul lt!191779 lt!191780))))

(assert (=> d!39416 (or (= lt!191779 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191780 (bvsdiv (bvmul lt!191779 lt!191780) lt!191779)))))

(assert (=> d!39416 (= lt!191780 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39416 (= lt!191779 ((_ sign_extend 32) (size!2442 (buf!2879 (_1!5390 lt!190825)))))))

(assert (=> d!39416 (= lt!191776 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5570 (_1!5390 lt!190825))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5565 (_1!5390 lt!190825)))))))

(assert (=> d!39416 (invariant!0 (currentBit!5565 (_1!5390 lt!190825)) (currentByte!5570 (_1!5390 lt!190825)) (size!2442 (buf!2879 (_1!5390 lt!190825))))))

(assert (=> d!39416 (= (bitIndex!0 (size!2442 (buf!2879 (_1!5390 lt!190825))) (currentByte!5570 (_1!5390 lt!190825)) (currentBit!5565 (_1!5390 lt!190825))) lt!191776)))

(declare-fun b!122056 () Bool)

(declare-fun res!101106 () Bool)

(assert (=> b!122056 (=> (not res!101106) (not e!79930))))

(assert (=> b!122056 (= res!101106 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!191776))))

(declare-fun b!122057 () Bool)

(declare-fun lt!191781 () (_ BitVec 64))

(assert (=> b!122057 (= e!79930 (bvsle lt!191776 (bvmul lt!191781 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122057 (or (= lt!191781 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191781 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191781)))))

(assert (=> b!122057 (= lt!191781 ((_ sign_extend 32) (size!2442 (buf!2879 (_1!5390 lt!190825)))))))

(assert (= (and d!39416 res!101107) b!122056))

(assert (= (and b!122056 res!101106) b!122057))

(declare-fun m!185307 () Bool)

(assert (=> d!39416 m!185307))

(declare-fun m!185309 () Bool)

(assert (=> d!39416 m!185309))

(assert (=> b!121739 d!39416))

(declare-fun d!39418 () Bool)

(declare-fun lt!191782 () tuple2!10260)

(assert (=> d!39418 (= lt!191782 (readNLeastSignificantBitsLoop!0 (_1!5387 lt!190829) nBits!396 i!615 lt!190836))))

(assert (=> d!39418 (= (readNLeastSignificantBitsLoopPure!0 (_1!5387 lt!190829) nBits!396 i!615 lt!190836) (tuple2!10249 (_2!5395 lt!191782) (_1!5395 lt!191782)))))

(declare-fun bs!9531 () Bool)

(assert (= bs!9531 d!39418))

(declare-fun m!185311 () Bool)

(assert (=> bs!9531 m!185311))

(assert (=> b!121739 d!39418))

(declare-fun d!39420 () Bool)

(declare-fun lt!191783 () tuple2!10258)

(assert (=> d!39420 (= lt!191783 (readBit!0 (_1!5387 lt!190829)))))

(assert (=> d!39420 (= (readBitPure!0 (_1!5387 lt!190829)) (tuple2!10251 (_2!5394 lt!191783) (_1!5394 lt!191783)))))

(declare-fun bs!9532 () Bool)

(assert (= bs!9532 d!39420))

(declare-fun m!185313 () Bool)

(assert (=> bs!9532 m!185313))

(assert (=> b!121739 d!39420))

(declare-fun d!39422 () Bool)

(declare-fun e!79933 () Bool)

(assert (=> d!39422 e!79933))

(declare-fun res!101110 () Bool)

(assert (=> d!39422 (=> (not res!101110) (not e!79933))))

(declare-fun lt!191799 () tuple2!10250)

(declare-fun lt!191801 () tuple2!10250)

(assert (=> d!39422 (= res!101110 (= (bitIndex!0 (size!2442 (buf!2879 (_1!5390 lt!191799))) (currentByte!5570 (_1!5390 lt!191799)) (currentBit!5565 (_1!5390 lt!191799))) (bitIndex!0 (size!2442 (buf!2879 (_1!5390 lt!191801))) (currentByte!5570 (_1!5390 lt!191801)) (currentBit!5565 (_1!5390 lt!191801)))))))

(declare-fun lt!191800 () BitStream!4358)

(declare-fun lt!191798 () Unit!7499)

(declare-fun choose!50 (BitStream!4358 BitStream!4358 BitStream!4358 tuple2!10250 tuple2!10250 BitStream!4358 Bool tuple2!10250 tuple2!10250 BitStream!4358 Bool) Unit!7499)

(assert (=> d!39422 (= lt!191798 (choose!50 lt!190822 (_2!5388 lt!190818) lt!191800 lt!191799 (tuple2!10251 (_1!5390 lt!191799) (_2!5390 lt!191799)) (_1!5390 lt!191799) (_2!5390 lt!191799) lt!191801 (tuple2!10251 (_1!5390 lt!191801) (_2!5390 lt!191801)) (_1!5390 lt!191801) (_2!5390 lt!191801)))))

(assert (=> d!39422 (= lt!191801 (readBitPure!0 lt!191800))))

(assert (=> d!39422 (= lt!191799 (readBitPure!0 lt!190822))))

(assert (=> d!39422 (= lt!191800 (BitStream!4359 (buf!2879 (_2!5388 lt!190818)) (currentByte!5570 lt!190822) (currentBit!5565 lt!190822)))))

(assert (=> d!39422 (invariant!0 (currentBit!5565 lt!190822) (currentByte!5570 lt!190822) (size!2442 (buf!2879 (_2!5388 lt!190818))))))

(assert (=> d!39422 (= (readBitPrefixLemma!0 lt!190822 (_2!5388 lt!190818)) lt!191798)))

(declare-fun b!122060 () Bool)

(assert (=> b!122060 (= e!79933 (= (_2!5390 lt!191799) (_2!5390 lt!191801)))))

(assert (= (and d!39422 res!101110) b!122060))

(assert (=> d!39422 m!184607))

(declare-fun m!185319 () Bool)

(assert (=> d!39422 m!185319))

(declare-fun m!185321 () Bool)

(assert (=> d!39422 m!185321))

(declare-fun m!185323 () Bool)

(assert (=> d!39422 m!185323))

(declare-fun m!185325 () Bool)

(assert (=> d!39422 m!185325))

(declare-fun m!185327 () Bool)

(assert (=> d!39422 m!185327))

(assert (=> b!121739 d!39422))

(declare-fun b!122073 () Bool)

(declare-fun e!79939 () Bool)

(declare-fun lt!191812 () tuple2!10250)

(declare-fun lt!191810 () tuple2!10246)

(assert (=> b!122073 (= e!79939 (= (bitIndex!0 (size!2442 (buf!2879 (_1!5390 lt!191812))) (currentByte!5570 (_1!5390 lt!191812)) (currentBit!5565 (_1!5390 lt!191812))) (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!191810))) (currentByte!5570 (_2!5388 lt!191810)) (currentBit!5565 (_2!5388 lt!191810)))))))

(declare-fun b!122071 () Bool)

(declare-fun res!101121 () Bool)

(declare-fun e!79938 () Bool)

(assert (=> b!122071 (=> (not res!101121) (not e!79938))))

(assert (=> b!122071 (= res!101121 (isPrefixOf!0 thiss!1305 (_2!5388 lt!191810)))))

(declare-fun d!39430 () Bool)

(assert (=> d!39430 e!79938))

(declare-fun res!101119 () Bool)

(assert (=> d!39430 (=> (not res!101119) (not e!79938))))

(assert (=> d!39430 (= res!101119 (= (size!2442 (buf!2879 thiss!1305)) (size!2442 (buf!2879 (_2!5388 lt!191810)))))))

(declare-fun choose!16 (BitStream!4358 Bool) tuple2!10246)

(assert (=> d!39430 (= lt!191810 (choose!16 thiss!1305 lt!190842))))

(declare-fun validate_offset_bit!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> d!39430 (validate_offset_bit!0 ((_ sign_extend 32) (size!2442 (buf!2879 thiss!1305))) ((_ sign_extend 32) (currentByte!5570 thiss!1305)) ((_ sign_extend 32) (currentBit!5565 thiss!1305)))))

(assert (=> d!39430 (= (appendBit!0 thiss!1305 lt!190842) lt!191810)))

(declare-fun b!122072 () Bool)

(assert (=> b!122072 (= e!79938 e!79939)))

(declare-fun res!101122 () Bool)

(assert (=> b!122072 (=> (not res!101122) (not e!79939))))

(assert (=> b!122072 (= res!101122 (and (= (_2!5390 lt!191812) lt!190842) (= (_1!5390 lt!191812) (_2!5388 lt!191810))))))

(assert (=> b!122072 (= lt!191812 (readBitPure!0 (readerFrom!0 (_2!5388 lt!191810) (currentBit!5565 thiss!1305) (currentByte!5570 thiss!1305))))))

(declare-fun b!122070 () Bool)

(declare-fun res!101120 () Bool)

(assert (=> b!122070 (=> (not res!101120) (not e!79938))))

(declare-fun lt!191811 () (_ BitVec 64))

(declare-fun lt!191813 () (_ BitVec 64))

(assert (=> b!122070 (= res!101120 (= (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!191810))) (currentByte!5570 (_2!5388 lt!191810)) (currentBit!5565 (_2!5388 lt!191810))) (bvadd lt!191813 lt!191811)))))

(assert (=> b!122070 (or (not (= (bvand lt!191813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191811 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!191813 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!191813 lt!191811) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122070 (= lt!191811 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!122070 (= lt!191813 (bitIndex!0 (size!2442 (buf!2879 thiss!1305)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305)))))

(assert (= (and d!39430 res!101119) b!122070))

(assert (= (and b!122070 res!101120) b!122071))

(assert (= (and b!122071 res!101121) b!122072))

(assert (= (and b!122072 res!101122) b!122073))

(declare-fun m!185329 () Bool)

(assert (=> b!122071 m!185329))

(declare-fun m!185331 () Bool)

(assert (=> d!39430 m!185331))

(declare-fun m!185333 () Bool)

(assert (=> d!39430 m!185333))

(declare-fun m!185335 () Bool)

(assert (=> b!122070 m!185335))

(assert (=> b!122070 m!184583))

(declare-fun m!185337 () Bool)

(assert (=> b!122072 m!185337))

(assert (=> b!122072 m!185337))

(declare-fun m!185339 () Bool)

(assert (=> b!122072 m!185339))

(declare-fun m!185341 () Bool)

(assert (=> b!122073 m!185341))

(assert (=> b!122073 m!185335))

(assert (=> b!121739 d!39430))

(declare-fun d!39432 () Bool)

(declare-fun res!101123 () Bool)

(declare-fun e!79941 () Bool)

(assert (=> d!39432 (=> (not res!101123) (not e!79941))))

(assert (=> d!39432 (= res!101123 (= (size!2442 (buf!2879 thiss!1305)) (size!2442 (buf!2879 (_2!5388 lt!190818)))))))

(assert (=> d!39432 (= (isPrefixOf!0 thiss!1305 (_2!5388 lt!190818)) e!79941)))

(declare-fun b!122074 () Bool)

(declare-fun res!101125 () Bool)

(assert (=> b!122074 (=> (not res!101125) (not e!79941))))

(assert (=> b!122074 (= res!101125 (bvsle (bitIndex!0 (size!2442 (buf!2879 thiss!1305)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305)) (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190818))) (currentByte!5570 (_2!5388 lt!190818)) (currentBit!5565 (_2!5388 lt!190818)))))))

(declare-fun b!122075 () Bool)

(declare-fun e!79940 () Bool)

(assert (=> b!122075 (= e!79941 e!79940)))

(declare-fun res!101124 () Bool)

(assert (=> b!122075 (=> res!101124 e!79940)))

(assert (=> b!122075 (= res!101124 (= (size!2442 (buf!2879 thiss!1305)) #b00000000000000000000000000000000))))

(declare-fun b!122076 () Bool)

(assert (=> b!122076 (= e!79940 (arrayBitRangesEq!0 (buf!2879 thiss!1305) (buf!2879 (_2!5388 lt!190818)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!2442 (buf!2879 thiss!1305)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305))))))

(assert (= (and d!39432 res!101123) b!122074))

(assert (= (and b!122074 res!101125) b!122075))

(assert (= (and b!122075 (not res!101124)) b!122076))

(assert (=> b!122074 m!184583))

(assert (=> b!122074 m!184585))

(assert (=> b!122076 m!184583))

(assert (=> b!122076 m!184583))

(declare-fun m!185343 () Bool)

(assert (=> b!122076 m!185343))

(assert (=> b!121739 d!39432))

(declare-fun d!39434 () Bool)

(declare-fun lt!191814 () tuple2!10260)

(assert (=> d!39434 (= lt!191814 (readNLeastSignificantBitsLoop!0 (_1!5387 lt!190832) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190819))))

(assert (=> d!39434 (= (readNLeastSignificantBitsLoopPure!0 (_1!5387 lt!190832) nBits!396 (bvadd #b00000000000000000000000000000001 i!615) lt!190819) (tuple2!10249 (_2!5395 lt!191814) (_1!5395 lt!191814)))))

(declare-fun bs!9535 () Bool)

(assert (= bs!9535 d!39434))

(declare-fun m!185345 () Bool)

(assert (=> bs!9535 m!185345))

(assert (=> b!121739 d!39434))

(declare-fun d!39436 () Bool)

(assert (=> d!39436 (isPrefixOf!0 thiss!1305 (_2!5388 lt!190818))))

(declare-fun lt!191817 () Unit!7499)

(declare-fun choose!30 (BitStream!4358 BitStream!4358 BitStream!4358) Unit!7499)

(assert (=> d!39436 (= lt!191817 (choose!30 thiss!1305 (_2!5388 lt!190841) (_2!5388 lt!190818)))))

(assert (=> d!39436 (isPrefixOf!0 thiss!1305 (_2!5388 lt!190841))))

(assert (=> d!39436 (= (lemmaIsPrefixTransitive!0 thiss!1305 (_2!5388 lt!190841) (_2!5388 lt!190818)) lt!191817)))

(declare-fun bs!9536 () Bool)

(assert (= bs!9536 d!39436))

(assert (=> bs!9536 m!184627))

(declare-fun m!185347 () Bool)

(assert (=> bs!9536 m!185347))

(assert (=> bs!9536 m!184645))

(assert (=> b!121739 d!39436))

(declare-fun d!39438 () Bool)

(declare-fun e!79942 () Bool)

(assert (=> d!39438 e!79942))

(declare-fun res!101127 () Bool)

(assert (=> d!39438 (=> (not res!101127) (not e!79942))))

(declare-fun lt!191818 () (_ BitVec 64))

(declare-fun lt!191820 () (_ BitVec 64))

(declare-fun lt!191819 () (_ BitVec 64))

(assert (=> d!39438 (= res!101127 (= lt!191818 (bvsub lt!191819 lt!191820)))))

(assert (=> d!39438 (or (= (bvand lt!191819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191820 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191819 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191819 lt!191820) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!39438 (= lt!191820 (remainingBits!0 ((_ sign_extend 32) (size!2442 (buf!2879 (_1!5390 lt!190834)))) ((_ sign_extend 32) (currentByte!5570 (_1!5390 lt!190834))) ((_ sign_extend 32) (currentBit!5565 (_1!5390 lt!190834)))))))

(declare-fun lt!191821 () (_ BitVec 64))

(declare-fun lt!191822 () (_ BitVec 64))

(assert (=> d!39438 (= lt!191819 (bvmul lt!191821 lt!191822))))

(assert (=> d!39438 (or (= lt!191821 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!191822 (bvsdiv (bvmul lt!191821 lt!191822) lt!191821)))))

(assert (=> d!39438 (= lt!191822 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!39438 (= lt!191821 ((_ sign_extend 32) (size!2442 (buf!2879 (_1!5390 lt!190834)))))))

(assert (=> d!39438 (= lt!191818 (bvadd (bvmul ((_ sign_extend 32) (currentByte!5570 (_1!5390 lt!190834))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!5565 (_1!5390 lt!190834)))))))

(assert (=> d!39438 (invariant!0 (currentBit!5565 (_1!5390 lt!190834)) (currentByte!5570 (_1!5390 lt!190834)) (size!2442 (buf!2879 (_1!5390 lt!190834))))))

(assert (=> d!39438 (= (bitIndex!0 (size!2442 (buf!2879 (_1!5390 lt!190834))) (currentByte!5570 (_1!5390 lt!190834)) (currentBit!5565 (_1!5390 lt!190834))) lt!191818)))

(declare-fun b!122077 () Bool)

(declare-fun res!101126 () Bool)

(assert (=> b!122077 (=> (not res!101126) (not e!79942))))

(assert (=> b!122077 (= res!101126 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!191818))))

(declare-fun b!122078 () Bool)

(declare-fun lt!191823 () (_ BitVec 64))

(assert (=> b!122078 (= e!79942 (bvsle lt!191818 (bvmul lt!191823 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!122078 (or (= lt!191823 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!191823 #b0000000000000000000000000000000000000000000000000000000000001000) lt!191823)))))

(assert (=> b!122078 (= lt!191823 ((_ sign_extend 32) (size!2442 (buf!2879 (_1!5390 lt!190834)))))))

(assert (= (and d!39438 res!101127) b!122077))

(assert (= (and b!122077 res!101126) b!122078))

(declare-fun m!185349 () Bool)

(assert (=> d!39438 m!185349))

(declare-fun m!185351 () Bool)

(assert (=> d!39438 m!185351))

(assert (=> b!121739 d!39438))

(declare-fun b!122079 () Bool)

(declare-fun res!101129 () Bool)

(declare-fun e!79943 () Bool)

(assert (=> b!122079 (=> (not res!101129) (not e!79943))))

(declare-fun lt!191834 () tuple2!10244)

(assert (=> b!122079 (= res!101129 (isPrefixOf!0 (_2!5387 lt!191834) (_2!5388 lt!190818)))))

(declare-fun b!122080 () Bool)

(declare-fun e!79944 () Unit!7499)

(declare-fun lt!191840 () Unit!7499)

(assert (=> b!122080 (= e!79944 lt!191840)))

(declare-fun lt!191825 () (_ BitVec 64))

(assert (=> b!122080 (= lt!191825 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!191843 () (_ BitVec 64))

(assert (=> b!122080 (= lt!191843 (bitIndex!0 (size!2442 (buf!2879 thiss!1305)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305)))))

(assert (=> b!122080 (= lt!191840 (arrayBitRangesEqSymmetric!0 (buf!2879 thiss!1305) (buf!2879 (_2!5388 lt!190818)) lt!191825 lt!191843))))

(assert (=> b!122080 (arrayBitRangesEq!0 (buf!2879 (_2!5388 lt!190818)) (buf!2879 thiss!1305) lt!191825 lt!191843)))

(declare-fun d!39440 () Bool)

(assert (=> d!39440 e!79943))

(declare-fun res!101128 () Bool)

(assert (=> d!39440 (=> (not res!101128) (not e!79943))))

(assert (=> d!39440 (= res!101128 (isPrefixOf!0 (_1!5387 lt!191834) (_2!5387 lt!191834)))))

(declare-fun lt!191828 () BitStream!4358)

(assert (=> d!39440 (= lt!191834 (tuple2!10245 lt!191828 (_2!5388 lt!190818)))))

(declare-fun lt!191833 () Unit!7499)

(declare-fun lt!191842 () Unit!7499)

(assert (=> d!39440 (= lt!191833 lt!191842)))

(assert (=> d!39440 (isPrefixOf!0 lt!191828 (_2!5388 lt!190818))))

(assert (=> d!39440 (= lt!191842 (lemmaIsPrefixTransitive!0 lt!191828 (_2!5388 lt!190818) (_2!5388 lt!190818)))))

(declare-fun lt!191838 () Unit!7499)

(declare-fun lt!191826 () Unit!7499)

(assert (=> d!39440 (= lt!191838 lt!191826)))

(assert (=> d!39440 (isPrefixOf!0 lt!191828 (_2!5388 lt!190818))))

(assert (=> d!39440 (= lt!191826 (lemmaIsPrefixTransitive!0 lt!191828 thiss!1305 (_2!5388 lt!190818)))))

(declare-fun lt!191832 () Unit!7499)

(assert (=> d!39440 (= lt!191832 e!79944)))

(declare-fun c!7330 () Bool)

(assert (=> d!39440 (= c!7330 (not (= (size!2442 (buf!2879 thiss!1305)) #b00000000000000000000000000000000)))))

(declare-fun lt!191835 () Unit!7499)

(declare-fun lt!191830 () Unit!7499)

(assert (=> d!39440 (= lt!191835 lt!191830)))

(assert (=> d!39440 (isPrefixOf!0 (_2!5388 lt!190818) (_2!5388 lt!190818))))

(assert (=> d!39440 (= lt!191830 (lemmaIsPrefixRefl!0 (_2!5388 lt!190818)))))

(declare-fun lt!191837 () Unit!7499)

(declare-fun lt!191829 () Unit!7499)

(assert (=> d!39440 (= lt!191837 lt!191829)))

(assert (=> d!39440 (= lt!191829 (lemmaIsPrefixRefl!0 (_2!5388 lt!190818)))))

(declare-fun lt!191831 () Unit!7499)

(declare-fun lt!191836 () Unit!7499)

(assert (=> d!39440 (= lt!191831 lt!191836)))

(assert (=> d!39440 (isPrefixOf!0 lt!191828 lt!191828)))

(assert (=> d!39440 (= lt!191836 (lemmaIsPrefixRefl!0 lt!191828))))

(declare-fun lt!191824 () Unit!7499)

(declare-fun lt!191839 () Unit!7499)

(assert (=> d!39440 (= lt!191824 lt!191839)))

(assert (=> d!39440 (isPrefixOf!0 thiss!1305 thiss!1305)))

(assert (=> d!39440 (= lt!191839 (lemmaIsPrefixRefl!0 thiss!1305))))

(assert (=> d!39440 (= lt!191828 (BitStream!4359 (buf!2879 (_2!5388 lt!190818)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305)))))

(assert (=> d!39440 (isPrefixOf!0 thiss!1305 (_2!5388 lt!190818))))

(assert (=> d!39440 (= (reader!0 thiss!1305 (_2!5388 lt!190818)) lt!191834)))

(declare-fun b!122081 () Bool)

(declare-fun lt!191827 () (_ BitVec 64))

(declare-fun lt!191841 () (_ BitVec 64))

(assert (=> b!122081 (= e!79943 (= (_1!5387 lt!191834) (withMovedBitIndex!0 (_2!5387 lt!191834) (bvsub lt!191827 lt!191841))))))

(assert (=> b!122081 (or (= (bvand lt!191827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!191841 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!191827 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!191827 lt!191841) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!122081 (= lt!191841 (bitIndex!0 (size!2442 (buf!2879 (_2!5388 lt!190818))) (currentByte!5570 (_2!5388 lt!190818)) (currentBit!5565 (_2!5388 lt!190818))))))

(assert (=> b!122081 (= lt!191827 (bitIndex!0 (size!2442 (buf!2879 thiss!1305)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305)))))

(declare-fun b!122082 () Bool)

(declare-fun res!101130 () Bool)

(assert (=> b!122082 (=> (not res!101130) (not e!79943))))

(assert (=> b!122082 (= res!101130 (isPrefixOf!0 (_1!5387 lt!191834) thiss!1305))))

(declare-fun b!122083 () Bool)

(declare-fun Unit!7524 () Unit!7499)

(assert (=> b!122083 (= e!79944 Unit!7524)))

(assert (= (and d!39440 c!7330) b!122080))

(assert (= (and d!39440 (not c!7330)) b!122083))

(assert (= (and d!39440 res!101128) b!122082))

(assert (= (and b!122082 res!101130) b!122079))

(assert (= (and b!122079 res!101129) b!122081))

(declare-fun m!185353 () Bool)

(assert (=> b!122082 m!185353))

(assert (=> b!122080 m!184583))

(declare-fun m!185355 () Bool)

(assert (=> b!122080 m!185355))

(declare-fun m!185357 () Bool)

(assert (=> b!122080 m!185357))

(declare-fun m!185359 () Bool)

(assert (=> b!122081 m!185359))

(assert (=> b!122081 m!184585))

(assert (=> b!122081 m!184583))

(declare-fun m!185361 () Bool)

(assert (=> d!39440 m!185361))

(declare-fun m!185363 () Bool)

(assert (=> d!39440 m!185363))

(declare-fun m!185365 () Bool)

(assert (=> d!39440 m!185365))

(declare-fun m!185367 () Bool)

(assert (=> d!39440 m!185367))

(declare-fun m!185369 () Bool)

(assert (=> d!39440 m!185369))

(assert (=> d!39440 m!185291))

(declare-fun m!185371 () Bool)

(assert (=> d!39440 m!185371))

(declare-fun m!185373 () Bool)

(assert (=> d!39440 m!185373))

(declare-fun m!185375 () Bool)

(assert (=> d!39440 m!185375))

(assert (=> d!39440 m!184627))

(assert (=> d!39440 m!185301))

(declare-fun m!185377 () Bool)

(assert (=> b!122079 m!185377))

(assert (=> b!121739 d!39440))

(declare-fun d!39442 () Bool)

(assert (=> d!39442 (validate_offset_bits!1 ((_ sign_extend 32) (size!2442 (buf!2879 (_2!5388 lt!190818)))) ((_ sign_extend 32) (currentByte!5570 thiss!1305)) ((_ sign_extend 32) (currentBit!5565 thiss!1305)) lt!190838)))

(declare-fun lt!191844 () Unit!7499)

(assert (=> d!39442 (= lt!191844 (choose!9 thiss!1305 (buf!2879 (_2!5388 lt!190818)) lt!190838 (BitStream!4359 (buf!2879 (_2!5388 lt!190818)) (currentByte!5570 thiss!1305) (currentBit!5565 thiss!1305))))))

(assert (=> d!39442 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1305 (buf!2879 (_2!5388 lt!190818)) lt!190838) lt!191844)))

(declare-fun bs!9537 () Bool)

(assert (= bs!9537 d!39442))

(assert (=> bs!9537 m!184605))

(declare-fun m!185379 () Bool)

(assert (=> bs!9537 m!185379))

(assert (=> b!121739 d!39442))

(declare-fun d!39444 () Bool)

(assert (=> d!39444 (= (onesLSBLong!0 nBits!396) (bvlshr #b1111111111111111111111111111111111111111111111111111111111111111 ((_ sign_extend 32) (bvsub #b00000000000000000000000001000000 nBits!396))))))

(assert (=> b!121741 d!39444))

(declare-fun d!39446 () Bool)

(assert (=> d!39446 (= (array_inv!2244 (buf!2879 thiss!1305)) (bvsge (size!2442 (buf!2879 thiss!1305)) #b00000000000000000000000000000000))))

(assert (=> b!121740 d!39446))

(declare-fun d!39448 () Bool)

(assert (=> d!39448 (= (inv!12 thiss!1305) (invariant!0 (currentBit!5565 thiss!1305) (currentByte!5570 thiss!1305) (size!2442 (buf!2879 thiss!1305))))))

(declare-fun bs!9538 () Bool)

(assert (= bs!9538 d!39448))

(assert (=> bs!9538 m!184739))

(assert (=> start!24042 d!39448))

(push 1)

(assert (not d!39280))

(assert (not b!122012))

(assert (not b!122009))

(assert (not d!39416))

(assert (not d!39436))

(assert (not d!39250))

(assert (not d!39282))

(assert (not d!39448))

(assert (not b!122014))

(assert (not d!39384))

(assert (not b!122070))

(assert (not d!39442))

(assert (not b!122073))

(assert (not d!39440))

(assert (not b!122082))

(assert (not b!122080))

(assert (not b!122011))

(assert (not d!39290))

(assert (not d!39298))

(assert (not b!122013))

(assert (not b!122005))

(assert (not b!122072))

(assert (not b!121783))

(assert (not bm!1595))

(assert (not d!39252))

(assert (not d!39438))

(assert (not d!39420))

(assert (not d!39386))

(assert (not b!122071))

(assert (not d!39288))

(assert (not d!39260))

(assert (not b!121781))

(assert (not d!39278))

(assert (not b!122052))

(assert (not b!122079))

(assert (not d!39434))

(assert (not b!122074))

(assert (not d!39284))

(assert (not d!39276))

(assert (not d!39300))

(assert (not b!122076))

(assert (not d!39422))

(assert (not b!122081))

(assert (not d!39414))

(assert (not d!39418))

(assert (not b!122054))

(assert (not d!39246))

(assert (not b!122006))

(assert (not d!39296))

(assert (not b!122051))

(assert (not b!121774))

(assert (not b!122053))

(assert (not d!39286))

(assert (not b!122016))

(assert (not b!122007))

(assert (not d!39430))

(check-sat)

(pop 1)

(push 1)

(check-sat)

