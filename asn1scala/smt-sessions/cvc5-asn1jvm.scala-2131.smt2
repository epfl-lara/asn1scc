; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!54066 () Bool)

(assert start!54066)

(declare-fun b!251662 () Bool)

(declare-fun e!174373 () Bool)

(declare-datatypes ((array!13690 0))(
  ( (array!13691 (arr!6991 (Array (_ BitVec 32) (_ BitVec 8))) (size!6004 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!10930 0))(
  ( (BitStream!10931 (buf!6506 array!13690) (currentByte!11961 (_ BitVec 32)) (currentBit!11956 (_ BitVec 32))) )
))
(declare-datatypes ((tuple2!21594 0))(
  ( (tuple2!21595 (_1!11725 BitStream!10930) (_2!11725 Bool)) )
))
(declare-fun lt!391041 () tuple2!21594)

(declare-datatypes ((tuple2!21596 0))(
  ( (tuple2!21597 (_1!11726 BitStream!10930) (_2!11726 BitStream!10930)) )
))
(declare-fun lt!391049 () tuple2!21596)

(assert (=> b!251662 (= e!174373 (not (or (not (_2!11725 lt!391041)) (not (= (_1!11725 lt!391041) (_2!11726 lt!391049))))))))

(declare-fun from!289 () (_ BitVec 64))

(declare-fun nBits!297 () (_ BitVec 64))

(declare-fun bit!26 () Bool)

(declare-fun checkBitsLoopPure!0 (BitStream!10930 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21594)

(assert (=> b!251662 (= lt!391041 (checkBitsLoopPure!0 (_1!11726 lt!391049) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-datatypes ((Unit!18156 0))(
  ( (Unit!18157) )
))
(declare-datatypes ((tuple2!21598 0))(
  ( (tuple2!21599 (_1!11727 Unit!18156) (_2!11727 BitStream!10930)) )
))
(declare-fun lt!391039 () tuple2!21598)

(declare-fun lt!391050 () tuple2!21598)

(declare-fun lt!391047 () (_ BitVec 64))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!251662 (validate_offset_bits!1 ((_ sign_extend 32) (size!6004 (buf!6506 (_2!11727 lt!391039)))) ((_ sign_extend 32) (currentByte!11961 (_2!11727 lt!391050))) ((_ sign_extend 32) (currentBit!11956 (_2!11727 lt!391050))) lt!391047)))

(declare-fun lt!391042 () Unit!18156)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!10930 array!13690 (_ BitVec 64)) Unit!18156)

(assert (=> b!251662 (= lt!391042 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!11727 lt!391050) (buf!6506 (_2!11727 lt!391039)) lt!391047))))

(declare-fun reader!0 (BitStream!10930 BitStream!10930) tuple2!21596)

(assert (=> b!251662 (= lt!391049 (reader!0 (_2!11727 lt!391050) (_2!11727 lt!391039)))))

(declare-fun b!251663 () Bool)

(declare-fun res!210775 () Bool)

(declare-fun e!174377 () Bool)

(assert (=> b!251663 (=> (not res!210775) (not e!174377))))

(assert (=> b!251663 (= res!210775 (bvslt from!289 nBits!297))))

(declare-fun b!251664 () Bool)

(declare-fun e!174375 () Bool)

(declare-fun thiss!1005 () BitStream!10930)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!251664 (= e!174375 (invariant!0 (currentBit!11956 thiss!1005) (currentByte!11961 thiss!1005) (size!6004 (buf!6506 (_2!11727 lt!391039)))))))

(declare-fun b!251665 () Bool)

(declare-fun e!174376 () Bool)

(declare-fun lt!391038 () tuple2!21594)

(declare-fun lt!391040 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!251665 (= e!174376 (= (bitIndex!0 (size!6004 (buf!6506 (_1!11725 lt!391038))) (currentByte!11961 (_1!11725 lt!391038)) (currentBit!11956 (_1!11725 lt!391038))) lt!391040))))

(declare-fun b!251667 () Bool)

(declare-fun res!210783 () Bool)

(declare-fun e!174380 () Bool)

(assert (=> b!251667 (=> (not res!210783) (not e!174380))))

(declare-fun isPrefixOf!0 (BitStream!10930 BitStream!10930) Bool)

(assert (=> b!251667 (= res!210783 (isPrefixOf!0 thiss!1005 (_2!11727 lt!391050)))))

(declare-fun b!251668 () Bool)

(declare-fun res!210778 () Bool)

