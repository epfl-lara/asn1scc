; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!53408 () Bool)

(assert start!53408)

(declare-fun res!207498 () Bool)

(declare-fun e!171773 () Bool)

(assert (=> start!53408 (=> (not res!207498) (not e!171773))))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun from!289 () (_ BitVec 64))

(assert (=> start!53408 (= res!207498 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!53408 e!171773))

(assert (=> start!53408 true))

(declare-datatypes ((array!13533 0))(
  ( (array!13534 (arr!6920 (Array (_ BitVec 32) (_ BitVec 8))) (size!5933 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10788 0))(
  ( (BitStream!10789 (buf!6420 array!13533) (currentByte!11836 (_ BitVec 32)) (currentBit!11831 (_ BitVec 32))) )
))
(declare-fun thiss!1005 () BitStream!10788)

(declare-fun e!171781 () Bool)

(declare-fun inv!12 (BitStream!10788) Bool)

(assert (=> start!53408 (and (inv!12 thiss!1005) e!171781)))

(declare-fun b!247930 () Bool)

(declare-fun e!171778 () Bool)

(declare-datatypes ((tuple2!21258 0))(
  ( (tuple2!21259 (_1!11551 BitStream!10788) (_2!11551 Bool)) )
))
(declare-fun lt!386417 () tuple2!21258)

(declare-fun lt!386409 () tuple2!21258)

(assert (=> b!247930 (= e!171778 (= (_2!11551 lt!386417) (_2!11551 lt!386409)))))

(declare-fun b!247931 () Bool)

(declare-fun bit!26 () Bool)

(declare-datatypes ((tuple2!21260 0))(
  ( (tuple2!21261 (_1!11552 BitStream!10788) (_2!11552 BitStream!10788)) )
))
(declare-fun lt!386405 () tuple2!21260)

(declare-fun checkBitsLoopPure!0 (BitStream!10788 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21258)

(assert (=> b!247931 (= e!171773 (not (= (_1!11551 (checkBitsLoopPure!0 (_1!11552 lt!386405) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289))) (_2!11552 lt!386405))))))

(declare-datatypes ((Unit!17987 0))(
  ( (Unit!17988) )
))
(declare-datatypes ((tuple2!21262 0))(
  ( (tuple2!21263 (_1!11553 Unit!17987) (_2!11553 BitStream!10788)) )
))
(declare-fun lt!386404 () tuple2!21262)

(declare-fun lt!386411 () tuple2!21262)

(declare-fun lt!386414 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!247931 (validate_offset_bits!1 ((_ sign_extend 32) (size!5933 (buf!6420 (_2!11553 lt!386404)))) ((_ sign_extend 32) (currentByte!11836 (_2!11553 lt!386411))) ((_ sign_extend 32) (currentBit!11831 (_2!11553 lt!386411))) lt!386414)))

(declare-fun lt!386413 () Unit!17987)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10788 array!13533 (_ BitVec 64)) Unit!17987)

(assert (=> b!247931 (= lt!386413 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11553 lt!386411) (buf!6420 (_2!11553 lt!386404)) lt!386414))))

(declare-fun lt!386410 () tuple2!21258)

(declare-fun lt!386400 () tuple2!21260)

(assert (=> b!247931 (= lt!386410 (checkBitsLoopPure!0 (_1!11552 lt!386400) nBits!297 bit!26 from!289))))

(assert (=> b!247931 (validate_offset_bits!1 ((_ sign_extend 32) (size!5933 (buf!6420 (_2!11553 lt!386404)))) ((_ sign_extend 32) (currentByte!11836 thiss!1005)) ((_ sign_extend 32) (currentBit!11831 thiss!1005)) (bvsub nBits!297 from!289))))

(declare-fun lt!386402 () Unit!17987)

(assert (=> b!247931 (= lt!386402 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1005 (buf!6420 (_2!11553 lt!386404)) (bvsub nBits!297 from!289)))))

(declare-fun readBitPure!0 (BitStream!10788) tuple2!21258)

(assert (=> b!247931 (= (_2!11551 (readBitPure!0 (_1!11552 lt!386400))) bit!26)))

(declare-fun reader!0 (BitStream!10788 BitStream!10788) tuple2!21260)

(assert (=> b!247931 (= lt!386405 (reader!0 (_2!11553 lt!386411) (_2!11553 lt!386404)))))

(assert (=> b!247931 (= lt!386400 (reader!0 thiss!1005 (_2!11553 lt!386404)))))

(assert (=> b!247931 e!171778))

(declare-fun res!207494 () Bool)

