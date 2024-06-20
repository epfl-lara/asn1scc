; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!6900 () Bool)

(assert start!6900)

(declare-fun b!32842 () Bool)

(declare-fun res!28095 () Bool)

(declare-fun e!21745 () Bool)

(assert (=> b!32842 (=> res!28095 e!21745)))

(declare-datatypes ((array!1836 0))(
  ( (array!1837 (arr!1285 (Array (_ BitVec 32) (_ BitVec 8))) (size!810 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!1412 0))(
  ( (BitStream!1413 (buf!1138 array!1836) (currentByte!2505 (_ BitVec 32)) (currentBit!2500 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2475 0))(
  ( (Unit!2476) )
))
(declare-datatypes ((tuple2!3354 0))(
  ( (tuple2!3355 (_1!1764 Unit!2475) (_2!1764 BitStream!1412)) )
))
(declare-fun lt!48525 () tuple2!3354)

(declare-fun lt!48524 () tuple2!3354)

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!32842 (= res!28095 (not (invariant!0 (currentBit!2500 (_2!1764 lt!48525)) (currentByte!2505 (_2!1764 lt!48525)) (size!810 (buf!1138 (_2!1764 lt!48524))))))))

(declare-fun b!32843 () Bool)

(declare-fun e!21737 () Bool)

(declare-fun e!21734 () Bool)

(assert (=> b!32843 (= e!21737 (not e!21734))))

(declare-fun res!28093 () Bool)

(assert (=> b!32843 (=> res!28093 e!21734)))

(declare-fun i!635 () (_ BitVec 64))

(declare-fun to!314 () (_ BitVec 64))

(assert (=> b!32843 (= res!28093 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1412)

(declare-fun isPrefixOf!0 (BitStream!1412 BitStream!1412) Bool)

(assert (=> b!32843 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!48518 () Unit!2475)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1412) Unit!2475)

(assert (=> b!32843 (= lt!48518 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!48519 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!32843 (= lt!48519 (bitIndex!0 (size!810 (buf!1138 thiss!1379)) (currentByte!2505 thiss!1379) (currentBit!2500 thiss!1379)))))

(declare-fun b!32844 () Bool)

(declare-fun res!28097 () Bool)

(assert (=> b!32844 (=> res!28097 e!21745)))

(assert (=> b!32844 (= res!28097 (not (invariant!0 (currentBit!2500 (_2!1764 lt!48525)) (currentByte!2505 (_2!1764 lt!48525)) (size!810 (buf!1138 (_2!1764 lt!48525))))))))

(declare-fun b!32845 () Bool)

(declare-fun e!21736 () Bool)

(assert (=> b!32845 (= e!21736 e!21745)))

(declare-fun res!28089 () Bool)

(assert (=> b!32845 (=> res!28089 e!21745)))

(assert (=> b!32845 (= res!28089 (not (= (size!810 (buf!1138 (_2!1764 lt!48525))) (size!810 (buf!1138 (_2!1764 lt!48524))))))))

(declare-fun e!21743 () Bool)

(assert (=> b!32845 e!21743))

(declare-fun res!28084 () Bool)

(assert (=> b!32845 (=> (not res!28084) (not e!21743))))

(assert (=> b!32845 (= res!28084 (= (size!810 (buf!1138 (_2!1764 lt!48524))) (size!810 (buf!1138 thiss!1379))))))

(declare-fun res!28098 () Bool)

(assert (=> start!6900 (=> (not res!28098) (not e!21737))))

(declare-fun srcBuffer!2 () array!1836)

(assert (=> start!6900 (= res!28098 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!810 srcBuffer!2))))))))

(assert (=> start!6900 e!21737))

(assert (=> start!6900 true))

(declare-fun array_inv!759 (array!1836) Bool)

(assert (=> start!6900 (array_inv!759 srcBuffer!2)))

(declare-fun e!21735 () Bool)

(declare-fun inv!12 (BitStream!1412) Bool)

(assert (=> start!6900 (and (inv!12 thiss!1379) e!21735)))

(declare-fun lt!48522 () (_ BitVec 64))

(declare-fun b!32846 () Bool)

