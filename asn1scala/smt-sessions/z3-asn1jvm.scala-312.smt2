; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!6628 () Bool)

(assert start!6628)

(declare-datatypes ((array!1798 0))(
  ( (array!1799 (arr!1257 (Array (_ BitVec 32) (_ BitVec 8))) (size!788 (_ BitVec 32))) )
))
(declare-fun srcBuffer!2 () array!1798)

(declare-fun e!20676 () Bool)

(declare-datatypes ((BitStream!1380 0))(
  ( (BitStream!1381 (buf!1116 array!1798) (currentByte!2471 (_ BitVec 32)) (currentBit!2466 (_ BitVec 32))) )
))
(declare-datatypes ((Unit!2383 0))(
  ( (Unit!2384) )
))
(declare-datatypes ((tuple2!3242 0))(
  ( (tuple2!3243 (_1!1708 Unit!2383) (_2!1708 BitStream!1380)) )
))
(declare-fun lt!45625 () tuple2!3242)

(declare-fun i!635 () (_ BitVec 64))

(declare-fun b!31129 () Bool)

(declare-fun to!314 () (_ BitVec 64))

(declare-datatypes ((List!391 0))(
  ( (Nil!388) (Cons!387 (h!506 Bool) (t!1141 List!391)) )
))
(declare-fun byteArrayBitContentToList!0 (BitStream!1380 array!1798 (_ BitVec 64) (_ BitVec 64)) List!391)

(assert (=> b!31129 (= e!20676 (not (= (byteArrayBitContentToList!0 (_2!1708 lt!45625) srcBuffer!2 i!635 (bvsub to!314 i!635)) Nil!388)))))

(declare-fun b!31130 () Bool)

(declare-fun e!20678 () Bool)

(declare-fun e!20682 () Bool)

(assert (=> b!31130 (= e!20678 (not e!20682))))

(declare-fun res!26701 () Bool)

(assert (=> b!31130 (=> res!26701 e!20682)))

(assert (=> b!31130 (= res!26701 (bvsge i!635 to!314))))

(declare-fun thiss!1379 () BitStream!1380)

(declare-fun isPrefixOf!0 (BitStream!1380 BitStream!1380) Bool)

(assert (=> b!31130 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!45637 () Unit!2383)

(declare-fun lemmaIsPrefixRefl!0 (BitStream!1380) Unit!2383)

(assert (=> b!31130 (= lt!45637 (lemmaIsPrefixRefl!0 thiss!1379))))

(declare-fun lt!45640 () (_ BitVec 64))

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!31130 (= lt!45640 (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379)))))

(declare-fun b!31131 () Bool)

(declare-fun e!20681 () Bool)

(declare-fun e!20670 () Bool)

(assert (=> b!31131 (= e!20681 e!20670)))

(declare-fun res!26697 () Bool)

(assert (=> b!31131 (=> res!26697 e!20670)))

(declare-fun lt!45631 () (_ BitVec 64))

(assert (=> b!31131 (= res!26697 (not (= lt!45631 (bvsub (bvadd lt!45640 to!314) i!635))))))

(assert (=> b!31131 (= lt!45631 (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45625))) (currentByte!2471 (_2!1708 lt!45625)) (currentBit!2466 (_2!1708 lt!45625))))))

(declare-fun b!31132 () Bool)

(declare-fun res!26691 () Bool)

(assert (=> b!31132 (=> res!26691 e!20676)))

(declare-fun lt!45622 () List!391)

(declare-fun lt!45639 () Bool)

(declare-fun head!228 (List!391) Bool)

(assert (=> b!31132 (= res!26691 (not (= (head!228 lt!45622) lt!45639)))))

(declare-fun b!31133 () Bool)

(declare-fun e!20683 () Bool)

(assert (=> b!31133 (= e!20683 e!20681)))

(declare-fun res!26703 () Bool)

(assert (=> b!31133 (=> res!26703 e!20681)))

(declare-fun lt!45624 () tuple2!3242)

(assert (=> b!31133 (= res!26703 (not (isPrefixOf!0 (_2!1708 lt!45624) (_2!1708 lt!45625))))))

(assert (=> b!31133 (isPrefixOf!0 thiss!1379 (_2!1708 lt!45625))))

(declare-fun lt!45636 () Unit!2383)

(declare-fun lemmaIsPrefixTransitive!0 (BitStream!1380 BitStream!1380 BitStream!1380) Unit!2383)

(assert (=> b!31133 (= lt!45636 (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1708 lt!45624) (_2!1708 lt!45625)))))

(declare-fun appendBitsMSBFirstLoop!0 (BitStream!1380 array!1798 (_ BitVec 64) (_ BitVec 64)) tuple2!3242)

(assert (=> b!31133 (= lt!45625 (appendBitsMSBFirstLoop!0 (_2!1708 lt!45624) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun e!20675 () Bool)

(assert (=> b!31133 e!20675))

(declare-fun res!26704 () Bool)

(assert (=> b!31133 (=> (not res!26704) (not e!20675))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!31133 (= res!26704 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45624)))) ((_ sign_extend 32) (currentByte!2471 thiss!1379)) ((_ sign_extend 32) (currentBit!2466 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!45632 () Unit!2383)

(declare-fun validateOffsetBitsContentIrrelevancyLemma!0 (BitStream!1380 array!1798 (_ BitVec 64)) Unit!2383)

(assert (=> b!31133 (= lt!45632 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1116 (_2!1708 lt!45624)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-datatypes ((tuple2!3244 0))(
  ( (tuple2!3245 (_1!1709 BitStream!1380) (_2!1709 BitStream!1380)) )
))
(declare-fun lt!45629 () tuple2!3244)

(declare-fun reader!0 (BitStream!1380 BitStream!1380) tuple2!3244)

(assert (=> b!31133 (= lt!45629 (reader!0 thiss!1379 (_2!1708 lt!45624)))))

(declare-fun b!31134 () Bool)

(declare-fun res!26700 () Bool)

(declare-fun e!20674 () Bool)

(assert (=> b!31134 (=> res!26700 e!20674)))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> b!31134 (= res!26700 (not (invariant!0 (currentBit!2466 (_2!1708 lt!45624)) (currentByte!2471 (_2!1708 lt!45624)) (size!788 (buf!1116 (_2!1708 lt!45624))))))))

(declare-fun b!31135 () Bool)

(declare-fun e!20673 () Bool)

(declare-fun array_inv!743 (array!1798) Bool)

(assert (=> b!31135 (= e!20673 (array_inv!743 (buf!1116 thiss!1379)))))

(declare-fun b!31136 () Bool)

(declare-fun res!26702 () Bool)

(assert (=> b!31136 (=> res!26702 e!20674)))

(assert (=> b!31136 (= res!26702 (not (invariant!0 (currentBit!2466 (_2!1708 lt!45624)) (currentByte!2471 (_2!1708 lt!45624)) (size!788 (buf!1116 (_2!1708 lt!45625))))))))

(declare-fun b!31137 () Bool)

(declare-fun e!20677 () Bool)

(assert (=> b!31137 (= e!20677 e!20676)))

(declare-fun res!26695 () Bool)

(assert (=> b!31137 (=> res!26695 e!20676)))

(declare-fun lt!45630 () tuple2!3244)

(declare-fun bitAt!0 (array!1798 (_ BitVec 64)) Bool)

(assert (=> b!31137 (= res!26695 (not (= lt!45639 (bitAt!0 (buf!1116 (_1!1709 lt!45630)) lt!45640))))))

(declare-fun lt!45627 () tuple2!3244)

(assert (=> b!31137 (= lt!45639 (bitAt!0 (buf!1116 (_1!1709 lt!45627)) lt!45640))))

(declare-fun b!31138 () Bool)

(declare-fun res!26689 () Bool)

(declare-fun e!20672 () Bool)

(assert (=> b!31138 (=> res!26689 e!20672)))

(declare-fun length!117 (List!391) Int)

(assert (=> b!31138 (= res!26689 (<= (length!117 lt!45622) 0))))

(declare-fun b!31139 () Bool)

(assert (=> b!31139 (= e!20670 e!20674)))

(declare-fun res!26698 () Bool)

(assert (=> b!31139 (=> res!26698 e!20674)))

(assert (=> b!31139 (= res!26698 (not (= (size!788 (buf!1116 (_2!1708 lt!45624))) (size!788 (buf!1116 (_2!1708 lt!45625))))))))

(declare-fun e!20680 () Bool)

(assert (=> b!31139 e!20680))

(declare-fun res!26694 () Bool)

(assert (=> b!31139 (=> (not res!26694) (not e!20680))))

(assert (=> b!31139 (= res!26694 (= (size!788 (buf!1116 (_2!1708 lt!45625))) (size!788 (buf!1116 thiss!1379))))))

(declare-fun b!31140 () Bool)

(assert (=> b!31140 (= e!20674 e!20672)))

(declare-fun res!26696 () Bool)

(assert (=> b!31140 (=> res!26696 e!20672)))

(assert (=> b!31140 (= res!26696 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!45635 () List!391)

(declare-fun lt!45623 () (_ BitVec 64))

(declare-fun bitStreamReadBitsIntoList!0 (BitStream!1380 BitStream!1380 (_ BitVec 64)) List!391)

(assert (=> b!31140 (= lt!45635 (bitStreamReadBitsIntoList!0 (_2!1708 lt!45625) (_1!1709 lt!45630) lt!45623))))

(assert (=> b!31140 (= lt!45622 (bitStreamReadBitsIntoList!0 (_2!1708 lt!45625) (_1!1709 lt!45627) (bvsub to!314 i!635)))))

(assert (=> b!31140 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45625)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45624))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45624))) lt!45623)))

(declare-fun lt!45626 () Unit!2383)

(assert (=> b!31140 (= lt!45626 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1708 lt!45624) (buf!1116 (_2!1708 lt!45625)) lt!45623))))

(assert (=> b!31140 (= lt!45630 (reader!0 (_2!1708 lt!45624) (_2!1708 lt!45625)))))

(assert (=> b!31140 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45625)))) ((_ sign_extend 32) (currentByte!2471 thiss!1379)) ((_ sign_extend 32) (currentBit!2466 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!45633 () Unit!2383)

(assert (=> b!31140 (= lt!45633 (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1116 (_2!1708 lt!45625)) (bvsub to!314 i!635)))))

(assert (=> b!31140 (= lt!45627 (reader!0 thiss!1379 (_2!1708 lt!45625)))))

(declare-fun b!31141 () Bool)

(assert (=> b!31141 (= e!20682 e!20683)))

(declare-fun res!26692 () Bool)

(assert (=> b!31141 (=> res!26692 e!20683)))

(assert (=> b!31141 (= res!26692 (not (isPrefixOf!0 thiss!1379 (_2!1708 lt!45624))))))

(assert (=> b!31141 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45624)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45624))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45624))) lt!45623)))