(assert (=> b!247931 (=> (not res!207494) (not e!171778))))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!247931 (= res!207494 (= (bitIndex!0 (size!5933 (buf!6420 (_1!11551 lt!386417))) (currentByte!11836 (_1!11551 lt!386417)) (currentBit!11831 (_1!11551 lt!386417))) (bitIndex!0 (size!5933 (buf!6420 (_1!11551 lt!386409))) (currentByte!11836 (_1!11551 lt!386409)) (currentBit!11831 (_1!11551 lt!386409)))))))

(declare-fun lt!386416 () Unit!17987)

(declare-fun lt!386415 () BitStream!10788)

(declare-fun readBitPrefixLemma!0 (BitStream!10788 BitStream!10788) Unit!17987)

(assert (=> b!247931 (= lt!386416 (readBitPrefixLemma!0 lt!386415 (_2!11553 lt!386404)))))

(assert (=> b!247931 (= lt!386409 (readBitPure!0 (BitStream!10789 (buf!6420 (_2!11553 lt!386404)) (currentByte!11836 thiss!1005) (currentBit!11831 thiss!1005))))))

(assert (=> b!247931 (= lt!386417 (readBitPure!0 lt!386415))))

(assert (=> b!247931 (= lt!386415 (BitStream!10789 (buf!6420 (_2!11553 lt!386411)) (currentByte!11836 thiss!1005) (currentBit!11831 thiss!1005)))))

(declare-fun e!171774 () Bool)

(assert (=> b!247931 e!171774))

(declare-fun res!207495 () Bool)

(assert (=> b!247931 (=> (not res!207495) (not e!171774))))

(declare-fun isPrefixOf!0 (BitStream!10788 BitStream!10788) Bool)

(assert (=> b!247931 (= res!207495 (isPrefixOf!0 thiss!1005 (_2!11553 lt!386404)))))

(declare-fun lt!386418 () Unit!17987)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10788 BitStream!10788 BitStream!10788) Unit!17987)

(assert (=> b!247931 (= lt!386418 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11553 lt!386411) (_2!11553 lt!386404)))))

(declare-fun e!171775 () Bool)

(assert (=> b!247931 e!171775))

(declare-fun res!207491 () Bool)

(assert (=> b!247931 (=> (not res!207491) (not e!171775))))