(assert (=> b!32846 (= e!21743 (= lt!48522 (bvsub (bvsub (bvadd (bitIndex!0 (size!810 (buf!1138 (_2!1764 lt!48525))) (currentByte!2505 (_2!1764 lt!48525)) (currentBit!2500 (_2!1764 lt!48525))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun b!32847 () Bool)

(declare-fun e!21740 () Bool)

(assert (=> b!32847 (= e!21740 true)))

(declare-datatypes ((List!407 0))(
  ( (Nil!404) (Cons!403 (h!522 Bool) (t!1157 List!407)) )
))
(declare-fun lt!48532 () List!407)

(declare-fun lt!48526 () List!407)

(declare-fun tail!124 (List!407) List!407)

(assert (=> b!32847 (= lt!48532 (tail!124 lt!48526))))

(declare-datatypes ((tuple2!3356 0))(
  ( (tuple2!3357 (_1!1765 BitStream!1412) (_2!1765 BitStream!1412)) )
))
(declare-fun lt!48528 () tuple2!3356)

(declare-fun lt!48520 () Unit!2475)

(declare-fun lt!48531 () tuple2!3356)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1412 BitStream!1412 BitStream!1412 BitStream!1412 (_ BitVec 64) List!407) Unit!2475)

(assert (=> b!32847 (= lt!48520 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1764 lt!48524) (_2!1764 lt!48524) (_1!1765 lt!48528) (_1!1765 lt!48531) (bvsub to!314 i!635) lt!48526))))

(declare-fun b!32848 () Bool)

(declare-fun res!28096 () Bool)

(assert (=> b!32848 (=> (not res!28096) (not e!21737))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!32848 (= res!28096 (validate_offset_bits!1 ((_ sign_extend 32) (size!810 (buf!1138 thiss!1379))) ((_ sign_extend 32) (currentByte!2505 thiss!1379)) ((_ sign_extend 32) (currentBit!2500 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!32849 () Bool)

(declare-fun e!21744 () Bool)

(assert (=> b!32849 (= e!21744 e!21736)))

(declare-fun res!28087 () Bool)

(assert (=> b!32849 (=> res!28087 e!21736)))

(assert (=> b!32849 (= res!28087 (not (= lt!48522 (bvsub (bvadd lt!48519 to!314) i!635))))))

(assert (=> b!32849 (= lt!48522 (bitIndex!0 (size!810 (buf!1138 (_2!1764 lt!48524))) (currentByte!2505 (_2!1764 lt!48524)) (currentBit!2500 (_2!1764 lt!48524))))))

(declare-fun e!21741 () Bool)

(declare-fun b!32850 () Bool)

(declare-fun lt!48527 () tuple2!3356)

(declare-fun head!244 (List!407) Bool)

(declare-fun byteArrayBitContentToList!0 (BitStream!1412 array!1836 (_ BitVec 64) (_ BitVec 64)) List!407)

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1412 BitStream!1412 (_ BitVec 64)) List!407)

(assert (=> b!32850 (= e!21741 (= (head!244 (byteArrayBitContentToList!0 (_2!1764 lt!48525) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!244 (bitStreamReadBitsIntoList!0 (_2!1764 lt!48525) (_1!1765 lt!48527) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!32851 () Bool)

(assert (=> b!32851 (= e!21745 e!21740)))

(declare-fun res!28086 () Bool)

(assert (=> b!32851 (=> res!28086 e!21740)))

(assert (=> b!32851 (= res!28086 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!48517 () (_ BitVec 64))

(assert (=> b!32851 (= lt!48532 (bitStreamReadBitsIntoList!0 (_2!1764 lt!48524) (_1!1765 lt!48531) lt!48517))))

(assert (=> b!32851 (= lt!48526 (bitStreamReadBitsIntoList!0 (_2!1764 lt!48524) (_1!1765 lt!48528) (bvsub to!314 i!635)))))

(assert (=> b!32851 (validate_offset_bits!1 ((_ sign_extend 32) (size!810 (buf!1138 (_2!1764 lt!48524)))) ((_ sign_extend 32) (currentByte!2505 (_2!1764 lt!48525))) ((_ sign_extend 32) (currentBit!2500 (_2!1764 lt!48525))) lt!48517)))

(declare-fun lt!48523 () Unit!2475)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1412 array!1836 (_ BitVec 64)) Unit!2475)

(assert (=> b!32851 (= lt!48523 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1764 lt!48525) (buf!1138 (_2!1764 lt!48524)) lt!48517))))

(declare-fun reader!0 (BitStream!1412 BitStream!1412) tuple2!3356)

(assert (=> b!32851 (= lt!48531 (reader!0 (_2!1764 lt!48525) (_2!1764 lt!48524)))))

(assert (=> b!32851 (validate_offset_bits!1 ((_ sign_extend 32) (size!810 (buf!1138 (_2!1764 lt!48524)))) ((_ sign_extend 32) (currentByte!2505 thiss!1379)) ((_ sign_extend 32) (currentBit!2500 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!48521 () Unit!2475)

(assert (=> b!32851 (= lt!48521 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1138 (_2!1764 lt!48524)) (bvsub to!314 i!635)))))

(assert (=> b!32851 (= lt!48528 (reader!0 thiss!1379 (_2!1764 lt!48524)))))

(declare-fun b!32852 () Bool)

(assert (=> b!32852 (= e!21735 (array_inv!759 (buf!1138 thiss!1379)))))

(declare-fun b!32853 () Bool)

(declare-fun res!28091 () Bool)

(assert (=> b!32853 (=> res!28091 e!21736)))

(assert (=> b!32853 (= res!28091 (not (= (size!810 (buf!1138 thiss!1379)) (size!810 (buf!1138 (_2!1764 lt!48524))))))))

(declare-fun b!32854 () Bool)

(declare-fun res!28090 () Bool)

(assert (=> b!32854 (=> res!28090 e!21740)))

(declare-fun length!133 (List!407) Int)

(assert (=> b!32854 (= res!28090 (<= (length!133 lt!48526) 0))))

(declare-fun b!32855 () Bool)

(declare-fun e!21742 () Bool)

(assert (=> b!32855 (= e!21734 e!21742)))

(declare-fun res!28094 () Bool)

(assert (=> b!32855 (=> res!28094 e!21742)))

(assert (=> b!32855 (= res!28094 (not (isPrefixOf!0 thiss!1379 (_2!1764 lt!48525))))))

(assert (=> b!32855 (validate_offset_bits!1 ((_ sign_extend 32) (size!810 (buf!1138 (_2!1764 lt!48525)))) ((_ sign_extend 32) (currentByte!2505 (_2!1764 lt!48525))) ((_ sign_extend 32) (currentBit!2500 (_2!1764 lt!48525))) lt!48517)))

(assert (=> b!32855 (= lt!48517 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48529 () Unit!2475)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1412 BitStream!1412 (_ BitVec 64) (_ BitVec 64)) Unit!2475)

(assert (=> b!32855 (= lt!48529 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1764 lt!48525) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1412 (_ BitVec 8) (_ BitVec 32)) tuple2!3354)

(assert (=> b!32855 (= lt!48525 (appendBitFromByte!0 thiss!1379 (select (arr!1285 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!32856 () Bool)

(assert (=> b!32856 (= e!21742 e!21744)))

(declare-fun res!28088 () Bool)

(assert (=> b!32856 (=> res!28088 e!21744)))

(assert (=> b!32856 (= res!28088 (not (isPrefixOf!0 (_2!1764 lt!48525) (_2!1764 lt!48524))))))

(assert (=> b!32856 (isPrefixOf!0 thiss!1379 (_2!1764 lt!48524))))

(declare-fun lt!48516 () Unit!2475)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1412 BitStream!1412 BitStream!1412) Unit!2475)

(assert (=> b!32856 (= lt!48516 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1764 lt!48525) (_2!1764 lt!48524)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1412 array!1836 (_ BitVec 64) (_ BitVec 64)) tuple2!3354)

(assert (=> b!32856 (= lt!48524 (appendBitsMSBFirstLoop!0 (_2!1764 lt!48525) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(assert (=> b!32856 e!21741))

(declare-fun res!28085 () Bool)

(assert (=> b!32856 (=> (not res!28085) (not e!21741))))

(assert (=> b!32856 (= res!28085 (validate_offset_bits!1 ((_ sign_extend 32) (size!810 (buf!1138 (_2!1764 lt!48525)))) ((_ sign_extend 32) (currentByte!2505 thiss!1379)) ((_ sign_extend 32) (currentBit!2500 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!48530 () Unit!2475)

(assert (=> b!32856 (= lt!48530 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1138 (_2!1764 lt!48525)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> b!32856 (= lt!48527 (reader!0 thiss!1379 (_2!1764 lt!48525)))))

(declare-fun b!32857 () Bool)

(declare-fun res!28092 () Bool)

(assert (=> b!32857 (=> res!28092 e!21736)))

(assert (=> b!32857 (= res!28092 (not (invariant!0 (currentBit!2500 (_2!1764 lt!48524)) (currentByte!2505 (_2!1764 lt!48524)) (size!810 (buf!1138 (_2!1764 lt!48524))))))))

(assert (= (and start!6900 res!28098) b!32848))

(assert (= (and b!32848 res!28096) b!32843))

(assert (= (and b!32843 (not res!28093)) b!32855))

(assert (= (and b!32855 (not res!28094)) b!32856))

(assert (= (and b!32856 res!28085) b!32850))

(assert (= (and b!32856 (not res!28088)) b!32849))

(assert (= (and b!32849 (not res!28087)) b!32857))

(assert (= (and b!32857 (not res!28092)) b!32853))

(assert (= (and b!32853 (not res!28091)) b!32845))

(assert (= (and b!32845 res!28084) b!32846))

(assert (= (and b!32845 (not res!28089)) b!32844))

(assert (= (and b!32844 (not res!28097)) b!32842))

(assert (= (and b!32842 (not res!28095)) b!32851))

(assert (= (and b!32851 (not res!28086)) b!32854))

(assert (= (and b!32854 (not res!28090)) b!32847))

(assert (= start!6900 b!32852))

(declare-fun m!48627 () Bool)

(assert (=> b!32852 m!48627))

(declare-fun m!48629 () Bool)

(assert (=> b!32847 m!48629))

(declare-fun m!48631 () Bool)

(assert (=> b!32847 m!48631))

(declare-fun m!48633 () Bool)

(assert (=> b!32848 m!48633))

(declare-fun m!48635 () Bool)

(assert (=> b!32850 m!48635))

(assert (=> b!32850 m!48635))

(declare-fun m!48637 () Bool)

(assert (=> b!32850 m!48637))

(declare-fun m!48639 () Bool)

(assert (=> b!32850 m!48639))

(assert (=> b!32850 m!48639))

(declare-fun m!48641 () Bool)

(assert (=> b!32850 m!48641))

(declare-fun m!48643 () Bool)

(assert (=> b!32843 m!48643))

(declare-fun m!48645 () Bool)

(assert (=> b!32843 m!48645))

(declare-fun m!48647 () Bool)

(assert (=> b!32843 m!48647))

(declare-fun m!48649 () Bool)

(assert (=> start!6900 m!48649))

(declare-fun m!48651 () Bool)

(assert (=> start!6900 m!48651))

(declare-fun m!48653 () Bool)

(assert (=> b!32846 m!48653))

(declare-fun m!48655 () Bool)

(assert (=> b!32844 m!48655))

(declare-fun m!48657 () Bool)

(assert (=> b!32849 m!48657))

(declare-fun m!48659 () Bool)

(assert (=> b!32842 m!48659))

(declare-fun m!48661 () Bool)

(assert (=> b!32855 m!48661))

(declare-fun m!48663 () Bool)

(assert (=> b!32855 m!48663))

(declare-fun m!48665 () Bool)

(assert (=> b!32855 m!48665))

(declare-fun m!48667 () Bool)

(assert (=> b!32855 m!48667))

(assert (=> b!32855 m!48663))

(declare-fun m!48669 () Bool)

(assert (=> b!32855 m!48669))

(declare-fun m!48671 () Bool)

(assert (=> b!32856 m!48671))

(declare-fun m!48673 () Bool)

(assert (=> b!32856 m!48673))

(declare-fun m!48675 () Bool)

(assert (=> b!32856 m!48675))

(declare-fun m!48677 () Bool)

(assert (=> b!32856 m!48677))

(declare-fun m!48679 () Bool)

(assert (=> b!32856 m!48679))

(declare-fun m!48681 () Bool)

(assert (=> b!32856 m!48681))

(declare-fun m!48683 () Bool)

(assert (=> b!32856 m!48683))

(declare-fun m!48685 () Bool)

(assert (=> b!32857 m!48685))

(declare-fun m!48687 () Bool)

(assert (=> b!32851 m!48687))

(declare-fun m!48689 () Bool)

(assert (=> b!32851 m!48689))

(declare-fun m!48691 () Bool)

(assert (=> b!32851 m!48691))

(declare-fun m!48693 () Bool)

(assert (=> b!32851 m!48693))

(declare-fun m!48695 () Bool)

(assert (=> b!32851 m!48695))

(declare-fun m!48697 () Bool)

(assert (=> b!32851 m!48697))

(declare-fun m!48699 () Bool)

(assert (=> b!32851 m!48699))

(declare-fun m!48701 () Bool)

(assert (=> b!32851 m!48701))

(declare-fun m!48703 () Bool)

(assert (=> b!32854 m!48703))

(push 1)