(assert (=> b!251668 (=> (not res!210778) (not e!174377))))

(assert (=> b!251668 (= res!210778 (validate_offset_bits!1 ((_ sign_extend 32) (size!6004 (buf!6506 thiss!1005))) ((_ sign_extend 32) (currentByte!11961 thiss!1005)) ((_ sign_extend 32) (currentBit!11956 thiss!1005)) (bvsub nBits!297 from!289)))))

(declare-fun b!251669 () Bool)

(declare-fun e!174372 () Bool)

(assert (=> b!251669 (= e!174372 e!174373)))

(declare-fun res!210782 () Bool)

(assert (=> b!251669 (=> (not res!210782) (not e!174373))))

(assert (=> b!251669 (= res!210782 (= (bitIndex!0 (size!6004 (buf!6506 (_2!11727 lt!391039))) (currentByte!11961 (_2!11727 lt!391039)) (currentBit!11956 (_2!11727 lt!391039))) (bvadd (bitIndex!0 (size!6004 (buf!6506 (_2!11727 lt!391050))) (currentByte!11961 (_2!11727 lt!391050)) (currentBit!11956 (_2!11727 lt!391050))) lt!391047)))))

(assert (=> b!251669 (= lt!391047 (bvsub nBits!297 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(declare-fun b!251670 () Bool)

(declare-fun e!174379 () Bool)

(assert (=> b!251670 (= e!174379 e!174380)))

(declare-fun res!210779 () Bool)

(assert (=> b!251670 (=> (not res!210779) (not e!174380))))

(declare-fun lt!391037 () (_ BitVec 64))

(assert (=> b!251670 (= res!210779 (= lt!391040 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 lt!391037)))))

(assert (=> b!251670 (= lt!391040 (bitIndex!0 (size!6004 (buf!6506 (_2!11727 lt!391050))) (currentByte!11961 (_2!11727 lt!391050)) (currentBit!11956 (_2!11727 lt!391050))))))

(assert (=> b!251670 (= lt!391037 (bitIndex!0 (size!6004 (buf!6506 thiss!1005)) (currentByte!11961 thiss!1005) (currentBit!11956 thiss!1005)))))

(declare-fun b!251671 () Bool)

(declare-fun e!174374 () Bool)

(declare-fun array_inv!5745 (array!13690) Bool)

(assert (=> b!251671 (= e!174374 (array_inv!5745 (buf!6506 thiss!1005)))))

(declare-fun b!251672 () Bool)

(declare-fun res!210776 () Bool)

(assert (=> b!251672 (=> (not res!210776) (not e!174375))))

(assert (=> b!251672 (= res!210776 (invariant!0 (currentBit!11956 thiss!1005) (currentByte!11961 thiss!1005) (size!6004 (buf!6506 (_2!11727 lt!391050)))))))

(declare-fun b!251673 () Bool)

(declare-fun res!210781 () Bool)

(assert (=> b!251673 (=> (not res!210781) (not e!174373))))

(assert (=> b!251673 (= res!210781 (isPrefixOf!0 (_2!11727 lt!391050) (_2!11727 lt!391039)))))

(declare-fun res!210777 () Bool)

(assert (=> start!54066 (=> (not res!210777) (not e!174377))))

(assert (=> start!54066 (= res!210777 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 nBits!297) (bvsle nBits!297 #b0000000000000000000000000000001111111111111111111111111111111000) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 from!289) (bvsle from!289 nBits!297)))))

(assert (=> start!54066 e!174377))

(assert (=> start!54066 true))

(declare-fun inv!12 (BitStream!10930) Bool)

(assert (=> start!54066 (and (inv!12 thiss!1005) e!174374)))

(declare-fun b!251666 () Bool)

(assert (=> b!251666 (= e!174380 e!174376)))

(declare-fun res!210780 () Bool)

(assert (=> b!251666 (=> (not res!210780) (not e!174376))))

(assert (=> b!251666 (= res!210780 (and (= (_2!11725 lt!391038) bit!26) (= (_1!11725 lt!391038) (_2!11727 lt!391050))))))

(declare-fun readBitPure!0 (BitStream!10930) tuple2!21594)

(declare-fun readerFrom!0 (BitStream!10930 (_ BitVec 32) (_ BitVec 32)) BitStream!10930)

(assert (=> b!251666 (= lt!391038 (readBitPure!0 (readerFrom!0 (_2!11727 lt!391050) (currentBit!11956 thiss!1005) (currentByte!11961 thiss!1005))))))

(declare-fun b!251674 () Bool)

(assert (=> b!251674 (= e!174377 (not true))))

(declare-fun lt!391046 () tuple2!21596)

(assert (=> b!251674 (= (_2!11725 (readBitPure!0 (_1!11726 lt!391046))) bit!26)))

(declare-fun lt!391043 () tuple2!21596)

(assert (=> b!251674 (= lt!391043 (reader!0 (_2!11727 lt!391050) (_2!11727 lt!391039)))))

(assert (=> b!251674 (= lt!391046 (reader!0 thiss!1005 (_2!11727 lt!391039)))))

(declare-fun e!174371 () Bool)

(assert (=> b!251674 e!174371))

(declare-fun res!210773 () Bool)

(assert (=> b!251674 (=> (not res!210773) (not e!174371))))

(declare-fun lt!391053 () tuple2!21594)

(declare-fun lt!391051 () tuple2!21594)

(assert (=> b!251674 (= res!210773 (= (bitIndex!0 (size!6004 (buf!6506 (_1!11725 lt!391053))) (currentByte!11961 (_1!11725 lt!391053)) (currentBit!11956 (_1!11725 lt!391053))) (bitIndex!0 (size!6004 (buf!6506 (_1!11725 lt!391051))) (currentByte!11961 (_1!11725 lt!391051)) (currentBit!11956 (_1!11725 lt!391051)))))))

(declare-fun lt!391045 () Unit!18156)

(declare-fun lt!391044 () BitStream!10930)

(declare-fun readBitPrefixLemma!0 (BitStream!10930 BitStream!10930) Unit!18156)

(assert (=> b!251674 (= lt!391045 (readBitPrefixLemma!0 lt!391044 (_2!11727 lt!391039)))))

(assert (=> b!251674 (= lt!391051 (readBitPure!0 (BitStream!10931 (buf!6506 (_2!11727 lt!391039)) (currentByte!11961 thiss!1005) (currentBit!11956 thiss!1005))))))

(assert (=> b!251674 (= lt!391053 (readBitPure!0 lt!391044))))

(assert (=> b!251674 (= lt!391044 (BitStream!10931 (buf!6506 (_2!11727 lt!391050)) (currentByte!11961 thiss!1005) (currentBit!11956 thiss!1005)))))

(assert (=> b!251674 e!174375))

(declare-fun res!210774 () Bool)

(assert (=> b!251674 (=> (not res!210774) (not e!174375))))

(assert (=> b!251674 (= res!210774 (isPrefixOf!0 thiss!1005 (_2!11727 lt!391039)))))

(declare-fun lt!391052 () Unit!18156)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!10930 BitStream!10930 BitStream!10930) Unit!18156)

(assert (=> b!251674 (= lt!391052 (lemmaIsPrefixTransitive!0 thiss!1005 (_2!11727 lt!391050) (_2!11727 lt!391039)))))

(assert (=> b!251674 e!174372))

(declare-fun res!210772 () Bool)

(assert (=> b!251674 (=> (not res!210772) (not e!174372))))

(assert (=> b!251674 (= res!210772 (= (size!6004 (buf!6506 (_2!11727 lt!391050))) (size!6004 (buf!6506 (_2!11727 lt!391039)))))))

(declare-fun appendNBitsLoop!0 (BitStream!10930 (_ BitVec 64) Bool (_ BitVec 64)) tuple2!21598)

(assert (=> b!251674 (= lt!391039 (appendNBitsLoop!0 (_2!11727 lt!391050) nBits!297 bit!26 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 from!289)))))

(assert (=> b!251674 (validate_offset_bits!1 ((_ sign_extend 32) (size!6004 (buf!6506 (_2!11727 lt!391050)))) ((_ sign_extend 32) (currentByte!11961 (_2!11727 lt!391050))) ((_ sign_extend 32) (currentBit!11956 (_2!11727 lt!391050))) (bvsub (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!391048 () Unit!18156)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!10930 BitStream!10930 (_ BitVec 64) (_ BitVec 64)) Unit!18156)

(assert (=> b!251674 (= lt!391048 (validateOffsetBitsIneqLemma!0 thiss!1005 (_2!11727 lt!391050) (bvsub nBits!297 from!289) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!251674 e!174379))

(declare-fun res!210771 () Bool)

(assert (=> b!251674 (=> (not res!210771) (not e!174379))))

(assert (=> b!251674 (= res!210771 (= (size!6004 (buf!6506 thiss!1005)) (size!6004 (buf!6506 (_2!11727 lt!391050)))))))

(declare-fun appendBit!0 (BitStream!10930 Bool) tuple2!21598)

(assert (=> b!251674 (= lt!391050 (appendBit!0 thiss!1005 bit!26))))

(declare-fun b!251675 () Bool)

(assert (=> b!251675 (= e!174371 (= (_2!11725 lt!391053) (_2!11725 lt!391051)))))

(assert (= (and start!54066 res!210777) b!251668))

(assert (= (and b!251668 res!210778) b!251663))

(assert (= (and b!251663 res!210775) b!251674))

(assert (= (and b!251674 res!210771) b!251670))

(assert (= (and b!251670 res!210779) b!251667))

(assert (= (and b!251667 res!210783) b!251666))

(assert (= (and b!251666 res!210780) b!251665))

(assert (= (and b!251674 res!210772) b!251669))

(assert (= (and b!251669 res!210782) b!251673))

(assert (= (and b!251673 res!210781) b!251662))

(assert (= (and b!251674 res!210774) b!251672))

(assert (= (and b!251672 res!210776) b!251664))

(assert (= (and b!251674 res!210773) b!251675))

(assert (= start!54066 b!251671))

(declare-fun m!378627 () Bool)

(assert (=> b!251674 m!378627))

(declare-fun m!378629 () Bool)

(assert (=> b!251674 m!378629))

(declare-fun m!378631 () Bool)

(assert (=> b!251674 m!378631))

(declare-fun m!378633 () Bool)

(assert (=> b!251674 m!378633))

(declare-fun m!378635 () Bool)

(assert (=> b!251674 m!378635))

(declare-fun m!378637 () Bool)

(assert (=> b!251674 m!378637))

(declare-fun m!378639 () Bool)

(assert (=> b!251674 m!378639))

(declare-fun m!378641 () Bool)

(assert (=> b!251674 m!378641))

(declare-fun m!378643 () Bool)

(assert (=> b!251674 m!378643))

(declare-fun m!378645 () Bool)

(assert (=> b!251674 m!378645))

(declare-fun m!378647 () Bool)

(assert (=> b!251674 m!378647))

(declare-fun m!378649 () Bool)

(assert (=> b!251674 m!378649))

(declare-fun m!378651 () Bool)

(assert (=> b!251674 m!378651))

(declare-fun m!378653 () Bool)

(assert (=> b!251674 m!378653))

(declare-fun m!378655 () Bool)

(assert (=> b!251670 m!378655))

(declare-fun m!378657 () Bool)

(assert (=> b!251670 m!378657))

(declare-fun m!378659 () Bool)

(assert (=> b!251673 m!378659))

(declare-fun m!378661 () Bool)

(assert (=> b!251667 m!378661))

(declare-fun m!378663 () Bool)

(assert (=> b!251668 m!378663))

(declare-fun m!378665 () Bool)

(assert (=> b!251665 m!378665))

(declare-fun m!378667 () Bool)

(assert (=> b!251672 m!378667))

(declare-fun m!378669 () Bool)

(assert (=> b!251664 m!378669))

(declare-fun m!378671 () Bool)

(assert (=> b!251666 m!378671))

(assert (=> b!251666 m!378671))

(declare-fun m!378673 () Bool)

(assert (=> b!251666 m!378673))

(declare-fun m!378675 () Bool)

(assert (=> b!251662 m!378675))

(declare-fun m!378677 () Bool)

(assert (=> b!251662 m!378677))

(declare-fun m!378679 () Bool)

(assert (=> b!251662 m!378679))

(assert (=> b!251662 m!378639))

(declare-fun m!378681 () Bool)

(assert (=> start!54066 m!378681))

(declare-fun m!378683 () Bool)

(assert (=> b!251669 m!378683))

(assert (=> b!251669 m!378655))

(declare-fun m!378685 () Bool)

(assert (=> b!251671 m!378685))

(push 1)

(assert (not b!251662))

(assert (not b!251673))

(assert (not b!251667))

(assert (not b!251666))

(assert (not b!251672))

(assert (not b!251674))

(assert (not b!251671))

(assert (not b!251670))

(assert (not b!251664))

(assert (not b!251668))

(assert (not b!251669))

(assert (not b!251665))

(assert (not start!54066))

(check-sat)

(pop 1)

(push 1)

(check-sat)

(pop 1)