(assert (=> b!247931 (= res!207491 (= (size!5933 (buf!6420 (_2!11553 lt!386411))) (size!5933 (buf!6420 (_2!11553 lt!386404)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10788 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21262)

(assert (=> b!247931 (= lt!386404 (appendNBitsLoop!0 (_2!11553 lt!386411) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!247931 (validate_offset_bits!1 ((_ sign_extend 32) (size!5933 (buf!6420 (_2!11553 lt!386411)))) ((_ sign_extend 32) (currentByte!11836 (_2!11553 lt!386411))) ((_ sign_extend 32) (currentBit!11831 (_2!11553 lt!386411))) lt!386414)))

(assert (=> b!247931 (= lt!386414 (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!386401 () Unit!17987)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10788 BitStream!10788 (_ BitVec 64) (_ BitVec 64)) Unit!17987)

(assert (=> b!247931 (= lt!386401 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11553 lt!386411) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun e!171782 () Bool)

(assert (=> b!247931 e!171782))

(declare-fun res!207487 () Bool)

(assert (=> b!247931 (=> (not res!207487) (not e!171782))))

(assert (=> b!247931 (= res!207487 (= (size!5933 (buf!6420 thiss!1005)) (size!5933 (buf!6420 (_2!11553 lt!386411)))))))

(declare-fun appendBit!0 (BitStream!10788 Bool) tuple2!21262)

(assert (=> b!247931 (= lt!386411 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!247932 () Bool)

(declare-fun e!171780 () Bool)

(declare-fun e!171776 () Bool)

(assert (=> b!247932 (= e!171780 e!171776)))

(declare-fun res!207489 () Bool)

(assert (=> b!247932 (=> (not res!207489) (not e!171776))))

(declare-fun lt!386398 () tuple2!21258)

(assert (=> b!247932 (= res!207489 (and (= (_2!11551 lt!386398) bit!26) (= (_1!11551 lt!386398) (_2!11553 lt!386411))))))

(declare-fun readerFrom!0 (BitStream!10788 (_ BitVec 32) (_ BitVec 32)) BitStream!10788)

(assert (=> b!247932 (= lt!386398 (readBitPure!0 (readerFrom!0 (_2!11553 lt!386411) (currentBit!11831 thiss!1005) (currentByte!11836 thiss!1005))))))

(declare-fun b!247933 () Bool)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!247933 (= e!171774 (invariant!0 (currentBit!11831 thiss!1005) (currentByte!11836 thiss!1005) (size!5933 (buf!6420 (_2!11553 lt!386404)))))))

(declare-fun b!247934 () Bool)

(declare-fun res!207493 () Bool)

(assert (=> b!247934 (=> (not res!207493) (not e!171774))))

(assert (=> b!247934 (= res!207493 (invariant!0 (currentBit!11831 thiss!1005) (currentByte!11836 thiss!1005) (size!5933 (buf!6420 (_2!11553 lt!386411)))))))

(declare-fun b!247935 () Bool)

(declare-fun array_inv!5674 (array!13533) Bool)

(assert (=> b!247935 (= e!171781 (array_inv!5674 (buf!6420 thiss!1005)))))

(declare-fun b!247936 () Bool)

(declare-fun e!171777 () Bool)

(assert (=> b!247936 (= e!171775 e!171777)))

(declare-fun res!207486 () Bool)

(assert (=> b!247936 (=> (not res!207486) (not e!171777))))

(declare-fun lt!386412 () (_ BitVec 64))

(assert (=> b!247936 (= res!207486 (= (bitIndex!0 (size!5933 (buf!6420 (_2!11553 lt!386404))) (currentByte!11836 (_2!11553 lt!386404)) (currentBit!11831 (_2!11553 lt!386404))) (bvadd (bitIndex!0 (size!5933 (buf!6420 (_2!11553 lt!386411))) (currentByte!11836 (_2!11553 lt!386411)) (currentBit!11831 (_2!11553 lt!386411))) lt!386412)))))

(assert (=> b!247936 (= lt!386412 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!247937 () Bool)

(declare-fun res!207497 () Bool)

(assert (=> b!247937 (=> (not res!207497) (not e!171777))))

(assert (=> b!247937 (= res!207497 (isPrefixOf!0 (_2!11553 lt!386411) (_2!11553 lt!386404)))))

(declare-fun b!247938 () Bool)

(assert (=> b!247938 (= e!171782 e!171780)))

(declare-fun res!207490 () Bool)

(assert (=> b!247938 (=> (not res!207490) (not e!171780))))

(declare-fun lt!386399 () (_ BitVec 64))

(declare-fun lt!386406 () (_ BitVec 64))

(assert (=> b!247938 (= res!207490 (= lt!386399 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!386406)))))

(assert (=> b!247938 (= lt!386399 (bitIndex!0 (size!5933 (buf!6420 (_2!11553 lt!386411))) (currentByte!11836 (_2!11553 lt!386411)) (currentBit!11831 (_2!11553 lt!386411))))))

(assert (=> b!247938 (= lt!386406 (bitIndex!0 (size!5933 (buf!6420 thiss!1005)) (currentByte!11836 thiss!1005) (currentBit!11831 thiss!1005)))))

(declare-fun b!247939 () Bool)

(declare-fun lt!386408 () tuple2!21258)

(declare-fun lt!386407 () tuple2!21260)

(assert (=> b!247939 (= e!171777 (not (or (not (_2!11551 lt!386408)) (not (= (_1!11551 lt!386408) (_2!11552 lt!386407))))))))

(assert (=> b!247939 (= lt!386408 (checkBitsLoopPure!0 (_1!11552 lt!386407) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!247939 (validate_offset_bits!1 ((_ sign_extend 32) (size!5933 (buf!6420 (_2!11553 lt!386404)))) ((_ sign_extend 32) (currentByte!11836 (_2!11553 lt!386411))) ((_ sign_extend 32) (currentBit!11831 (_2!11553 lt!386411))) lt!386412)))

(declare-fun lt!386403 () Unit!17987)

(assert (=> b!247939 (= lt!386403 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11553 lt!386411) (buf!6420 (_2!11553 lt!386404)) lt!386412))))

(assert (=> b!247939 (= lt!386407 (reader!0 (_2!11553 lt!386411) (_2!11553 lt!386404)))))

(declare-fun b!247940 () Bool)

(assert (=> b!247940 (= e!171776 (= (bitIndex!0 (size!5933 (buf!6420 (_1!11551 lt!386398))) (currentByte!11836 (_1!11551 lt!386398)) (currentBit!11831 (_1!11551 lt!386398))) lt!386399))))

(declare-fun b!247941 () Bool)

(declare-fun res!207496 () Bool)

(assert (=> b!247941 (=> (not res!207496) (not e!171773))))

(assert (=> b!247941 (= res!207496 (bvslt from!289 nBits!297))))

(declare-fun b!247942 () Bool)

(declare-fun res!207492 () Bool)

(assert (=> b!247942 (=> (not res!207492) (not e!171780))))

(assert (=> b!247942 (= res!207492 (isPrefixOf!0 thiss!1005 (_2!11553 lt!386411)))))

(declare-fun b!247943 () Bool)

(declare-fun res!207488 () Bool)

(assert (=> b!247943 (=> (not res!207488) (not e!171773))))

(assert (=> b!247943 (= res!207488 (validate_offset_bits!1 ((_ sign_extend 32) (size!5933 (buf!6420 thiss!1005))) ((_ sign_extend 32) (currentByte!11836 thiss!1005)) ((_ sign_extend 32) (currentBit!11831 thiss!1005)) (bvsub nBits!297 from!289)))))

(assert (= (and start!53408 res!207498) b!247943))

(assert (= (and b!247943 res!207488) b!247941))

(assert (= (and b!247941 res!207496) b!247931))

(assert (= (and b!247931 res!207487) b!247938))

(assert (= (and b!247938 res!207490) b!247942))

(assert (= (and b!247942 res!207492) b!247932))

(assert (= (and b!247932 res!207489) b!247940))

(assert (= (and b!247931 res!207491) b!247936))

(assert (= (and b!247936 res!207486) b!247937))

(assert (= (and b!247937 res!207497) b!247939))

(assert (= (and b!247931 res!207495) b!247934))

(assert (= (and b!247934 res!207493) b!247933))

(assert (= (and b!247931 res!207494) b!247930))

(assert (= start!53408 b!247935))

(declare-fun m!373611 () Bool)

(assert (=> b!247931 m!373611))

(declare-fun m!373613 () Bool)

(assert (=> b!247931 m!373613))

(declare-fun m!373615 () Bool)

(assert (=> b!247931 m!373615))

(declare-fun m!373617 () Bool)

(assert (=> b!247931 m!373617))

(declare-fun m!373619 () Bool)

(assert (=> b!247931 m!373619))

(declare-fun m!373621 () Bool)

(assert (=> b!247931 m!373621))

(declare-fun m!373623 () Bool)

(assert (=> b!247931 m!373623))

(declare-fun m!373625 () Bool)

(assert (=> b!247931 m!373625))

(declare-fun m!373627 () Bool)

(assert (=> b!247931 m!373627))

(declare-fun m!373629 () Bool)

(assert (=> b!247931 m!373629))

(declare-fun m!373631 () Bool)

(assert (=> b!247931 m!373631))

(declare-fun m!373633 () Bool)

(assert (=> b!247931 m!373633))

(declare-fun m!373635 () Bool)

(assert (=> b!247931 m!373635))

(declare-fun m!373637 () Bool)

(assert (=> b!247931 m!373637))

(declare-fun m!373639 () Bool)

(assert (=> b!247931 m!373639))

(declare-fun m!373641 () Bool)

(assert (=> b!247931 m!373641))

(declare-fun m!373643 () Bool)

(assert (=> b!247931 m!373643))

(declare-fun m!373645 () Bool)

(assert (=> b!247931 m!373645))

(declare-fun m!373647 () Bool)

(assert (=> b!247931 m!373647))

(declare-fun m!373649 () Bool)

(assert (=> b!247931 m!373649))

(declare-fun m!373651 () Bool)

(assert (=> b!247942 m!373651))

(declare-fun m!373653 () Bool)

(assert (=> b!247933 m!373653))

(declare-fun m!373655 () Bool)

(assert (=> b!247935 m!373655))

(declare-fun m!373657 () Bool)

(assert (=> b!247936 m!373657))

(declare-fun m!373659 () Bool)

(assert (=> b!247936 m!373659))

(declare-fun m!373661 () Bool)

(assert (=> b!247943 m!373661))

(declare-fun m!373663 () Bool)

(assert (=> b!247939 m!373663))

(declare-fun m!373665 () Bool)

(assert (=> b!247939 m!373665))

(declare-fun m!373667 () Bool)

(assert (=> b!247939 m!373667))

(assert (=> b!247939 m!373635))

(declare-fun m!373669 () Bool)

(assert (=> b!247932 m!373669))

(assert (=> b!247932 m!373669))

(declare-fun m!373671 () Bool)

(assert (=> b!247932 m!373671))

(declare-fun m!373673 () Bool)

(assert (=> start!53408 m!373673))

(declare-fun m!373675 () Bool)

(assert (=> b!247940 m!373675))

(declare-fun m!373677 () Bool)

(assert (=> b!247937 m!373677))

(assert (=> b!247938 m!373659))

(declare-fun m!373679 () Bool)

(assert (=> b!247938 m!373679))

(declare-fun m!373681 () Bool)

(assert (=> b!247934 m!373681))

(check-sat (not b!247937) (not b!247934) (not b!247942) (not b!247936) (not b!247943) (not start!53408) (not b!247935) (not b!247939) (not b!247933) (not b!247940) (not b!247931) (not b!247932) (not b!247938))