(assert (=> b!31141 (= lt!45623 (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!45638 () Unit!2383)

(declare-fun validateOffsetBitsIneqLemma!0 (BitStream!1380 BitStream!1380 (_ BitVec 64) (_ BitVec 64)) Unit!2383)

(assert (=> b!31141 (= lt!45638 (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1708 lt!45624) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun appendBitFromByte!0 (BitStream!1380 (_ BitVec 8) (_ BitVec 32)) tuple2!3242)

(assert (=> b!31141 (= lt!45624 (appendBitFromByte!0 thiss!1379 (select (arr!1257 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun b!31142 () Bool)

(declare-fun res!26699 () Bool)

(assert (=> b!31142 (=> (not res!26699) (not e!20678))))

(assert (=> b!31142 (= res!26699 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 thiss!1379))) ((_ sign_extend 32) (currentByte!2471 thiss!1379)) ((_ sign_extend 32) (currentBit!2466 thiss!1379)) (bvsub to!314 i!635)))))

(declare-fun b!31143 () Bool)

(assert (=> b!31143 (= e!20672 e!20677)))

(declare-fun res!26706 () Bool)

(assert (=> b!31143 (=> res!26706 e!20677)))

(declare-fun lt!45628 () List!391)

(assert (=> b!31143 (= res!26706 (not (= lt!45628 lt!45635)))))

(assert (=> b!31143 (= lt!45635 lt!45628)))

(declare-fun tail!108 (List!391) List!391)

(assert (=> b!31143 (= lt!45628 (tail!108 lt!45622))))

(declare-fun lt!45634 () Unit!2383)

(declare-fun lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (BitStream!1380 BitStream!1380 BitStream!1380 BitStream!1380 (_ BitVec 64) List!391) Unit!2383)

(assert (=> b!31143 (= lt!45634 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1708 lt!45625) (_2!1708 lt!45625) (_1!1709 lt!45627) (_1!1709 lt!45630) (bvsub to!314 i!635) lt!45622))))

(declare-fun b!31144 () Bool)

(declare-fun res!26690 () Bool)

(assert (=> b!31144 (=> res!26690 e!20670)))

(assert (=> b!31144 (= res!26690 (not (= (size!788 (buf!1116 thiss!1379)) (size!788 (buf!1116 (_2!1708 lt!45625))))))))

(declare-fun res!26705 () Bool)

(assert (=> start!6628 (=> (not res!26705) (not e!20678))))

(assert (=> start!6628 (= res!26705 (and (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsge i!635 #b0000000000000000000000000000000000000000000000000000000000000000) (bvsle i!635 to!314) (bvslt i!635 (bvsub #b0111111111111111111111111111111111111111111111111111111111111111 to!314)) (bvslt i!635 #b0111111111111111111111111111111111111111111111111111111111111111) (bvslt to!314 #b0111111111111111111111111111111111111111111111111111111111111111) (bvsle to!314 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!788 srcBuffer!2))))))))

(assert (=> start!6628 e!20678))

(assert (=> start!6628 true))

(assert (=> start!6628 (array_inv!743 srcBuffer!2)))

(declare-fun inv!12 (BitStream!1380) Bool)

(assert (=> start!6628 (and (inv!12 thiss!1379) e!20673)))

(declare-fun b!31145 () Bool)

(declare-fun res!26693 () Bool)

(assert (=> b!31145 (=> res!26693 e!20670)))

(assert (=> b!31145 (= res!26693 (not (invariant!0 (currentBit!2466 (_2!1708 lt!45625)) (currentByte!2471 (_2!1708 lt!45625)) (size!788 (buf!1116 (_2!1708 lt!45625))))))))

(declare-fun b!31146 () Bool)

(assert (=> b!31146 (= e!20675 (= (head!228 (byteArrayBitContentToList!0 (_2!1708 lt!45624) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (head!228 (bitStreamReadBitsIntoList!0 (_2!1708 lt!45624) (_1!1709 lt!45629) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(declare-fun b!31147 () Bool)

(assert (=> b!31147 (= e!20680 (= lt!45631 (bvsub (bvsub (bvadd (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45624))) (currentByte!2471 (_2!1708 lt!45624)) (currentBit!2466 (_2!1708 lt!45624))) to!314) i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and start!6628 res!26705) b!31142))

(assert (= (and b!31142 res!26699) b!31130))

(assert (= (and b!31130 (not res!26701)) b!31141))

(assert (= (and b!31141 (not res!26692)) b!31133))

(assert (= (and b!31133 res!26704) b!31146))

(assert (= (and b!31133 (not res!26703)) b!31131))

(assert (= (and b!31131 (not res!26697)) b!31145))

(assert (= (and b!31145 (not res!26693)) b!31144))

(assert (= (and b!31144 (not res!26690)) b!31139))

(assert (= (and b!31139 res!26694) b!31147))

(assert (= (and b!31139 (not res!26698)) b!31134))

(assert (= (and b!31134 (not res!26700)) b!31136))

(assert (= (and b!31136 (not res!26702)) b!31140))

(assert (= (and b!31140 (not res!26696)) b!31138))

(assert (= (and b!31138 (not res!26689)) b!31143))

(assert (= (and b!31143 (not res!26706)) b!31137))

(assert (= (and b!31137 (not res!26695)) b!31132))

(assert (= (and b!31132 (not res!26691)) b!31129))

(assert (= start!6628 b!31135))

(declare-fun m!45689 () Bool)

(assert (=> b!31140 m!45689))

(declare-fun m!45691 () Bool)

(assert (=> b!31140 m!45691))

(declare-fun m!45693 () Bool)

(assert (=> b!31140 m!45693))

(declare-fun m!45695 () Bool)

(assert (=> b!31140 m!45695))

(declare-fun m!45697 () Bool)

(assert (=> b!31140 m!45697))

(declare-fun m!45699 () Bool)

(assert (=> b!31140 m!45699))

(declare-fun m!45701 () Bool)

(assert (=> b!31140 m!45701))

(declare-fun m!45703 () Bool)

(assert (=> b!31140 m!45703))

(declare-fun m!45705 () Bool)

(assert (=> b!31138 m!45705))

(declare-fun m!45707 () Bool)

(assert (=> b!31133 m!45707))

(declare-fun m!45709 () Bool)

(assert (=> b!31133 m!45709))

(declare-fun m!45711 () Bool)

(assert (=> b!31133 m!45711))

(declare-fun m!45713 () Bool)

(assert (=> b!31133 m!45713))

(declare-fun m!45715 () Bool)

(assert (=> b!31133 m!45715))

(declare-fun m!45717 () Bool)

(assert (=> b!31133 m!45717))

(declare-fun m!45719 () Bool)

(assert (=> b!31133 m!45719))

(declare-fun m!45721 () Bool)

(assert (=> b!31146 m!45721))

(assert (=> b!31146 m!45721))

(declare-fun m!45723 () Bool)

(assert (=> b!31146 m!45723))

(declare-fun m!45725 () Bool)

(assert (=> b!31146 m!45725))

(assert (=> b!31146 m!45725))

(declare-fun m!45727 () Bool)

(assert (=> b!31146 m!45727))

(declare-fun m!45729 () Bool)

(assert (=> b!31136 m!45729))

(declare-fun m!45731 () Bool)

(assert (=> b!31132 m!45731))

(declare-fun m!45733 () Bool)

(assert (=> b!31135 m!45733))

(declare-fun m!45735 () Bool)

(assert (=> b!31141 m!45735))

(declare-fun m!45737 () Bool)

(assert (=> b!31141 m!45737))

(declare-fun m!45739 () Bool)

(assert (=> b!31141 m!45739))

(declare-fun m!45741 () Bool)

(assert (=> b!31141 m!45741))

(assert (=> b!31141 m!45737))

(declare-fun m!45743 () Bool)

(assert (=> b!31141 m!45743))

(declare-fun m!45745 () Bool)

(assert (=> start!6628 m!45745))

(declare-fun m!45747 () Bool)

(assert (=> start!6628 m!45747))

(declare-fun m!45749 () Bool)

(assert (=> b!31142 m!45749))

(declare-fun m!45751 () Bool)

(assert (=> b!31129 m!45751))

(declare-fun m!45753 () Bool)

(assert (=> b!31131 m!45753))

(declare-fun m!45755 () Bool)

(assert (=> b!31134 m!45755))

(declare-fun m!45757 () Bool)

(assert (=> b!31147 m!45757))

(declare-fun m!45759 () Bool)

(assert (=> b!31145 m!45759))

(declare-fun m!45761 () Bool)

(assert (=> b!31137 m!45761))

(declare-fun m!45763 () Bool)

(assert (=> b!31137 m!45763))

(declare-fun m!45765 () Bool)

(assert (=> b!31143 m!45765))

(declare-fun m!45767 () Bool)

(assert (=> b!31143 m!45767))

(declare-fun m!45769 () Bool)

(assert (=> b!31130 m!45769))

(declare-fun m!45771 () Bool)

(assert (=> b!31130 m!45771))

(declare-fun m!45773 () Bool)

(assert (=> b!31130 m!45773))

(check-sat (not b!31141) (not b!31132) (not b!31131) (not b!31143) (not b!31147) (not b!31129) (not start!6628) (not b!31146) (not b!31133) (not b!31138) (not b!31142) (not b!31130) (not b!31134) (not b!31136) (not b!31135) (not b!31137) (not b!31140) (not b!31145))
(check-sat)
(get-model)

(declare-fun d!9054 () Bool)

(assert (=> d!9054 (= (array_inv!743 (buf!1116 thiss!1379)) (bvsge (size!788 (buf!1116 thiss!1379)) #b00000000000000000000000000000000))))

(assert (=> b!31135 d!9054))

(declare-fun d!9056 () Bool)

(assert (=> d!9056 (= (head!228 (byteArrayBitContentToList!0 (_2!1708 lt!45624) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)) (h!506 (byteArrayBitContentToList!0 (_2!1708 lt!45624) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!31146 d!9056))

(declare-fun d!9058 () Bool)

(declare-fun c!2094 () Bool)

(assert (=> d!9058 (= c!2094 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!20728 () List!391)

(assert (=> d!9058 (= (byteArrayBitContentToList!0 (_2!1708 lt!45624) srcBuffer!2 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) e!20728)))

(declare-fun b!31209 () Bool)

(assert (=> b!31209 (= e!20728 Nil!388)))

(declare-fun b!31210 () Bool)

(assert (=> b!31210 (= e!20728 (Cons!387 (not (= (bvand ((_ sign_extend 24) (select (arr!1257 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1708 lt!45624) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9058 c!2094) b!31209))

(assert (= (and d!9058 (not c!2094)) b!31210))

(assert (=> b!31210 m!45737))

(declare-fun m!45861 () Bool)

(assert (=> b!31210 m!45861))

(declare-fun m!45863 () Bool)

(assert (=> b!31210 m!45863))

(assert (=> b!31146 d!9058))

(declare-fun d!9060 () Bool)

(assert (=> d!9060 (= (head!228 (bitStreamReadBitsIntoList!0 (_2!1708 lt!45624) (_1!1709 lt!45629) #b0000000000000000000000000000000000000000000000000000000000000001)) (h!506 (bitStreamReadBitsIntoList!0 (_2!1708 lt!45624) (_1!1709 lt!45629) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (=> b!31146 d!9060))

(declare-fun lt!45706 () (_ BitVec 64))

(declare-fun b!31220 () Bool)

(declare-datatypes ((tuple2!3250 0))(
  ( (tuple2!3251 (_1!1712 Bool) (_2!1712 BitStream!1380)) )
))
(declare-fun lt!45704 () tuple2!3250)

(declare-datatypes ((tuple2!3252 0))(
  ( (tuple2!3253 (_1!1713 List!391) (_2!1713 BitStream!1380)) )
))
(declare-fun e!20733 () tuple2!3252)

(assert (=> b!31220 (= e!20733 (tuple2!3253 (Cons!387 (_1!1712 lt!45704) (bitStreamReadBitsIntoList!0 (_2!1708 lt!45624) (_2!1712 lt!45704) (bvsub #b0000000000000000000000000000000000000000000000000000000000000001 lt!45706))) (_2!1712 lt!45704)))))

(declare-fun readBit!0 (BitStream!1380) tuple2!3250)

(assert (=> b!31220 (= lt!45704 (readBit!0 (_1!1709 lt!45629)))))

(assert (=> b!31220 (= lt!45706 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!31219 () Bool)

(assert (=> b!31219 (= e!20733 (tuple2!3253 Nil!388 (_1!1709 lt!45629)))))

(declare-fun b!31222 () Bool)

(declare-fun e!20734 () Bool)

(declare-fun lt!45705 () List!391)

(assert (=> b!31222 (= e!20734 (> (length!117 lt!45705) 0))))

(declare-fun d!9062 () Bool)

(assert (=> d!9062 e!20734))

(declare-fun c!2100 () Bool)

(assert (=> d!9062 (= c!2100 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9062 (= lt!45705 (_1!1713 e!20733))))

(declare-fun c!2099 () Bool)

(assert (=> d!9062 (= c!2099 (= #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9062 (bvsge #b0000000000000000000000000000000000000000000000000000000000000001 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9062 (= (bitStreamReadBitsIntoList!0 (_2!1708 lt!45624) (_1!1709 lt!45629) #b0000000000000000000000000000000000000000000000000000000000000001) lt!45705)))

(declare-fun b!31221 () Bool)

(declare-fun isEmpty!84 (List!391) Bool)

(assert (=> b!31221 (= e!20734 (isEmpty!84 lt!45705))))

(assert (= (and d!9062 c!2099) b!31219))

(assert (= (and d!9062 (not c!2099)) b!31220))

(assert (= (and d!9062 c!2100) b!31221))

(assert (= (and d!9062 (not c!2100)) b!31222))

(declare-fun m!45865 () Bool)

(assert (=> b!31220 m!45865))

(declare-fun m!45867 () Bool)

(assert (=> b!31220 m!45867))

(declare-fun m!45869 () Bool)

(assert (=> b!31222 m!45869))

(declare-fun m!45871 () Bool)

(assert (=> b!31221 m!45871))

(assert (=> b!31146 d!9062))

(declare-fun d!9064 () Bool)

(assert (=> d!9064 (= (invariant!0 (currentBit!2466 (_2!1708 lt!45625)) (currentByte!2471 (_2!1708 lt!45625)) (size!788 (buf!1116 (_2!1708 lt!45625)))) (and (bvsge (currentBit!2466 (_2!1708 lt!45625)) #b00000000000000000000000000000000) (bvslt (currentBit!2466 (_2!1708 lt!45625)) #b00000000000000000000000000001000) (bvsge (currentByte!2471 (_2!1708 lt!45625)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2471 (_2!1708 lt!45625)) (size!788 (buf!1116 (_2!1708 lt!45625)))) (and (= (currentBit!2466 (_2!1708 lt!45625)) #b00000000000000000000000000000000) (= (currentByte!2471 (_2!1708 lt!45625)) (size!788 (buf!1116 (_2!1708 lt!45625))))))))))

(assert (=> b!31145 d!9064))

(declare-fun d!9066 () Bool)

(assert (=> d!9066 (= (invariant!0 (currentBit!2466 (_2!1708 lt!45624)) (currentByte!2471 (_2!1708 lt!45624)) (size!788 (buf!1116 (_2!1708 lt!45624)))) (and (bvsge (currentBit!2466 (_2!1708 lt!45624)) #b00000000000000000000000000000000) (bvslt (currentBit!2466 (_2!1708 lt!45624)) #b00000000000000000000000000001000) (bvsge (currentByte!2471 (_2!1708 lt!45624)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2471 (_2!1708 lt!45624)) (size!788 (buf!1116 (_2!1708 lt!45624)))) (and (= (currentBit!2466 (_2!1708 lt!45624)) #b00000000000000000000000000000000) (= (currentByte!2471 (_2!1708 lt!45624)) (size!788 (buf!1116 (_2!1708 lt!45624))))))))))

(assert (=> b!31134 d!9066))

(declare-fun d!9068 () Bool)

(declare-fun res!26767 () Bool)

(declare-fun e!20740 () Bool)

(assert (=> d!9068 (=> (not res!26767) (not e!20740))))

(assert (=> d!9068 (= res!26767 (= (size!788 (buf!1116 thiss!1379)) (size!788 (buf!1116 (_2!1708 lt!45625)))))))

(assert (=> d!9068 (= (isPrefixOf!0 thiss!1379 (_2!1708 lt!45625)) e!20740)))

(declare-fun b!31229 () Bool)

(declare-fun res!26768 () Bool)

(assert (=> b!31229 (=> (not res!26768) (not e!20740))))

(assert (=> b!31229 (= res!26768 (bvsle (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379)) (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45625))) (currentByte!2471 (_2!1708 lt!45625)) (currentBit!2466 (_2!1708 lt!45625)))))))

(declare-fun b!31230 () Bool)

(declare-fun e!20739 () Bool)

(assert (=> b!31230 (= e!20740 e!20739)))

(declare-fun res!26769 () Bool)

(assert (=> b!31230 (=> res!26769 e!20739)))

(assert (=> b!31230 (= res!26769 (= (size!788 (buf!1116 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!31231 () Bool)

(declare-fun arrayBitRangesEq!0 (array!1798 array!1798 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!31231 (= e!20739 (arrayBitRangesEq!0 (buf!1116 thiss!1379) (buf!1116 (_2!1708 lt!45625)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379))))))

(assert (= (and d!9068 res!26767) b!31229))

(assert (= (and b!31229 res!26768) b!31230))

(assert (= (and b!31230 (not res!26769)) b!31231))

(assert (=> b!31229 m!45773))

(assert (=> b!31229 m!45753))

(assert (=> b!31231 m!45773))

(assert (=> b!31231 m!45773))

(declare-fun m!45873 () Bool)

(assert (=> b!31231 m!45873))

(assert (=> b!31133 d!9068))

(declare-fun d!9070 () Bool)

(assert (=> d!9070 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45624)))) ((_ sign_extend 32) (currentByte!2471 thiss!1379)) ((_ sign_extend 32) (currentBit!2466 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!45709 () Unit!2383)

(declare-fun choose!9 (BitStream!1380 array!1798 (_ BitVec 64) BitStream!1380) Unit!2383)

(assert (=> d!9070 (= lt!45709 (choose!9 thiss!1379 (buf!1116 (_2!1708 lt!45624)) #b0000000000000000000000000000000000000000000000000000000000000001 (BitStream!1381 (buf!1116 (_2!1708 lt!45624)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379))))))

(assert (=> d!9070 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1116 (_2!1708 lt!45624)) #b0000000000000000000000000000000000000000000000000000000000000001) lt!45709)))

(declare-fun bs!2510 () Bool)

(assert (= bs!2510 d!9070))

(assert (=> bs!2510 m!45711))

(declare-fun m!45875 () Bool)

(assert (=> bs!2510 m!45875))

(assert (=> b!31133 d!9070))

(declare-fun d!9072 () Bool)

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> d!9072 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45624)))) ((_ sign_extend 32) (currentByte!2471 thiss!1379)) ((_ sign_extend 32) (currentBit!2466 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45624)))) ((_ sign_extend 32) (currentByte!2471 thiss!1379)) ((_ sign_extend 32) (currentBit!2466 thiss!1379))) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun bs!2511 () Bool)

(assert (= bs!2511 d!9072))

(declare-fun m!45877 () Bool)

(assert (=> bs!2511 m!45877))

(assert (=> b!31133 d!9072))

(declare-fun b!31293 () Bool)

(declare-fun res!26822 () Bool)

(declare-fun e!20775 () Bool)

(assert (=> b!31293 (=> (not res!26822) (not e!20775))))

(declare-fun lt!45896 () tuple2!3242)

(assert (=> b!31293 (= res!26822 (= (size!788 (buf!1116 (_2!1708 lt!45624))) (size!788 (buf!1116 (_2!1708 lt!45896)))))))

(declare-fun b!31294 () Bool)

(declare-fun res!26823 () Bool)

(assert (=> b!31294 (=> (not res!26823) (not e!20775))))

(assert (=> b!31294 (= res!26823 (isPrefixOf!0 (_2!1708 lt!45624) (_2!1708 lt!45896)))))

(declare-fun b!31295 () Bool)

(declare-fun lt!45890 () tuple2!3244)

(assert (=> b!31295 (= e!20775 (= (bitStreamReadBitsIntoList!0 (_2!1708 lt!45896) (_1!1709 lt!45890) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))) (byteArrayBitContentToList!0 (_2!1708 lt!45896) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))))

(assert (=> b!31295 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31295 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!45883 () Unit!2383)

(declare-fun lt!45865 () Unit!2383)

(assert (=> b!31295 (= lt!45883 lt!45865)))

(declare-fun lt!45866 () (_ BitVec 64))

(assert (=> b!31295 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45896)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45624))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45624))) lt!45866)))

(assert (=> b!31295 (= lt!45865 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1708 lt!45624) (buf!1116 (_2!1708 lt!45896)) lt!45866))))

(declare-fun e!20774 () Bool)

(assert (=> b!31295 e!20774))

(declare-fun res!26826 () Bool)

(assert (=> b!31295 (=> (not res!26826) (not e!20774))))

(assert (=> b!31295 (= res!26826 (and (= (size!788 (buf!1116 (_2!1708 lt!45624))) (size!788 (buf!1116 (_2!1708 lt!45896)))) (bvsge lt!45866 #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31295 (= lt!45866 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(assert (=> b!31295 (or (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31295 (= lt!45890 (reader!0 (_2!1708 lt!45624) (_2!1708 lt!45896)))))

(declare-fun b!31296 () Bool)

(declare-fun e!20773 () tuple2!3242)

(declare-fun Unit!2387 () Unit!2383)

(assert (=> b!31296 (= e!20773 (tuple2!3243 Unit!2387 (_2!1708 lt!45624)))))

(assert (=> b!31296 (= (size!788 (buf!1116 (_2!1708 lt!45624))) (size!788 (buf!1116 (_2!1708 lt!45624))))))

(declare-fun lt!45884 () Unit!2383)

(declare-fun Unit!2388 () Unit!2383)

(assert (=> b!31296 (= lt!45884 Unit!2388)))

(declare-fun call!403 () tuple2!3244)

(declare-fun checkByteArrayBitContent!0 (BitStream!1380 array!1798 array!1798 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(declare-datatypes ((tuple2!3254 0))(
  ( (tuple2!3255 (_1!1714 array!1798) (_2!1714 BitStream!1380)) )
))
(declare-fun readBits!0 (BitStream!1380 (_ BitVec 64)) tuple2!3254)

(assert (=> b!31296 (checkByteArrayBitContent!0 (_2!1708 lt!45624) srcBuffer!2 (_1!1714 (readBits!0 (_1!1709 call!403) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000000 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun b!31297 () Bool)

(assert (=> b!31297 (= e!20774 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45624)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45624))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45624))) lt!45866))))

(declare-fun d!9074 () Bool)

(assert (=> d!9074 e!20775))

(declare-fun res!26821 () Bool)

(assert (=> d!9074 (=> (not res!26821) (not e!20775))))

(declare-fun lt!45903 () (_ BitVec 64))

(assert (=> d!9074 (= res!26821 (= (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45896))) (currentByte!2471 (_2!1708 lt!45896)) (currentBit!2466 (_2!1708 lt!45896))) (bvsub lt!45903 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(assert (=> d!9074 (or (= (bvand lt!45903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45903 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45903 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun lt!45898 () (_ BitVec 64))

(assert (=> d!9074 (= lt!45903 (bvadd lt!45898 to!314))))

(assert (=> d!9074 (or (not (= (bvand lt!45898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand to!314 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!45898 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!45898 to!314) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9074 (= lt!45898 (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45624))) (currentByte!2471 (_2!1708 lt!45624)) (currentBit!2466 (_2!1708 lt!45624))))))

(assert (=> d!9074 (= lt!45896 e!20773)))

(declare-fun c!2106 () Bool)

(assert (=> d!9074 (= c!2106 (bvslt (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314))))

(declare-fun lt!45874 () Unit!2383)

(declare-fun lt!45891 () Unit!2383)

(assert (=> d!9074 (= lt!45874 lt!45891)))

(assert (=> d!9074 (isPrefixOf!0 (_2!1708 lt!45624) (_2!1708 lt!45624))))

(assert (=> d!9074 (= lt!45891 (lemmaIsPrefixRefl!0 (_2!1708 lt!45624)))))

(declare-fun lt!45906 () (_ BitVec 64))

(assert (=> d!9074 (= lt!45906 (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45624))) (currentByte!2471 (_2!1708 lt!45624)) (currentBit!2466 (_2!1708 lt!45624))))))

(assert (=> d!9074 (bvsge to!314 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9074 (= (appendBitsMSBFirstLoop!0 (_2!1708 lt!45624) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) to!314) lt!45896)))

(declare-fun b!31298 () Bool)

(declare-fun lt!45880 () tuple2!3242)

(declare-fun Unit!2389 () Unit!2383)

(assert (=> b!31298 (= e!20773 (tuple2!3243 Unit!2389 (_2!1708 lt!45880)))))

(declare-fun lt!45907 () tuple2!3242)

(assert (=> b!31298 (= lt!45907 (appendBitFromByte!0 (_2!1708 lt!45624) (select (arr!1257 srcBuffer!2) ((_ extract 31 0) (bvsdiv (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000001000))))))

(declare-fun lt!45879 () (_ BitVec 64))

(assert (=> b!31298 (= lt!45879 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!45867 () (_ BitVec 64))

(assert (=> b!31298 (= lt!45867 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!45872 () Unit!2383)

(assert (=> b!31298 (= lt!45872 (validateOffsetBitsIneqLemma!0 (_2!1708 lt!45624) (_2!1708 lt!45907) lt!45879 lt!45867))))

(assert (=> b!31298 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45907)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45907))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45907))) (bvsub lt!45879 lt!45867))))

(declare-fun lt!45900 () Unit!2383)

(assert (=> b!31298 (= lt!45900 lt!45872)))

(declare-fun lt!45901 () tuple2!3244)

(assert (=> b!31298 (= lt!45901 call!403)))

(declare-fun lt!45897 () (_ BitVec 64))

(assert (=> b!31298 (= lt!45897 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!45894 () Unit!2383)

(assert (=> b!31298 (= lt!45894 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1708 lt!45624) (buf!1116 (_2!1708 lt!45907)) lt!45897))))

(assert (=> b!31298 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45907)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45624))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45624))) lt!45897)))

(declare-fun lt!45904 () Unit!2383)

(assert (=> b!31298 (= lt!45904 lt!45894)))

(assert (=> b!31298 (= (head!228 (byteArrayBitContentToList!0 (_2!1708 lt!45907) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (head!228 (bitStreamReadBitsIntoList!0 (_2!1708 lt!45907) (_1!1709 lt!45901) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!45873 () Unit!2383)

(declare-fun Unit!2390 () Unit!2383)

(assert (=> b!31298 (= lt!45873 Unit!2390)))

(assert (=> b!31298 (= lt!45880 (appendBitsMSBFirstLoop!0 (_2!1708 lt!45907) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) to!314))))

(declare-fun lt!45868 () Unit!2383)

(assert (=> b!31298 (= lt!45868 (lemmaIsPrefixTransitive!0 (_2!1708 lt!45624) (_2!1708 lt!45907) (_2!1708 lt!45880)))))

(assert (=> b!31298 (isPrefixOf!0 (_2!1708 lt!45624) (_2!1708 lt!45880))))

(declare-fun lt!45886 () Unit!2383)

(assert (=> b!31298 (= lt!45886 lt!45868)))

(assert (=> b!31298 (= (size!788 (buf!1116 (_2!1708 lt!45880))) (size!788 (buf!1116 (_2!1708 lt!45624))))))

(declare-fun lt!45888 () Unit!2383)

(declare-fun Unit!2391 () Unit!2383)

(assert (=> b!31298 (= lt!45888 Unit!2391)))

(assert (=> b!31298 (= (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45880))) (currentByte!2471 (_2!1708 lt!45880)) (currentBit!2466 (_2!1708 lt!45880))) (bvsub (bvadd (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45624))) (currentByte!2471 (_2!1708 lt!45624)) (currentBit!2466 (_2!1708 lt!45624))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!45893 () Unit!2383)

(declare-fun Unit!2392 () Unit!2383)

(assert (=> b!31298 (= lt!45893 Unit!2392)))

(assert (=> b!31298 (= (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45880))) (currentByte!2471 (_2!1708 lt!45880)) (currentBit!2466 (_2!1708 lt!45880))) (bvsub (bvsub (bvadd (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45907))) (currentByte!2471 (_2!1708 lt!45907)) (currentBit!2466 (_2!1708 lt!45907))) to!314) (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!45864 () Unit!2383)

(declare-fun Unit!2393 () Unit!2383)

(assert (=> b!31298 (= lt!45864 Unit!2393)))

(declare-fun lt!45870 () tuple2!3244)

(assert (=> b!31298 (= lt!45870 (reader!0 (_2!1708 lt!45624) (_2!1708 lt!45880)))))

(declare-fun lt!45905 () (_ BitVec 64))

(assert (=> b!31298 (= lt!45905 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!45869 () Unit!2383)

(assert (=> b!31298 (= lt!45869 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1708 lt!45624) (buf!1116 (_2!1708 lt!45880)) lt!45905))))

(assert (=> b!31298 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45880)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45624))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45624))) lt!45905)))

(declare-fun lt!45881 () Unit!2383)

(assert (=> b!31298 (= lt!45881 lt!45869)))

(declare-fun lt!45892 () tuple2!3244)

(assert (=> b!31298 (= lt!45892 (reader!0 (_2!1708 lt!45907) (_2!1708 lt!45880)))))

(declare-fun lt!45902 () (_ BitVec 64))

(assert (=> b!31298 (= lt!45902 (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun lt!45899 () Unit!2383)

(assert (=> b!31298 (= lt!45899 (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1708 lt!45907) (buf!1116 (_2!1708 lt!45880)) lt!45902))))

(assert (=> b!31298 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45880)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45907))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45907))) lt!45902)))

(declare-fun lt!45871 () Unit!2383)

(assert (=> b!31298 (= lt!45871 lt!45899)))

(declare-fun lt!45887 () List!391)

(assert (=> b!31298 (= lt!45887 (byteArrayBitContentToList!0 (_2!1708 lt!45880) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!45877 () List!391)

(assert (=> b!31298 (= lt!45877 (byteArrayBitContentToList!0 (_2!1708 lt!45880) srcBuffer!2 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!45885 () List!391)

(assert (=> b!31298 (= lt!45885 (bitStreamReadBitsIntoList!0 (_2!1708 lt!45880) (_1!1709 lt!45870) (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635))))))

(declare-fun lt!45876 () List!391)

(assert (=> b!31298 (= lt!45876 (bitStreamReadBitsIntoList!0 (_2!1708 lt!45880) (_1!1709 lt!45892) (bvsub (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(declare-fun lt!45878 () (_ BitVec 64))

(assert (=> b!31298 (= lt!45878 (bvsub to!314 (bvadd #b0000000000000000000000000000000000000000000000000000000000000001 i!635)))))

(declare-fun lt!45889 () Unit!2383)

(assert (=> b!31298 (= lt!45889 (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1708 lt!45880) (_2!1708 lt!45880) (_1!1709 lt!45870) (_1!1709 lt!45892) lt!45878 lt!45885))))

(assert (=> b!31298 (= (bitStreamReadBitsIntoList!0 (_2!1708 lt!45880) (_1!1709 lt!45892) (bvsub lt!45878 #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!108 lt!45885))))

(declare-fun lt!45895 () Unit!2383)

(assert (=> b!31298 (= lt!45895 lt!45889)))

(declare-fun lt!45875 () Unit!2383)

(declare-fun arrayBitRangesEqImpliesEq!0 (array!1798 array!1798 (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Unit!2383)

(assert (=> b!31298 (= lt!45875 (arrayBitRangesEqImpliesEq!0 (buf!1116 (_2!1708 lt!45907)) (buf!1116 (_2!1708 lt!45880)) #b0000000000000000000000000000000000000000000000000000000000000000 lt!45906 (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45907))) (currentByte!2471 (_2!1708 lt!45907)) (currentBit!2466 (_2!1708 lt!45907)))))))

(assert (=> b!31298 (= (bitAt!0 (buf!1116 (_2!1708 lt!45907)) lt!45906) (bitAt!0 (buf!1116 (_2!1708 lt!45880)) lt!45906))))

(declare-fun lt!45882 () Unit!2383)

(assert (=> b!31298 (= lt!45882 lt!45875)))

(declare-fun b!31299 () Bool)

(declare-fun res!26825 () Bool)

(assert (=> b!31299 (=> (not res!26825) (not e!20775))))

(assert (=> b!31299 (= res!26825 (invariant!0 (currentBit!2466 (_2!1708 lt!45896)) (currentByte!2471 (_2!1708 lt!45896)) (size!788 (buf!1116 (_2!1708 lt!45896)))))))

(declare-fun b!31300 () Bool)

(declare-fun res!26824 () Bool)

(assert (=> b!31300 (=> (not res!26824) (not e!20775))))

(assert (=> b!31300 (= res!26824 (= (size!788 (buf!1116 (_2!1708 lt!45896))) (size!788 (buf!1116 (_2!1708 lt!45624)))))))

(declare-fun bm!400 () Bool)

(assert (=> bm!400 (= call!403 (reader!0 (_2!1708 lt!45624) (ite c!2106 (_2!1708 lt!45907) (_2!1708 lt!45624))))))

(assert (= (and d!9074 c!2106) b!31298))

(assert (= (and d!9074 (not c!2106)) b!31296))

(assert (= (or b!31298 b!31296) bm!400))

(assert (= (and d!9074 res!26821) b!31299))

(assert (= (and b!31299 res!26825) b!31293))

(assert (= (and b!31293 res!26822) b!31294))

(assert (= (and b!31294 res!26823) b!31300))

(assert (= (and b!31300 res!26824) b!31295))

(assert (= (and b!31295 res!26826) b!31297))

(declare-fun m!45929 () Bool)

(assert (=> b!31294 m!45929))

(declare-fun m!45931 () Bool)

(assert (=> d!9074 m!45931))

(assert (=> d!9074 m!45757))

(declare-fun m!45933 () Bool)

(assert (=> d!9074 m!45933))

(declare-fun m!45935 () Bool)

(assert (=> d!9074 m!45935))

(declare-fun m!45937 () Bool)

(assert (=> b!31299 m!45937))

(declare-fun m!45939 () Bool)

(assert (=> b!31295 m!45939))

(declare-fun m!45941 () Bool)

(assert (=> b!31295 m!45941))

(declare-fun m!45943 () Bool)

(assert (=> b!31295 m!45943))

(declare-fun m!45945 () Bool)

(assert (=> b!31295 m!45945))

(declare-fun m!45947 () Bool)

(assert (=> b!31295 m!45947))

(declare-fun m!45949 () Bool)

(assert (=> bm!400 m!45949))

(declare-fun m!45951 () Bool)

(assert (=> b!31297 m!45951))

(declare-fun m!45953 () Bool)

(assert (=> b!31298 m!45953))

(declare-fun m!45955 () Bool)

(assert (=> b!31298 m!45955))

(declare-fun m!45957 () Bool)

(assert (=> b!31298 m!45957))

(declare-fun m!45959 () Bool)

(assert (=> b!31298 m!45959))

(declare-fun m!45961 () Bool)

(assert (=> b!31298 m!45961))

(declare-fun m!45963 () Bool)

(assert (=> b!31298 m!45963))

(declare-fun m!45965 () Bool)

(assert (=> b!31298 m!45965))

(assert (=> b!31298 m!45955))

(declare-fun m!45967 () Bool)

(assert (=> b!31298 m!45967))

(declare-fun m!45969 () Bool)

(assert (=> b!31298 m!45969))

(declare-fun m!45971 () Bool)

(assert (=> b!31298 m!45971))

(declare-fun m!45973 () Bool)

(assert (=> b!31298 m!45973))

(declare-fun m!45975 () Bool)

(assert (=> b!31298 m!45975))

(declare-fun m!45977 () Bool)

(assert (=> b!31298 m!45977))

(declare-fun m!45979 () Bool)

(assert (=> b!31298 m!45979))

(declare-fun m!45981 () Bool)

(assert (=> b!31298 m!45981))

(declare-fun m!45983 () Bool)

(assert (=> b!31298 m!45983))

(assert (=> b!31298 m!45983))

(declare-fun m!45985 () Bool)

(assert (=> b!31298 m!45985))

(declare-fun m!45987 () Bool)

(assert (=> b!31298 m!45987))

(declare-fun m!45989 () Bool)

(assert (=> b!31298 m!45989))

(declare-fun m!45991 () Bool)

(assert (=> b!31298 m!45991))

(declare-fun m!45993 () Bool)

(assert (=> b!31298 m!45993))

(declare-fun m!45995 () Bool)

(assert (=> b!31298 m!45995))

(declare-fun m!45997 () Bool)

(assert (=> b!31298 m!45997))

(assert (=> b!31298 m!45981))

(declare-fun m!45999 () Bool)

(assert (=> b!31298 m!45999))

(declare-fun m!46001 () Bool)

(assert (=> b!31298 m!46001))

(declare-fun m!46003 () Bool)

(assert (=> b!31298 m!46003))

(declare-fun m!46005 () Bool)

(assert (=> b!31298 m!46005))

(declare-fun m!46007 () Bool)

(assert (=> b!31298 m!46007))

(assert (=> b!31298 m!45967))

(declare-fun m!46009 () Bool)

(assert (=> b!31298 m!46009))

(assert (=> b!31298 m!45757))

(declare-fun m!46011 () Bool)

(assert (=> b!31298 m!46011))

(declare-fun m!46013 () Bool)

(assert (=> b!31298 m!46013))

(declare-fun m!46015 () Bool)

(assert (=> b!31296 m!46015))

(declare-fun m!46017 () Bool)

(assert (=> b!31296 m!46017))

(assert (=> b!31133 d!9074))

(declare-fun d!9144 () Bool)

(assert (=> d!9144 (isPrefixOf!0 thiss!1379 (_2!1708 lt!45625))))

(declare-fun lt!45910 () Unit!2383)

(declare-fun choose!30 (BitStream!1380 BitStream!1380 BitStream!1380) Unit!2383)

(assert (=> d!9144 (= lt!45910 (choose!30 thiss!1379 (_2!1708 lt!45624) (_2!1708 lt!45625)))))

(assert (=> d!9144 (isPrefixOf!0 thiss!1379 (_2!1708 lt!45624))))

(assert (=> d!9144 (= (lemmaIsPrefixTransitive!0 thiss!1379 (_2!1708 lt!45624) (_2!1708 lt!45625)) lt!45910)))

(declare-fun bs!2528 () Bool)

(assert (= bs!2528 d!9144))

(assert (=> bs!2528 m!45709))

(declare-fun m!46019 () Bool)

(assert (=> bs!2528 m!46019))

(assert (=> bs!2528 m!45739))

(assert (=> b!31133 d!9144))

(declare-fun d!9146 () Bool)

(declare-fun res!26827 () Bool)

(declare-fun e!20777 () Bool)

(assert (=> d!9146 (=> (not res!26827) (not e!20777))))

(assert (=> d!9146 (= res!26827 (= (size!788 (buf!1116 (_2!1708 lt!45624))) (size!788 (buf!1116 (_2!1708 lt!45625)))))))

(assert (=> d!9146 (= (isPrefixOf!0 (_2!1708 lt!45624) (_2!1708 lt!45625)) e!20777)))

(declare-fun b!31301 () Bool)

(declare-fun res!26828 () Bool)

(assert (=> b!31301 (=> (not res!26828) (not e!20777))))

(assert (=> b!31301 (= res!26828 (bvsle (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45624))) (currentByte!2471 (_2!1708 lt!45624)) (currentBit!2466 (_2!1708 lt!45624))) (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45625))) (currentByte!2471 (_2!1708 lt!45625)) (currentBit!2466 (_2!1708 lt!45625)))))))

(declare-fun b!31302 () Bool)

(declare-fun e!20776 () Bool)

(assert (=> b!31302 (= e!20777 e!20776)))

(declare-fun res!26829 () Bool)

(assert (=> b!31302 (=> res!26829 e!20776)))

(assert (=> b!31302 (= res!26829 (= (size!788 (buf!1116 (_2!1708 lt!45624))) #b00000000000000000000000000000000))))

(declare-fun b!31303 () Bool)

(assert (=> b!31303 (= e!20776 (arrayBitRangesEq!0 (buf!1116 (_2!1708 lt!45624)) (buf!1116 (_2!1708 lt!45625)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45624))) (currentByte!2471 (_2!1708 lt!45624)) (currentBit!2466 (_2!1708 lt!45624)))))))

(assert (= (and d!9146 res!26827) b!31301))

(assert (= (and b!31301 res!26828) b!31302))

(assert (= (and b!31302 (not res!26829)) b!31303))

(assert (=> b!31301 m!45757))

(assert (=> b!31301 m!45753))

(assert (=> b!31303 m!45757))

(assert (=> b!31303 m!45757))

(declare-fun m!46021 () Bool)

(assert (=> b!31303 m!46021))

(assert (=> b!31133 d!9146))

(declare-fun d!9148 () Bool)

(declare-fun e!20782 () Bool)

(assert (=> d!9148 e!20782))

(declare-fun res!26837 () Bool)

(assert (=> d!9148 (=> (not res!26837) (not e!20782))))

(declare-fun lt!45953 () tuple2!3244)

(assert (=> d!9148 (= res!26837 (isPrefixOf!0 (_1!1709 lt!45953) (_2!1709 lt!45953)))))

(declare-fun lt!45968 () BitStream!1380)

(assert (=> d!9148 (= lt!45953 (tuple2!3245 lt!45968 (_2!1708 lt!45624)))))

(declare-fun lt!45952 () Unit!2383)

(declare-fun lt!45958 () Unit!2383)

(assert (=> d!9148 (= lt!45952 lt!45958)))

(assert (=> d!9148 (isPrefixOf!0 lt!45968 (_2!1708 lt!45624))))

(assert (=> d!9148 (= lt!45958 (lemmaIsPrefixTransitive!0 lt!45968 (_2!1708 lt!45624) (_2!1708 lt!45624)))))

(declare-fun lt!45965 () Unit!2383)

(declare-fun lt!45959 () Unit!2383)

(assert (=> d!9148 (= lt!45965 lt!45959)))

(assert (=> d!9148 (isPrefixOf!0 lt!45968 (_2!1708 lt!45624))))

(assert (=> d!9148 (= lt!45959 (lemmaIsPrefixTransitive!0 lt!45968 thiss!1379 (_2!1708 lt!45624)))))

(declare-fun lt!45956 () Unit!2383)

(declare-fun e!20783 () Unit!2383)

(assert (=> d!9148 (= lt!45956 e!20783)))

(declare-fun c!2109 () Bool)

(assert (=> d!9148 (= c!2109 (not (= (size!788 (buf!1116 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!45967 () Unit!2383)

(declare-fun lt!45963 () Unit!2383)

(assert (=> d!9148 (= lt!45967 lt!45963)))

(assert (=> d!9148 (isPrefixOf!0 (_2!1708 lt!45624) (_2!1708 lt!45624))))

(assert (=> d!9148 (= lt!45963 (lemmaIsPrefixRefl!0 (_2!1708 lt!45624)))))

(declare-fun lt!45964 () Unit!2383)

(declare-fun lt!45970 () Unit!2383)

(assert (=> d!9148 (= lt!45964 lt!45970)))

(assert (=> d!9148 (= lt!45970 (lemmaIsPrefixRefl!0 (_2!1708 lt!45624)))))

(declare-fun lt!45966 () Unit!2383)

(declare-fun lt!45960 () Unit!2383)

(assert (=> d!9148 (= lt!45966 lt!45960)))

(assert (=> d!9148 (isPrefixOf!0 lt!45968 lt!45968)))

(assert (=> d!9148 (= lt!45960 (lemmaIsPrefixRefl!0 lt!45968))))

(declare-fun lt!45954 () Unit!2383)

(declare-fun lt!45961 () Unit!2383)

(assert (=> d!9148 (= lt!45954 lt!45961)))

(assert (=> d!9148 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9148 (= lt!45961 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9148 (= lt!45968 (BitStream!1381 (buf!1116 (_2!1708 lt!45624)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379)))))

(assert (=> d!9148 (isPrefixOf!0 thiss!1379 (_2!1708 lt!45624))))

(assert (=> d!9148 (= (reader!0 thiss!1379 (_2!1708 lt!45624)) lt!45953)))

(declare-fun b!31314 () Bool)

(declare-fun res!26836 () Bool)

(assert (=> b!31314 (=> (not res!26836) (not e!20782))))

(assert (=> b!31314 (= res!26836 (isPrefixOf!0 (_1!1709 lt!45953) thiss!1379))))

(declare-fun b!31315 () Bool)

(declare-fun lt!45962 () Unit!2383)

(assert (=> b!31315 (= e!20783 lt!45962)))

(declare-fun lt!45951 () (_ BitVec 64))

(assert (=> b!31315 (= lt!45951 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!45955 () (_ BitVec 64))

(assert (=> b!31315 (= lt!45955 (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379)))))

(declare-fun arrayBitRangesEqSymmetric!0 (array!1798 array!1798 (_ BitVec 64) (_ BitVec 64)) Unit!2383)

(assert (=> b!31315 (= lt!45962 (arrayBitRangesEqSymmetric!0 (buf!1116 thiss!1379) (buf!1116 (_2!1708 lt!45624)) lt!45951 lt!45955))))

(assert (=> b!31315 (arrayBitRangesEq!0 (buf!1116 (_2!1708 lt!45624)) (buf!1116 thiss!1379) lt!45951 lt!45955)))

(declare-fun b!31316 () Bool)

(declare-fun res!26838 () Bool)

(assert (=> b!31316 (=> (not res!26838) (not e!20782))))

(assert (=> b!31316 (= res!26838 (isPrefixOf!0 (_2!1709 lt!45953) (_2!1708 lt!45624)))))

(declare-fun b!31317 () Bool)

(declare-fun Unit!2394 () Unit!2383)

(assert (=> b!31317 (= e!20783 Unit!2394)))

(declare-fun lt!45957 () (_ BitVec 64))

(declare-fun lt!45969 () (_ BitVec 64))

(declare-fun b!31318 () Bool)

(declare-fun withMovedBitIndex!0 (BitStream!1380 (_ BitVec 64)) BitStream!1380)

(assert (=> b!31318 (= e!20782 (= (_1!1709 lt!45953) (withMovedBitIndex!0 (_2!1709 lt!45953) (bvsub lt!45957 lt!45969))))))

(assert (=> b!31318 (or (= (bvand lt!45957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45969 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45957 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45957 lt!45969) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31318 (= lt!45969 (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45624))) (currentByte!2471 (_2!1708 lt!45624)) (currentBit!2466 (_2!1708 lt!45624))))))

(assert (=> b!31318 (= lt!45957 (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379)))))

(assert (= (and d!9148 c!2109) b!31315))

(assert (= (and d!9148 (not c!2109)) b!31317))

(assert (= (and d!9148 res!26837) b!31314))

(assert (= (and b!31314 res!26836) b!31316))

(assert (= (and b!31316 res!26838) b!31318))

(declare-fun m!46023 () Bool)

(assert (=> d!9148 m!46023))

(declare-fun m!46025 () Bool)

(assert (=> d!9148 m!46025))

(assert (=> d!9148 m!45739))

(assert (=> d!9148 m!45935))

(declare-fun m!46027 () Bool)

(assert (=> d!9148 m!46027))

(declare-fun m!46029 () Bool)

(assert (=> d!9148 m!46029))

(assert (=> d!9148 m!45933))

(declare-fun m!46031 () Bool)

(assert (=> d!9148 m!46031))

(assert (=> d!9148 m!45769))

(assert (=> d!9148 m!45771))

(declare-fun m!46033 () Bool)

(assert (=> d!9148 m!46033))

(declare-fun m!46035 () Bool)

(assert (=> b!31314 m!46035))

(assert (=> b!31315 m!45773))

(declare-fun m!46037 () Bool)

(assert (=> b!31315 m!46037))

(declare-fun m!46039 () Bool)

(assert (=> b!31315 m!46039))

(declare-fun m!46041 () Bool)

(assert (=> b!31318 m!46041))

(assert (=> b!31318 m!45757))

(assert (=> b!31318 m!45773))

(declare-fun m!46043 () Bool)

(assert (=> b!31316 m!46043))

(assert (=> b!31133 d!9148))

(declare-fun d!9150 () Bool)

(assert (=> d!9150 (= (tail!108 lt!45622) (t!1141 lt!45622))))

(assert (=> b!31143 d!9150))

(declare-fun d!9152 () Bool)

(declare-fun e!20786 () Bool)

(assert (=> d!9152 e!20786))

(declare-fun res!26841 () Bool)

(assert (=> d!9152 (=> (not res!26841) (not e!20786))))

(declare-fun lt!45976 () (_ BitVec 64))

(assert (=> d!9152 (= res!26841 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45976 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) lt!45976) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> d!9152 (= lt!45976 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun lt!45975 () Unit!2383)

(declare-fun choose!42 (BitStream!1380 BitStream!1380 BitStream!1380 BitStream!1380 (_ BitVec 64) List!391) Unit!2383)

(assert (=> d!9152 (= lt!45975 (choose!42 (_2!1708 lt!45625) (_2!1708 lt!45625) (_1!1709 lt!45627) (_1!1709 lt!45630) (bvsub to!314 i!635) lt!45622))))

(assert (=> d!9152 (bvsgt (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9152 (= (lemmaBitStreamReadBitsIntoListFromBitIndexPlusOneIsTail!0 (_2!1708 lt!45625) (_2!1708 lt!45625) (_1!1709 lt!45627) (_1!1709 lt!45630) (bvsub to!314 i!635) lt!45622) lt!45975)))

(declare-fun b!31321 () Bool)

(assert (=> b!31321 (= e!20786 (= (bitStreamReadBitsIntoList!0 (_2!1708 lt!45625) (_1!1709 lt!45630) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)) (tail!108 lt!45622)))))

(assert (= (and d!9152 res!26841) b!31321))

(declare-fun m!46045 () Bool)

(assert (=> d!9152 m!46045))

(declare-fun m!46047 () Bool)

(assert (=> b!31321 m!46047))

(assert (=> b!31321 m!45765))

(assert (=> b!31143 d!9152))

(declare-fun d!9154 () Bool)

(assert (=> d!9154 (= (head!228 lt!45622) (h!506 lt!45622))))

(assert (=> b!31132 d!9154))

(declare-fun d!9156 () Bool)

(declare-fun e!20789 () Bool)

(assert (=> d!9156 e!20789))

(declare-fun res!26847 () Bool)

(assert (=> d!9156 (=> (not res!26847) (not e!20789))))

(declare-fun lt!45991 () (_ BitVec 64))

(declare-fun lt!45989 () (_ BitVec 64))

(declare-fun lt!45992 () (_ BitVec 64))

(assert (=> d!9156 (= res!26847 (= lt!45991 (bvsub lt!45992 lt!45989)))))

(assert (=> d!9156 (or (= (bvand lt!45992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!45989 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!45992 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!45992 lt!45989) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9156 (= lt!45989 (remainingBits!0 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45625)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45625))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45625)))))))

(declare-fun lt!45994 () (_ BitVec 64))

(declare-fun lt!45990 () (_ BitVec 64))

(assert (=> d!9156 (= lt!45992 (bvmul lt!45994 lt!45990))))

(assert (=> d!9156 (or (= lt!45994 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!45990 (bvsdiv (bvmul lt!45994 lt!45990) lt!45994)))))

(assert (=> d!9156 (= lt!45990 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9156 (= lt!45994 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45625)))))))

(assert (=> d!9156 (= lt!45991 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45625))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45625)))))))

(assert (=> d!9156 (invariant!0 (currentBit!2466 (_2!1708 lt!45625)) (currentByte!2471 (_2!1708 lt!45625)) (size!788 (buf!1116 (_2!1708 lt!45625))))))

(assert (=> d!9156 (= (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45625))) (currentByte!2471 (_2!1708 lt!45625)) (currentBit!2466 (_2!1708 lt!45625))) lt!45991)))

(declare-fun b!31326 () Bool)

(declare-fun res!26846 () Bool)

(assert (=> b!31326 (=> (not res!26846) (not e!20789))))

(assert (=> b!31326 (= res!26846 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!45991))))

(declare-fun b!31327 () Bool)

(declare-fun lt!45993 () (_ BitVec 64))

(assert (=> b!31327 (= e!20789 (bvsle lt!45991 (bvmul lt!45993 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!31327 (or (= lt!45993 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!45993 #b0000000000000000000000000000000000000000000000000000000000001000) lt!45993)))))

(assert (=> b!31327 (= lt!45993 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45625)))))))

(assert (= (and d!9156 res!26847) b!31326))

(assert (= (and b!31326 res!26846) b!31327))

(declare-fun m!46049 () Bool)

(assert (=> d!9156 m!46049))

(assert (=> d!9156 m!45759))

(assert (=> b!31131 d!9156))

(declare-fun d!9158 () Bool)

(assert (=> d!9158 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 thiss!1379))) ((_ sign_extend 32) (currentByte!2471 thiss!1379)) ((_ sign_extend 32) (currentBit!2466 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!788 (buf!1116 thiss!1379))) ((_ sign_extend 32) (currentByte!2471 thiss!1379)) ((_ sign_extend 32) (currentBit!2466 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2529 () Bool)

(assert (= bs!2529 d!9158))

(declare-fun m!46051 () Bool)

(assert (=> bs!2529 m!46051))

(assert (=> b!31142 d!9158))

(declare-fun d!9160 () Bool)

(declare-fun res!26848 () Bool)

(declare-fun e!20791 () Bool)

(assert (=> d!9160 (=> (not res!26848) (not e!20791))))

(assert (=> d!9160 (= res!26848 (= (size!788 (buf!1116 thiss!1379)) (size!788 (buf!1116 (_2!1708 lt!45624)))))))

(assert (=> d!9160 (= (isPrefixOf!0 thiss!1379 (_2!1708 lt!45624)) e!20791)))

(declare-fun b!31328 () Bool)

(declare-fun res!26849 () Bool)

(assert (=> b!31328 (=> (not res!26849) (not e!20791))))

(assert (=> b!31328 (= res!26849 (bvsle (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379)) (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45624))) (currentByte!2471 (_2!1708 lt!45624)) (currentBit!2466 (_2!1708 lt!45624)))))))

(declare-fun b!31329 () Bool)

(declare-fun e!20790 () Bool)

(assert (=> b!31329 (= e!20791 e!20790)))

(declare-fun res!26850 () Bool)

(assert (=> b!31329 (=> res!26850 e!20790)))

(assert (=> b!31329 (= res!26850 (= (size!788 (buf!1116 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!31330 () Bool)

(assert (=> b!31330 (= e!20790 (arrayBitRangesEq!0 (buf!1116 thiss!1379) (buf!1116 (_2!1708 lt!45624)) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379))))))

(assert (= (and d!9160 res!26848) b!31328))

(assert (= (and b!31328 res!26849) b!31329))

(assert (= (and b!31329 (not res!26850)) b!31330))

(assert (=> b!31328 m!45773))

(assert (=> b!31328 m!45757))

(assert (=> b!31330 m!45773))

(assert (=> b!31330 m!45773))

(declare-fun m!46053 () Bool)

(assert (=> b!31330 m!46053))

(assert (=> b!31141 d!9160))

(declare-fun d!9162 () Bool)

(assert (=> d!9162 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45624)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45624))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45624))) lt!45623) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45624)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45624))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45624)))) lt!45623))))

(declare-fun bs!2530 () Bool)

(assert (= bs!2530 d!9162))

(declare-fun m!46055 () Bool)

(assert (=> bs!2530 m!46055))

(assert (=> b!31141 d!9162))

(declare-fun d!9164 () Bool)

(declare-fun e!20794 () Bool)

(assert (=> d!9164 e!20794))

(declare-fun res!26853 () Bool)

(assert (=> d!9164 (=> (not res!26853) (not e!20794))))

(assert (=> d!9164 (= res!26853 (or (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand #b0000000000000000000000000000000000000000000000000000000000000001 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand (bvsub to!314 i!635) #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun lt!45997 () Unit!2383)

(declare-fun choose!27 (BitStream!1380 BitStream!1380 (_ BitVec 64) (_ BitVec 64)) Unit!2383)

(assert (=> d!9164 (= lt!45997 (choose!27 thiss!1379 (_2!1708 lt!45624) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))

(assert (=> d!9164 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsle #b0000000000000000000000000000000000000000000000000000000000000001 (bvsub to!314 i!635)))))

(assert (=> d!9164 (= (validateOffsetBitsIneqLemma!0 thiss!1379 (_2!1708 lt!45624) (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001) lt!45997)))

(declare-fun b!31333 () Bool)

(assert (=> b!31333 (= e!20794 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45624)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45624))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45624))) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!9164 res!26853) b!31333))

(declare-fun m!46057 () Bool)

(assert (=> d!9164 m!46057))

(declare-fun m!46059 () Bool)

(assert (=> b!31333 m!46059))

(assert (=> b!31141 d!9164))

(declare-fun b!31352 () Bool)

(declare-fun res!26870 () Bool)

(declare-fun e!20806 () Bool)

(assert (=> b!31352 (=> (not res!26870) (not e!20806))))

(declare-fun lt!46027 () (_ BitVec 64))

(declare-fun lt!46028 () tuple2!3242)

(declare-fun lt!46031 () (_ BitVec 64))

(assert (=> b!31352 (= res!26870 (= (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!46028))) (currentByte!2471 (_2!1708 lt!46028)) (currentBit!2466 (_2!1708 lt!46028))) (bvadd lt!46027 lt!46031)))))

(assert (=> b!31352 (or (not (= (bvand lt!46027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46031 #b1000000000000000000000000000000000000000000000000000000000000000))) (= (bvand lt!46027 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvadd lt!46027 lt!46031) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31352 (= lt!46031 #b0000000000000000000000000000000000000000000000000000000000000001)))

(assert (=> b!31352 (= lt!46027 (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379)))))

(declare-fun b!31353 () Bool)

(declare-fun e!20804 () Bool)

(declare-datatypes ((tuple2!3256 0))(
  ( (tuple2!3257 (_1!1715 BitStream!1380) (_2!1715 Bool)) )
))
(declare-fun lt!46023 () tuple2!3256)

(declare-fun lt!46025 () tuple2!3242)

(assert (=> b!31353 (= e!20804 (= (bitIndex!0 (size!788 (buf!1116 (_1!1715 lt!46023))) (currentByte!2471 (_1!1715 lt!46023)) (currentBit!2466 (_1!1715 lt!46023))) (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!46025))) (currentByte!2471 (_2!1708 lt!46025)) (currentBit!2466 (_2!1708 lt!46025)))))))

(declare-fun b!31354 () Bool)

(declare-fun res!26874 () Bool)

(assert (=> b!31354 (=> (not res!26874) (not e!20806))))

(assert (=> b!31354 (= res!26874 (isPrefixOf!0 thiss!1379 (_2!1708 lt!46028)))))

(declare-fun b!31355 () Bool)

(declare-fun res!26876 () Bool)

(declare-fun e!20803 () Bool)

(assert (=> b!31355 (=> (not res!26876) (not e!20803))))

(assert (=> b!31355 (= res!26876 (isPrefixOf!0 thiss!1379 (_2!1708 lt!46025)))))

(declare-fun b!31356 () Bool)

(declare-fun e!20805 () Bool)

(assert (=> b!31356 (= e!20806 e!20805)))

(declare-fun res!26872 () Bool)

(assert (=> b!31356 (=> (not res!26872) (not e!20805))))

(declare-fun lt!46030 () tuple2!3256)

(declare-fun lt!46024 () (_ BitVec 8))

(assert (=> b!31356 (= res!26872 (and (= (_2!1715 lt!46030) (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1257 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) lt!46024)) #b00000000000000000000000000000000))) (= (_1!1715 lt!46030) (_2!1708 lt!46028))))))

(declare-fun lt!46026 () tuple2!3254)

(declare-fun lt!46033 () BitStream!1380)

(assert (=> b!31356 (= lt!46026 (readBits!0 lt!46033 #b0000000000000000000000000000000000000000000000000000000000000001))))

(declare-fun readBitPure!0 (BitStream!1380) tuple2!3256)

(assert (=> b!31356 (= lt!46030 (readBitPure!0 lt!46033))))

(declare-fun readerFrom!0 (BitStream!1380 (_ BitVec 32) (_ BitVec 32)) BitStream!1380)

(assert (=> b!31356 (= lt!46033 (readerFrom!0 (_2!1708 lt!46028) (currentBit!2466 thiss!1379) (currentByte!2471 thiss!1379)))))

(declare-fun b!31357 () Bool)

(assert (=> b!31357 (= e!20805 (= (bitIndex!0 (size!788 (buf!1116 (_1!1715 lt!46030))) (currentByte!2471 (_1!1715 lt!46030)) (currentBit!2466 (_1!1715 lt!46030))) (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!46028))) (currentByte!2471 (_2!1708 lt!46028)) (currentBit!2466 (_2!1708 lt!46028)))))))

(declare-fun b!31358 () Bool)

(assert (=> b!31358 (= e!20803 e!20804)))

(declare-fun res!26871 () Bool)

(assert (=> b!31358 (=> (not res!26871) (not e!20804))))

(declare-fun lt!46029 () Bool)

(assert (=> b!31358 (= res!26871 (and (= (_2!1715 lt!46023) lt!46029) (= (_1!1715 lt!46023) (_2!1708 lt!46025))))))

(assert (=> b!31358 (= lt!46023 (readBitPure!0 (readerFrom!0 (_2!1708 lt!46025) (currentBit!2466 thiss!1379) (currentByte!2471 thiss!1379))))))

(declare-fun d!9166 () Bool)

(assert (=> d!9166 e!20806))

(declare-fun res!26877 () Bool)

(assert (=> d!9166 (=> (not res!26877) (not e!20806))))

(assert (=> d!9166 (= res!26877 (= (size!788 (buf!1116 (_2!1708 lt!46028))) (size!788 (buf!1116 thiss!1379))))))

(declare-fun lt!46022 () array!1798)

(assert (=> d!9166 (= lt!46024 (select (arr!1257 lt!46022) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))))

(assert (=> d!9166 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) (size!788 lt!46022)))))

(assert (=> d!9166 (= lt!46022 (array!1799 (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) #b00000000000000000000000000001000))))

(declare-fun lt!46032 () tuple2!3242)

(assert (=> d!9166 (= lt!46028 (tuple2!3243 (_1!1708 lt!46032) (_2!1708 lt!46032)))))

(assert (=> d!9166 (= lt!46032 lt!46025)))

(assert (=> d!9166 e!20803))

(declare-fun res!26875 () Bool)

(assert (=> d!9166 (=> (not res!26875) (not e!20803))))

(assert (=> d!9166 (= res!26875 (= (size!788 (buf!1116 thiss!1379)) (size!788 (buf!1116 (_2!1708 lt!46025)))))))

(declare-fun appendBit!0 (BitStream!1380 Bool) tuple2!3242)

(assert (=> d!9166 (= lt!46025 (appendBit!0 thiss!1379 lt!46029))))

(assert (=> d!9166 (= lt!46029 (not (= (bvand ((_ sign_extend 24) ((_ extract 7 0) ((_ sign_extend 56) (select (arr!1257 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(assert (=> d!9166 (and (bvsge ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000000000) (bvslt ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000)) #b00000000000000000000000000001000))))

(assert (=> d!9166 (= (appendBitFromByte!0 thiss!1379 (select (arr!1257 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))) lt!46028)))

(declare-fun b!31351 () Bool)

(declare-fun res!26873 () Bool)

(assert (=> b!31351 (=> (not res!26873) (not e!20803))))

(assert (=> b!31351 (= res!26873 (= (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!46025))) (currentByte!2471 (_2!1708 lt!46025)) (currentBit!2466 (_2!1708 lt!46025))) (bvadd (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000000001)))))

(assert (= (and d!9166 res!26875) b!31351))

(assert (= (and b!31351 res!26873) b!31355))

(assert (= (and b!31355 res!26876) b!31358))

(assert (= (and b!31358 res!26871) b!31353))

(assert (= (and d!9166 res!26877) b!31352))

(assert (= (and b!31352 res!26870) b!31354))

(assert (= (and b!31354 res!26874) b!31356))

(assert (= (and b!31356 res!26872) b!31357))

(declare-fun m!46061 () Bool)

(assert (=> b!31352 m!46061))

(assert (=> b!31352 m!45773))

(declare-fun m!46063 () Bool)

(assert (=> b!31354 m!46063))

(declare-fun m!46065 () Bool)

(assert (=> b!31353 m!46065))

(declare-fun m!46067 () Bool)

(assert (=> b!31353 m!46067))

(declare-fun m!46069 () Bool)

(assert (=> b!31355 m!46069))

(declare-fun m!46071 () Bool)

(assert (=> b!31358 m!46071))

(assert (=> b!31358 m!46071))

(declare-fun m!46073 () Bool)

(assert (=> b!31358 m!46073))

(declare-fun m!46075 () Bool)

(assert (=> b!31357 m!46075))

(assert (=> b!31357 m!46061))

(declare-fun m!46077 () Bool)

(assert (=> b!31356 m!46077))

(declare-fun m!46079 () Bool)

(assert (=> b!31356 m!46079))

(declare-fun m!46081 () Bool)

(assert (=> b!31356 m!46081))

(assert (=> b!31351 m!46067))

(assert (=> b!31351 m!45773))

(declare-fun m!46083 () Bool)

(assert (=> d!9166 m!46083))

(declare-fun m!46085 () Bool)

(assert (=> d!9166 m!46085))

(assert (=> d!9166 m!45861))

(assert (=> b!31141 d!9166))

(declare-fun d!9168 () Bool)

(declare-fun res!26878 () Bool)

(declare-fun e!20808 () Bool)

(assert (=> d!9168 (=> (not res!26878) (not e!20808))))

(assert (=> d!9168 (= res!26878 (= (size!788 (buf!1116 thiss!1379)) (size!788 (buf!1116 thiss!1379))))))

(assert (=> d!9168 (= (isPrefixOf!0 thiss!1379 thiss!1379) e!20808)))

(declare-fun b!31359 () Bool)

(declare-fun res!26879 () Bool)

(assert (=> b!31359 (=> (not res!26879) (not e!20808))))

(assert (=> b!31359 (= res!26879 (bvsle (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379)) (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379))))))

(declare-fun b!31360 () Bool)

(declare-fun e!20807 () Bool)

(assert (=> b!31360 (= e!20808 e!20807)))

(declare-fun res!26880 () Bool)

(assert (=> b!31360 (=> res!26880 e!20807)))

(assert (=> b!31360 (= res!26880 (= (size!788 (buf!1116 thiss!1379)) #b00000000000000000000000000000000))))

(declare-fun b!31361 () Bool)

(assert (=> b!31361 (= e!20807 (arrayBitRangesEq!0 (buf!1116 thiss!1379) (buf!1116 thiss!1379) #b0000000000000000000000000000000000000000000000000000000000000000 (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379))))))

(assert (= (and d!9168 res!26878) b!31359))

(assert (= (and b!31359 res!26879) b!31360))

(assert (= (and b!31360 (not res!26880)) b!31361))

(assert (=> b!31359 m!45773))

(assert (=> b!31359 m!45773))

(assert (=> b!31361 m!45773))

(assert (=> b!31361 m!45773))

(declare-fun m!46087 () Bool)

(assert (=> b!31361 m!46087))

(assert (=> b!31130 d!9168))

(declare-fun d!9170 () Bool)

(assert (=> d!9170 (isPrefixOf!0 thiss!1379 thiss!1379)))

(declare-fun lt!46036 () Unit!2383)

(declare-fun choose!11 (BitStream!1380) Unit!2383)

(assert (=> d!9170 (= lt!46036 (choose!11 thiss!1379))))

(assert (=> d!9170 (= (lemmaIsPrefixRefl!0 thiss!1379) lt!46036)))

(declare-fun bs!2532 () Bool)

(assert (= bs!2532 d!9170))

(assert (=> bs!2532 m!45769))

(declare-fun m!46089 () Bool)

(assert (=> bs!2532 m!46089))

(assert (=> b!31130 d!9170))

(declare-fun d!9172 () Bool)

(declare-fun e!20809 () Bool)

(assert (=> d!9172 e!20809))

(declare-fun res!26882 () Bool)

(assert (=> d!9172 (=> (not res!26882) (not e!20809))))

(declare-fun lt!46037 () (_ BitVec 64))

(declare-fun lt!46039 () (_ BitVec 64))

(declare-fun lt!46040 () (_ BitVec 64))

(assert (=> d!9172 (= res!26882 (= lt!46039 (bvsub lt!46040 lt!46037)))))

(assert (=> d!9172 (or (= (bvand lt!46040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46037 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!46040 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!46040 lt!46037) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9172 (= lt!46037 (remainingBits!0 ((_ sign_extend 32) (size!788 (buf!1116 thiss!1379))) ((_ sign_extend 32) (currentByte!2471 thiss!1379)) ((_ sign_extend 32) (currentBit!2466 thiss!1379))))))

(declare-fun lt!46042 () (_ BitVec 64))

(declare-fun lt!46038 () (_ BitVec 64))

(assert (=> d!9172 (= lt!46040 (bvmul lt!46042 lt!46038))))

(assert (=> d!9172 (or (= lt!46042 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!46038 (bvsdiv (bvmul lt!46042 lt!46038) lt!46042)))))

(assert (=> d!9172 (= lt!46038 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9172 (= lt!46042 ((_ sign_extend 32) (size!788 (buf!1116 thiss!1379))))))

(assert (=> d!9172 (= lt!46039 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2471 thiss!1379)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2466 thiss!1379))))))

(assert (=> d!9172 (invariant!0 (currentBit!2466 thiss!1379) (currentByte!2471 thiss!1379) (size!788 (buf!1116 thiss!1379)))))

(assert (=> d!9172 (= (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379)) lt!46039)))

(declare-fun b!31362 () Bool)

(declare-fun res!26881 () Bool)

(assert (=> b!31362 (=> (not res!26881) (not e!20809))))

(assert (=> b!31362 (= res!26881 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!46039))))

(declare-fun b!31363 () Bool)

(declare-fun lt!46041 () (_ BitVec 64))

(assert (=> b!31363 (= e!20809 (bvsle lt!46039 (bvmul lt!46041 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!31363 (or (= lt!46041 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!46041 #b0000000000000000000000000000000000000000000000000000000000001000) lt!46041)))))

(assert (=> b!31363 (= lt!46041 ((_ sign_extend 32) (size!788 (buf!1116 thiss!1379))))))

(assert (= (and d!9172 res!26882) b!31362))

(assert (= (and b!31362 res!26881) b!31363))

(assert (=> d!9172 m!46051))

(declare-fun m!46091 () Bool)

(assert (=> d!9172 m!46091))

(assert (=> b!31130 d!9172))

(declare-fun d!9174 () Bool)

(declare-fun c!2110 () Bool)

(assert (=> d!9174 (= c!2110 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun e!20810 () List!391)

(assert (=> d!9174 (= (byteArrayBitContentToList!0 (_2!1708 lt!45625) srcBuffer!2 i!635 (bvsub to!314 i!635)) e!20810)))

(declare-fun b!31364 () Bool)

(assert (=> b!31364 (= e!20810 Nil!388)))

(declare-fun b!31365 () Bool)

(assert (=> b!31365 (= e!20810 (Cons!387 (not (= (bvand ((_ sign_extend 24) (select (arr!1257 srcBuffer!2) ((_ extract 31 0) (bvsdiv i!635 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem i!635 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)) (byteArrayBitContentToList!0 (_2!1708 lt!45625) srcBuffer!2 (bvadd i!635 #b0000000000000000000000000000000000000000000000000000000000000001) (bvsub (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000001))))))

(assert (= (and d!9174 c!2110) b!31364))

(assert (= (and d!9174 (not c!2110)) b!31365))

(assert (=> b!31365 m!45737))

(assert (=> b!31365 m!45861))

(declare-fun m!46093 () Bool)

(assert (=> b!31365 m!46093))

(assert (=> b!31129 d!9174))

(declare-fun d!9176 () Bool)

(assert (=> d!9176 (= (array_inv!743 srcBuffer!2) (bvsge (size!788 srcBuffer!2) #b00000000000000000000000000000000))))

(assert (=> start!6628 d!9176))

(declare-fun d!9178 () Bool)

(assert (=> d!9178 (= (inv!12 thiss!1379) (invariant!0 (currentBit!2466 thiss!1379) (currentByte!2471 thiss!1379) (size!788 (buf!1116 thiss!1379))))))

(declare-fun bs!2533 () Bool)

(assert (= bs!2533 d!9178))

(assert (=> bs!2533 m!46091))

(assert (=> start!6628 d!9178))

(declare-fun d!9180 () Bool)

(declare-fun e!20811 () Bool)

(assert (=> d!9180 e!20811))

(declare-fun res!26884 () Bool)

(assert (=> d!9180 (=> (not res!26884) (not e!20811))))

(declare-fun lt!46045 () tuple2!3244)

(assert (=> d!9180 (= res!26884 (isPrefixOf!0 (_1!1709 lt!46045) (_2!1709 lt!46045)))))

(declare-fun lt!46060 () BitStream!1380)

(assert (=> d!9180 (= lt!46045 (tuple2!3245 lt!46060 (_2!1708 lt!45625)))))

(declare-fun lt!46044 () Unit!2383)

(declare-fun lt!46050 () Unit!2383)

(assert (=> d!9180 (= lt!46044 lt!46050)))

(assert (=> d!9180 (isPrefixOf!0 lt!46060 (_2!1708 lt!45625))))

(assert (=> d!9180 (= lt!46050 (lemmaIsPrefixTransitive!0 lt!46060 (_2!1708 lt!45625) (_2!1708 lt!45625)))))

(declare-fun lt!46057 () Unit!2383)

(declare-fun lt!46051 () Unit!2383)

(assert (=> d!9180 (= lt!46057 lt!46051)))

(assert (=> d!9180 (isPrefixOf!0 lt!46060 (_2!1708 lt!45625))))

(assert (=> d!9180 (= lt!46051 (lemmaIsPrefixTransitive!0 lt!46060 (_2!1708 lt!45624) (_2!1708 lt!45625)))))

(declare-fun lt!46048 () Unit!2383)

(declare-fun e!20812 () Unit!2383)

(assert (=> d!9180 (= lt!46048 e!20812)))

(declare-fun c!2111 () Bool)

(assert (=> d!9180 (= c!2111 (not (= (size!788 (buf!1116 (_2!1708 lt!45624))) #b00000000000000000000000000000000)))))

(declare-fun lt!46059 () Unit!2383)

(declare-fun lt!46055 () Unit!2383)

(assert (=> d!9180 (= lt!46059 lt!46055)))

(assert (=> d!9180 (isPrefixOf!0 (_2!1708 lt!45625) (_2!1708 lt!45625))))

(assert (=> d!9180 (= lt!46055 (lemmaIsPrefixRefl!0 (_2!1708 lt!45625)))))

(declare-fun lt!46056 () Unit!2383)

(declare-fun lt!46062 () Unit!2383)

(assert (=> d!9180 (= lt!46056 lt!46062)))

(assert (=> d!9180 (= lt!46062 (lemmaIsPrefixRefl!0 (_2!1708 lt!45625)))))

(declare-fun lt!46058 () Unit!2383)

(declare-fun lt!46052 () Unit!2383)

(assert (=> d!9180 (= lt!46058 lt!46052)))

(assert (=> d!9180 (isPrefixOf!0 lt!46060 lt!46060)))

(assert (=> d!9180 (= lt!46052 (lemmaIsPrefixRefl!0 lt!46060))))

(declare-fun lt!46046 () Unit!2383)

(declare-fun lt!46053 () Unit!2383)

(assert (=> d!9180 (= lt!46046 lt!46053)))

(assert (=> d!9180 (isPrefixOf!0 (_2!1708 lt!45624) (_2!1708 lt!45624))))

(assert (=> d!9180 (= lt!46053 (lemmaIsPrefixRefl!0 (_2!1708 lt!45624)))))

(assert (=> d!9180 (= lt!46060 (BitStream!1381 (buf!1116 (_2!1708 lt!45625)) (currentByte!2471 (_2!1708 lt!45624)) (currentBit!2466 (_2!1708 lt!45624))))))

(assert (=> d!9180 (isPrefixOf!0 (_2!1708 lt!45624) (_2!1708 lt!45625))))

(assert (=> d!9180 (= (reader!0 (_2!1708 lt!45624) (_2!1708 lt!45625)) lt!46045)))

(declare-fun b!31366 () Bool)

(declare-fun res!26883 () Bool)

(assert (=> b!31366 (=> (not res!26883) (not e!20811))))

(assert (=> b!31366 (= res!26883 (isPrefixOf!0 (_1!1709 lt!46045) (_2!1708 lt!45624)))))

(declare-fun b!31367 () Bool)

(declare-fun lt!46054 () Unit!2383)

(assert (=> b!31367 (= e!20812 lt!46054)))

(declare-fun lt!46043 () (_ BitVec 64))

(assert (=> b!31367 (= lt!46043 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46047 () (_ BitVec 64))

(assert (=> b!31367 (= lt!46047 (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45624))) (currentByte!2471 (_2!1708 lt!45624)) (currentBit!2466 (_2!1708 lt!45624))))))

(assert (=> b!31367 (= lt!46054 (arrayBitRangesEqSymmetric!0 (buf!1116 (_2!1708 lt!45624)) (buf!1116 (_2!1708 lt!45625)) lt!46043 lt!46047))))

(assert (=> b!31367 (arrayBitRangesEq!0 (buf!1116 (_2!1708 lt!45625)) (buf!1116 (_2!1708 lt!45624)) lt!46043 lt!46047)))

(declare-fun b!31368 () Bool)

(declare-fun res!26885 () Bool)

(assert (=> b!31368 (=> (not res!26885) (not e!20811))))

(assert (=> b!31368 (= res!26885 (isPrefixOf!0 (_2!1709 lt!46045) (_2!1708 lt!45625)))))

(declare-fun b!31369 () Bool)

(declare-fun Unit!2395 () Unit!2383)

(assert (=> b!31369 (= e!20812 Unit!2395)))

(declare-fun lt!46061 () (_ BitVec 64))

(declare-fun lt!46049 () (_ BitVec 64))

(declare-fun b!31370 () Bool)

(assert (=> b!31370 (= e!20811 (= (_1!1709 lt!46045) (withMovedBitIndex!0 (_2!1709 lt!46045) (bvsub lt!46049 lt!46061))))))

(assert (=> b!31370 (or (= (bvand lt!46049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46061 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!46049 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!46049 lt!46061) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31370 (= lt!46061 (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45625))) (currentByte!2471 (_2!1708 lt!45625)) (currentBit!2466 (_2!1708 lt!45625))))))

(assert (=> b!31370 (= lt!46049 (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45624))) (currentByte!2471 (_2!1708 lt!45624)) (currentBit!2466 (_2!1708 lt!45624))))))

(assert (= (and d!9180 c!2111) b!31367))

(assert (= (and d!9180 (not c!2111)) b!31369))

(assert (= (and d!9180 res!26884) b!31366))

(assert (= (and b!31366 res!26883) b!31368))

(assert (= (and b!31368 res!26885) b!31370))

(declare-fun m!46095 () Bool)

(assert (=> d!9180 m!46095))

(declare-fun m!46097 () Bool)

(assert (=> d!9180 m!46097))

(assert (=> d!9180 m!45715))

(declare-fun m!46099 () Bool)

(assert (=> d!9180 m!46099))

(declare-fun m!46101 () Bool)

(assert (=> d!9180 m!46101))

(declare-fun m!46103 () Bool)

(assert (=> d!9180 m!46103))

(declare-fun m!46105 () Bool)

(assert (=> d!9180 m!46105))

(declare-fun m!46107 () Bool)

(assert (=> d!9180 m!46107))

(assert (=> d!9180 m!45933))

(assert (=> d!9180 m!45935))

(declare-fun m!46109 () Bool)

(assert (=> d!9180 m!46109))

(declare-fun m!46111 () Bool)

(assert (=> b!31366 m!46111))

(assert (=> b!31367 m!45757))

(declare-fun m!46113 () Bool)

(assert (=> b!31367 m!46113))

(declare-fun m!46115 () Bool)

(assert (=> b!31367 m!46115))

(declare-fun m!46117 () Bool)

(assert (=> b!31370 m!46117))

(assert (=> b!31370 m!45753))

(assert (=> b!31370 m!45757))

(declare-fun m!46119 () Bool)

(assert (=> b!31368 m!46119))

(assert (=> b!31140 d!9180))

(declare-fun d!9182 () Bool)

(declare-fun e!20813 () Bool)

(assert (=> d!9182 e!20813))

(declare-fun res!26887 () Bool)

(assert (=> d!9182 (=> (not res!26887) (not e!20813))))

(declare-fun lt!46065 () tuple2!3244)

(assert (=> d!9182 (= res!26887 (isPrefixOf!0 (_1!1709 lt!46065) (_2!1709 lt!46065)))))

(declare-fun lt!46080 () BitStream!1380)

(assert (=> d!9182 (= lt!46065 (tuple2!3245 lt!46080 (_2!1708 lt!45625)))))

(declare-fun lt!46064 () Unit!2383)

(declare-fun lt!46070 () Unit!2383)

(assert (=> d!9182 (= lt!46064 lt!46070)))

(assert (=> d!9182 (isPrefixOf!0 lt!46080 (_2!1708 lt!45625))))

(assert (=> d!9182 (= lt!46070 (lemmaIsPrefixTransitive!0 lt!46080 (_2!1708 lt!45625) (_2!1708 lt!45625)))))

(declare-fun lt!46077 () Unit!2383)

(declare-fun lt!46071 () Unit!2383)

(assert (=> d!9182 (= lt!46077 lt!46071)))

(assert (=> d!9182 (isPrefixOf!0 lt!46080 (_2!1708 lt!45625))))

(assert (=> d!9182 (= lt!46071 (lemmaIsPrefixTransitive!0 lt!46080 thiss!1379 (_2!1708 lt!45625)))))

(declare-fun lt!46068 () Unit!2383)

(declare-fun e!20814 () Unit!2383)

(assert (=> d!9182 (= lt!46068 e!20814)))

(declare-fun c!2112 () Bool)

(assert (=> d!9182 (= c!2112 (not (= (size!788 (buf!1116 thiss!1379)) #b00000000000000000000000000000000)))))

(declare-fun lt!46079 () Unit!2383)

(declare-fun lt!46075 () Unit!2383)

(assert (=> d!9182 (= lt!46079 lt!46075)))

(assert (=> d!9182 (isPrefixOf!0 (_2!1708 lt!45625) (_2!1708 lt!45625))))

(assert (=> d!9182 (= lt!46075 (lemmaIsPrefixRefl!0 (_2!1708 lt!45625)))))

(declare-fun lt!46076 () Unit!2383)

(declare-fun lt!46082 () Unit!2383)

(assert (=> d!9182 (= lt!46076 lt!46082)))

(assert (=> d!9182 (= lt!46082 (lemmaIsPrefixRefl!0 (_2!1708 lt!45625)))))

(declare-fun lt!46078 () Unit!2383)

(declare-fun lt!46072 () Unit!2383)

(assert (=> d!9182 (= lt!46078 lt!46072)))

(assert (=> d!9182 (isPrefixOf!0 lt!46080 lt!46080)))

(assert (=> d!9182 (= lt!46072 (lemmaIsPrefixRefl!0 lt!46080))))

(declare-fun lt!46066 () Unit!2383)

(declare-fun lt!46073 () Unit!2383)

(assert (=> d!9182 (= lt!46066 lt!46073)))

(assert (=> d!9182 (isPrefixOf!0 thiss!1379 thiss!1379)))

(assert (=> d!9182 (= lt!46073 (lemmaIsPrefixRefl!0 thiss!1379))))

(assert (=> d!9182 (= lt!46080 (BitStream!1381 (buf!1116 (_2!1708 lt!45625)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379)))))

(assert (=> d!9182 (isPrefixOf!0 thiss!1379 (_2!1708 lt!45625))))

(assert (=> d!9182 (= (reader!0 thiss!1379 (_2!1708 lt!45625)) lt!46065)))

(declare-fun b!31371 () Bool)

(declare-fun res!26886 () Bool)

(assert (=> b!31371 (=> (not res!26886) (not e!20813))))

(assert (=> b!31371 (= res!26886 (isPrefixOf!0 (_1!1709 lt!46065) thiss!1379))))

(declare-fun b!31372 () Bool)

(declare-fun lt!46074 () Unit!2383)

(assert (=> b!31372 (= e!20814 lt!46074)))

(declare-fun lt!46063 () (_ BitVec 64))

(assert (=> b!31372 (= lt!46063 #b0000000000000000000000000000000000000000000000000000000000000000)))

(declare-fun lt!46067 () (_ BitVec 64))

(assert (=> b!31372 (= lt!46067 (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379)))))

(assert (=> b!31372 (= lt!46074 (arrayBitRangesEqSymmetric!0 (buf!1116 thiss!1379) (buf!1116 (_2!1708 lt!45625)) lt!46063 lt!46067))))

(assert (=> b!31372 (arrayBitRangesEq!0 (buf!1116 (_2!1708 lt!45625)) (buf!1116 thiss!1379) lt!46063 lt!46067)))

(declare-fun b!31373 () Bool)

(declare-fun res!26888 () Bool)

(assert (=> b!31373 (=> (not res!26888) (not e!20813))))

(assert (=> b!31373 (= res!26888 (isPrefixOf!0 (_2!1709 lt!46065) (_2!1708 lt!45625)))))

(declare-fun b!31374 () Bool)

(declare-fun Unit!2396 () Unit!2383)

(assert (=> b!31374 (= e!20814 Unit!2396)))

(declare-fun lt!46081 () (_ BitVec 64))

(declare-fun b!31375 () Bool)

(declare-fun lt!46069 () (_ BitVec 64))

(assert (=> b!31375 (= e!20813 (= (_1!1709 lt!46065) (withMovedBitIndex!0 (_2!1709 lt!46065) (bvsub lt!46069 lt!46081))))))

(assert (=> b!31375 (or (= (bvand lt!46069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46081 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!46069 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!46069 lt!46081) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> b!31375 (= lt!46081 (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45625))) (currentByte!2471 (_2!1708 lt!45625)) (currentBit!2466 (_2!1708 lt!45625))))))

(assert (=> b!31375 (= lt!46069 (bitIndex!0 (size!788 (buf!1116 thiss!1379)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379)))))

(assert (= (and d!9182 c!2112) b!31372))

(assert (= (and d!9182 (not c!2112)) b!31374))

(assert (= (and d!9182 res!26887) b!31371))

(assert (= (and b!31371 res!26886) b!31373))

(assert (= (and b!31373 res!26888) b!31375))

(declare-fun m!46121 () Bool)

(assert (=> d!9182 m!46121))

(declare-fun m!46123 () Bool)

(assert (=> d!9182 m!46123))

(assert (=> d!9182 m!45709))

(assert (=> d!9182 m!46099))

(declare-fun m!46125 () Bool)

(assert (=> d!9182 m!46125))

(declare-fun m!46127 () Bool)

(assert (=> d!9182 m!46127))

(assert (=> d!9182 m!46105))

(declare-fun m!46129 () Bool)

(assert (=> d!9182 m!46129))

(assert (=> d!9182 m!45769))

(assert (=> d!9182 m!45771))

(declare-fun m!46131 () Bool)

(assert (=> d!9182 m!46131))

(declare-fun m!46133 () Bool)

(assert (=> b!31371 m!46133))

(assert (=> b!31372 m!45773))

(declare-fun m!46135 () Bool)

(assert (=> b!31372 m!46135))

(declare-fun m!46137 () Bool)

(assert (=> b!31372 m!46137))

(declare-fun m!46139 () Bool)

(assert (=> b!31375 m!46139))

(assert (=> b!31375 m!45753))

(assert (=> b!31375 m!45773))

(declare-fun m!46141 () Bool)

(assert (=> b!31373 m!46141))

(assert (=> b!31140 d!9182))

(declare-fun d!9184 () Bool)

(assert (=> d!9184 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45625)))) ((_ sign_extend 32) (currentByte!2471 thiss!1379)) ((_ sign_extend 32) (currentBit!2466 thiss!1379)) (bvsub to!314 i!635)) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45625)))) ((_ sign_extend 32) (currentByte!2471 thiss!1379)) ((_ sign_extend 32) (currentBit!2466 thiss!1379))) (bvsub to!314 i!635)))))

(declare-fun bs!2534 () Bool)

(assert (= bs!2534 d!9184))

(declare-fun m!46143 () Bool)

(assert (=> bs!2534 m!46143))

(assert (=> b!31140 d!9184))

(declare-fun d!9186 () Bool)

(assert (=> d!9186 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45625)))) ((_ sign_extend 32) (currentByte!2471 thiss!1379)) ((_ sign_extend 32) (currentBit!2466 thiss!1379)) (bvsub to!314 i!635))))

(declare-fun lt!46083 () Unit!2383)

(assert (=> d!9186 (= lt!46083 (choose!9 thiss!1379 (buf!1116 (_2!1708 lt!45625)) (bvsub to!314 i!635) (BitStream!1381 (buf!1116 (_2!1708 lt!45625)) (currentByte!2471 thiss!1379) (currentBit!2466 thiss!1379))))))

(assert (=> d!9186 (= (validateOffsetBitsContentIrrelevancyLemma!0 thiss!1379 (buf!1116 (_2!1708 lt!45625)) (bvsub to!314 i!635)) lt!46083)))

(declare-fun bs!2535 () Bool)

(assert (= bs!2535 d!9186))

(assert (=> bs!2535 m!45695))

(declare-fun m!46145 () Bool)

(assert (=> bs!2535 m!46145))

(assert (=> b!31140 d!9186))

(declare-fun lt!46086 () (_ BitVec 64))

(declare-fun lt!46084 () tuple2!3250)

(declare-fun e!20815 () tuple2!3252)

(declare-fun b!31377 () Bool)

(assert (=> b!31377 (= e!20815 (tuple2!3253 (Cons!387 (_1!1712 lt!46084) (bitStreamReadBitsIntoList!0 (_2!1708 lt!45625) (_2!1712 lt!46084) (bvsub lt!45623 lt!46086))) (_2!1712 lt!46084)))))

(assert (=> b!31377 (= lt!46084 (readBit!0 (_1!1709 lt!45630)))))

(assert (=> b!31377 (= lt!46086 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!31376 () Bool)

(assert (=> b!31376 (= e!20815 (tuple2!3253 Nil!388 (_1!1709 lt!45630)))))

(declare-fun b!31379 () Bool)

(declare-fun e!20816 () Bool)

(declare-fun lt!46085 () List!391)

(assert (=> b!31379 (= e!20816 (> (length!117 lt!46085) 0))))

(declare-fun d!9188 () Bool)

(assert (=> d!9188 e!20816))

(declare-fun c!2114 () Bool)

(assert (=> d!9188 (= c!2114 (= lt!45623 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9188 (= lt!46085 (_1!1713 e!20815))))

(declare-fun c!2113 () Bool)

(assert (=> d!9188 (= c!2113 (= lt!45623 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9188 (bvsge lt!45623 #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9188 (= (bitStreamReadBitsIntoList!0 (_2!1708 lt!45625) (_1!1709 lt!45630) lt!45623) lt!46085)))

(declare-fun b!31378 () Bool)

(assert (=> b!31378 (= e!20816 (isEmpty!84 lt!46085))))

(assert (= (and d!9188 c!2113) b!31376))

(assert (= (and d!9188 (not c!2113)) b!31377))

(assert (= (and d!9188 c!2114) b!31378))

(assert (= (and d!9188 (not c!2114)) b!31379))

(declare-fun m!46147 () Bool)

(assert (=> b!31377 m!46147))

(declare-fun m!46149 () Bool)

(assert (=> b!31377 m!46149))

(declare-fun m!46151 () Bool)

(assert (=> b!31379 m!46151))

(declare-fun m!46153 () Bool)

(assert (=> b!31378 m!46153))

(assert (=> b!31140 d!9188))

(declare-fun d!9190 () Bool)

(assert (=> d!9190 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45625)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45624))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45624))) lt!45623) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45625)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45624))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45624)))) lt!45623))))

(declare-fun bs!2536 () Bool)

(assert (= bs!2536 d!9190))

(declare-fun m!46155 () Bool)

(assert (=> bs!2536 m!46155))

(assert (=> b!31140 d!9190))

(declare-fun d!9192 () Bool)

(assert (=> d!9192 (validate_offset_bits!1 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45625)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45624))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45624))) lt!45623)))

(declare-fun lt!46087 () Unit!2383)

(assert (=> d!9192 (= lt!46087 (choose!9 (_2!1708 lt!45624) (buf!1116 (_2!1708 lt!45625)) lt!45623 (BitStream!1381 (buf!1116 (_2!1708 lt!45625)) (currentByte!2471 (_2!1708 lt!45624)) (currentBit!2466 (_2!1708 lt!45624)))))))

(assert (=> d!9192 (= (validateOffsetBitsContentIrrelevancyLemma!0 (_2!1708 lt!45624) (buf!1116 (_2!1708 lt!45625)) lt!45623) lt!46087)))

(declare-fun bs!2537 () Bool)

(assert (= bs!2537 d!9192))

(assert (=> bs!2537 m!45693))

(declare-fun m!46157 () Bool)

(assert (=> bs!2537 m!46157))

(assert (=> b!31140 d!9192))

(declare-fun lt!46088 () tuple2!3250)

(declare-fun b!31381 () Bool)

(declare-fun lt!46090 () (_ BitVec 64))

(declare-fun e!20817 () tuple2!3252)

(assert (=> b!31381 (= e!20817 (tuple2!3253 (Cons!387 (_1!1712 lt!46088) (bitStreamReadBitsIntoList!0 (_2!1708 lt!45625) (_2!1712 lt!46088) (bvsub (bvsub to!314 i!635) lt!46090))) (_2!1712 lt!46088)))))

(assert (=> b!31381 (= lt!46088 (readBit!0 (_1!1709 lt!45627)))))

(assert (=> b!31381 (= lt!46090 #b0000000000000000000000000000000000000000000000000000000000000001)))

(declare-fun b!31380 () Bool)

(assert (=> b!31380 (= e!20817 (tuple2!3253 Nil!388 (_1!1709 lt!45627)))))

(declare-fun b!31383 () Bool)

(declare-fun e!20818 () Bool)

(declare-fun lt!46089 () List!391)

(assert (=> b!31383 (= e!20818 (> (length!117 lt!46089) 0))))

(declare-fun d!9194 () Bool)

(assert (=> d!9194 e!20818))

(declare-fun c!2116 () Bool)

(assert (=> d!9194 (= c!2116 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9194 (= lt!46089 (_1!1713 e!20817))))

(declare-fun c!2115 () Bool)

(assert (=> d!9194 (= c!2115 (= (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> d!9194 (bvsge (bvsub to!314 i!635) #b0000000000000000000000000000000000000000000000000000000000000000)))

(assert (=> d!9194 (= (bitStreamReadBitsIntoList!0 (_2!1708 lt!45625) (_1!1709 lt!45627) (bvsub to!314 i!635)) lt!46089)))

(declare-fun b!31382 () Bool)

(assert (=> b!31382 (= e!20818 (isEmpty!84 lt!46089))))

(assert (= (and d!9194 c!2115) b!31380))

(assert (= (and d!9194 (not c!2115)) b!31381))

(assert (= (and d!9194 c!2116) b!31382))

(assert (= (and d!9194 (not c!2116)) b!31383))

(declare-fun m!46159 () Bool)

(assert (=> b!31381 m!46159))

(declare-fun m!46161 () Bool)

(assert (=> b!31381 m!46161))

(declare-fun m!46163 () Bool)

(assert (=> b!31383 m!46163))

(declare-fun m!46165 () Bool)

(assert (=> b!31382 m!46165))

(assert (=> b!31140 d!9194))

(declare-fun d!9196 () Bool)

(declare-fun size!790 (List!391) Int)

(assert (=> d!9196 (= (length!117 lt!45622) (size!790 lt!45622))))

(declare-fun bs!2538 () Bool)

(assert (= bs!2538 d!9196))

(declare-fun m!46167 () Bool)

(assert (=> bs!2538 m!46167))

(assert (=> b!31138 d!9196))

(declare-fun d!9198 () Bool)

(assert (=> d!9198 (= (bitAt!0 (buf!1116 (_1!1709 lt!45630)) lt!45640) (not (= (bvand ((_ sign_extend 24) (select (arr!1257 (buf!1116 (_1!1709 lt!45630))) ((_ extract 31 0) (bvsdiv lt!45640 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!45640 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2539 () Bool)

(assert (= bs!2539 d!9198))

(declare-fun m!46169 () Bool)

(assert (=> bs!2539 m!46169))

(declare-fun m!46171 () Bool)

(assert (=> bs!2539 m!46171))

(assert (=> b!31137 d!9198))

(declare-fun d!9200 () Bool)

(assert (=> d!9200 (= (bitAt!0 (buf!1116 (_1!1709 lt!45627)) lt!45640) (not (= (bvand ((_ sign_extend 24) (select (arr!1257 (buf!1116 (_1!1709 lt!45627))) ((_ extract 31 0) (bvsdiv lt!45640 #b0000000000000000000000000000000000000000000000000000000000001000)))) ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) ((_ extract 31 0) (bvsrem lt!45640 #b0000000000000000000000000000000000000000000000000000000000001000))))) #b00000000000000000000000000000000)))))

(declare-fun bs!2540 () Bool)

(assert (= bs!2540 d!9200))

(declare-fun m!46173 () Bool)

(assert (=> bs!2540 m!46173))

(assert (=> bs!2540 m!46171))

(assert (=> b!31137 d!9200))

(declare-fun d!9202 () Bool)

(declare-fun e!20819 () Bool)

(assert (=> d!9202 e!20819))

(declare-fun res!26890 () Bool)

(assert (=> d!9202 (=> (not res!26890) (not e!20819))))

(declare-fun lt!46094 () (_ BitVec 64))

(declare-fun lt!46091 () (_ BitVec 64))

(declare-fun lt!46093 () (_ BitVec 64))

(assert (=> d!9202 (= res!26890 (= lt!46093 (bvsub lt!46094 lt!46091)))))

(assert (=> d!9202 (or (= (bvand lt!46094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!46091 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!46094 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!46094 lt!46091) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!9202 (= lt!46091 (remainingBits!0 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45624)))) ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45624))) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45624)))))))

(declare-fun lt!46096 () (_ BitVec 64))

(declare-fun lt!46092 () (_ BitVec 64))

(assert (=> d!9202 (= lt!46094 (bvmul lt!46096 lt!46092))))

(assert (=> d!9202 (or (= lt!46096 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!46092 (bvsdiv (bvmul lt!46096 lt!46092) lt!46096)))))

(assert (=> d!9202 (= lt!46092 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!9202 (= lt!46096 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45624)))))))

(assert (=> d!9202 (= lt!46093 (bvadd (bvmul ((_ sign_extend 32) (currentByte!2471 (_2!1708 lt!45624))) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!2466 (_2!1708 lt!45624)))))))

(assert (=> d!9202 (invariant!0 (currentBit!2466 (_2!1708 lt!45624)) (currentByte!2471 (_2!1708 lt!45624)) (size!788 (buf!1116 (_2!1708 lt!45624))))))

(assert (=> d!9202 (= (bitIndex!0 (size!788 (buf!1116 (_2!1708 lt!45624))) (currentByte!2471 (_2!1708 lt!45624)) (currentBit!2466 (_2!1708 lt!45624))) lt!46093)))

(declare-fun b!31384 () Bool)

(declare-fun res!26889 () Bool)

(assert (=> b!31384 (=> (not res!26889) (not e!20819))))

(assert (=> b!31384 (= res!26889 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!46093))))

(declare-fun b!31385 () Bool)

(declare-fun lt!46095 () (_ BitVec 64))

(assert (=> b!31385 (= e!20819 (bvsle lt!46093 (bvmul lt!46095 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!31385 (or (= lt!46095 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!46095 #b0000000000000000000000000000000000000000000000000000000000001000) lt!46095)))))

(assert (=> b!31385 (= lt!46095 ((_ sign_extend 32) (size!788 (buf!1116 (_2!1708 lt!45624)))))))

(assert (= (and d!9202 res!26890) b!31384))

(assert (= (and b!31384 res!26889) b!31385))

(assert (=> d!9202 m!46055))

(assert (=> d!9202 m!45755))

(assert (=> b!31147 d!9202))

(declare-fun d!9204 () Bool)

(assert (=> d!9204 (= (invariant!0 (currentBit!2466 (_2!1708 lt!45624)) (currentByte!2471 (_2!1708 lt!45624)) (size!788 (buf!1116 (_2!1708 lt!45625)))) (and (bvsge (currentBit!2466 (_2!1708 lt!45624)) #b00000000000000000000000000000000) (bvslt (currentBit!2466 (_2!1708 lt!45624)) #b00000000000000000000000000001000) (bvsge (currentByte!2471 (_2!1708 lt!45624)) #b00000000000000000000000000000000) (or (bvslt (currentByte!2471 (_2!1708 lt!45624)) (size!788 (buf!1116 (_2!1708 lt!45625)))) (and (= (currentBit!2466 (_2!1708 lt!45624)) #b00000000000000000000000000000000) (= (currentByte!2471 (_2!1708 lt!45624)) (size!788 (buf!1116 (_2!1708 lt!45625))))))))))

(assert (=> b!31136 d!9204))

(check-sat (not b!31295) (not b!31372) (not b!31301) (not b!31353) (not b!31357) (not b!31382) (not b!31210) (not b!31365) (not d!9152) (not b!31379) (not b!31361) (not d!9166) (not b!31378) (not b!31314) (not b!31367) (not d!9202) (not d!9186) (not d!9170) (not b!31296) (not b!31294) (not b!31373) (not d!9148) (not b!31303) (not b!31383) (not b!31231) (not d!9178) (not d!9172) (not d!9164) (not b!31354) (not b!31377) (not d!9196) (not d!9182) (not d!9158) (not b!31321) (not b!31328) (not d!9184) (not d!9070) (not b!31222) (not b!31330) (not d!9162) (not d!9156) (not b!31359) (not bm!400) (not b!31368) (not d!9190) (not b!31316) (not b!31366) (not d!9192) (not b!31355) (not b!31356) (not b!31352) (not b!31221) (not b!31315) (not b!31370) (not b!31351) (not b!31333) (not b!31375) (not b!31299) (not b!31297) (not b!31229) (not b!31298) (not d!9144) (not d!9074) (not b!31220) (not d!9072) (not d!9180) (not b!31318) (not b!31358) (not b!31371) (not b!31381))
