; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!17190 () Bool)

(assert start!17190)

(declare-fun b!83720 () Bool)

(declare-fun e!55765 () Bool)

(declare-fun e!55767 () Bool)

(assert (=> b!83720 (= e!55765 e!55767)))

(declare-fun res!68824 () Bool)

(assert (=> b!83720 (=> (not res!68824) (not e!55767))))

(declare-fun lt!133516 () (_ BitVec 64))

(declare-fun lt!133517 () (_ BitVec 64))

(assert (=> b!83720 (= res!68824 (= lt!133516 lt!133517))))

(declare-datatypes ((array!3868 0))(
  ( (array!3869 (arr!2395 (Array (_ BitVec 32) (_ BitVec 8))) (size!1758 (_ BitVec 32))) )
))
(declare-datatypes ((BitStream!3078 0))(
  ( (BitStream!3079 (buf!2148 array!3868) (currentByte!4269 (_ BitVec 32)) (currentBit!4264 (_ BitVec 32))) )
))
(declare-fun b2!98 () BitStream!3078)

(declare-fun bitIndex!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) (_ BitVec 64))

(assert (=> b!83720 (= lt!133517 (bitIndex!0 (size!1758 (buf!2148 b2!98)) (currentByte!4269 b2!98) (currentBit!4264 b2!98)))))

(declare-fun lt!133521 () (_ BitVec 64))

(declare-fun b1b2Diff!1 () (_ BitVec 64))

(assert (=> b!83720 (= lt!133516 (bvadd lt!133521 b1b2Diff!1))))

(declare-fun b1!98 () BitStream!3078)

(assert (=> b!83720 (= lt!133521 (bitIndex!0 (size!1758 (buf!2148 b1!98)) (currentByte!4269 b1!98) (currentBit!4264 b1!98)))))

(declare-fun e!55766 () Bool)

(declare-fun b!83721 () Bool)

(declare-fun lt!133518 () (_ BitVec 64))

(declare-fun lt!133514 () (_ BitVec 64))

(assert (=> b!83721 (= e!55766 (or (= lt!133514 (bvand lt!133516 #b1000000000000000000000000000000000000000000000000000000000000000)) (= lt!133514 (bvand (bvsub lt!133518 lt!133516) #b1000000000000000000000000000000000000000000000000000000000000000))))))

(assert (=> b!83721 (= lt!133514 (bvand lt!133518 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun remainingBits!0 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) (_ BitVec 64))

(assert (=> b!83721 (= (remainingBits!0 ((_ sign_extend 32) (size!1758 (buf!2148 b2!98))) ((_ sign_extend 32) (currentByte!4269 b2!98)) ((_ sign_extend 32) (currentBit!4264 b2!98))) (bvsub lt!133518 lt!133517))))

(assert (=> b!83721 (= lt!133518 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1758 (buf!2148 b2!98)))))))

(declare-datatypes ((Unit!5619 0))(
  ( (Unit!5620) )
))
(declare-fun lt!133519 () Unit!5619)

(declare-fun remainingBitsBitIndexLemma!0 (BitStream!3078) Unit!5619)

(assert (=> b!83721 (= lt!133519 (remainingBitsBitIndexLemma!0 b2!98))))

(declare-fun res!68827 () Bool)

(assert (=> start!17190 (=> (not res!68827) (not e!55765))))

(declare-fun b1ValidateOffsetBits!11 () (_ BitVec 64))

(assert (=> start!17190 (= res!68827 (and (= (size!1758 (buf!2148 b1!98)) (size!1758 (buf!2148 b2!98))) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1ValidateOffsetBits!11) (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 b1b2Diff!1) (bvsle b1b2Diff!1 b1ValidateOffsetBits!11)))))

(assert (=> start!17190 e!55765))

(declare-fun e!55764 () Bool)

(declare-fun inv!12 (BitStream!3078) Bool)

(assert (=> start!17190 (and (inv!12 b1!98) e!55764)))

(declare-fun e!55769 () Bool)

(assert (=> start!17190 (and (inv!12 b2!98) e!55769)))

(assert (=> start!17190 true))

(declare-fun b!83722 () Bool)

(declare-fun array_inv!1604 (array!3868) Bool)

(assert (=> b!83722 (= e!55764 (array_inv!1604 (buf!2148 b1!98)))))

(declare-fun b!83723 () Bool)

(declare-fun res!68825 () Bool)

(assert (=> b!83723 (=> (not res!68825) (not e!55765))))

(declare-fun validate_offset_bits!1 ((_ BitVec 64) (_ BitVec 64) (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!83723 (= res!68825 (validate_offset_bits!1 ((_ sign_extend 32) (size!1758 (buf!2148 b1!98))) ((_ sign_extend 32) (currentByte!4269 b1!98)) ((_ sign_extend 32) (currentBit!4264 b1!98)) b1ValidateOffsetBits!11))))

(declare-fun b!83724 () Bool)

(assert (=> b!83724 (= e!55769 (array_inv!1604 (buf!2148 b2!98)))))

(declare-fun b!83725 () Bool)

(assert (=> b!83725 (= e!55767 (not e!55766))))

(declare-fun res!68826 () Bool)

(assert (=> b!83725 (=> res!68826 e!55766)))

(declare-fun lt!133515 () (_ BitVec 64))

(assert (=> b!83725 (= res!68826 (bvsgt lt!133521 (bvsub lt!133515 b1ValidateOffsetBits!11)))))

(assert (=> b!83725 (= (remainingBits!0 ((_ sign_extend 32) (size!1758 (buf!2148 b1!98))) ((_ sign_extend 32) (currentByte!4269 b1!98)) ((_ sign_extend 32) (currentBit!4264 b1!98))) (bvsub lt!133515 lt!133521))))

(assert (=> b!83725 (= lt!133515 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!1758 (buf!2148 b1!98)))))))

(declare-fun lt!133520 () Unit!5619)

(assert (=> b!83725 (= lt!133520 (remainingBitsBitIndexLemma!0 b1!98))))

(assert (= (and start!17190 res!68827) b!83723))

(assert (= (and b!83723 res!68825) b!83720))

(assert (= (and b!83720 res!68824) b!83725))

(assert (= (and b!83725 (not res!68826)) b!83721))

(assert (= start!17190 b!83722))

(assert (= start!17190 b!83724))

(declare-fun m!130339 () Bool)

(assert (=> b!83725 m!130339))

(declare-fun m!130341 () Bool)

(assert (=> b!83725 m!130341))

(declare-fun m!130343 () Bool)

(assert (=> b!83722 m!130343))

(declare-fun m!130345 () Bool)

(assert (=> b!83720 m!130345))

(declare-fun m!130347 () Bool)

(assert (=> b!83720 m!130347))

(declare-fun m!130349 () Bool)

(assert (=> b!83723 m!130349))

(declare-fun m!130351 () Bool)

(assert (=> b!83724 m!130351))

(declare-fun m!130353 () Bool)

(assert (=> start!17190 m!130353))

(declare-fun m!130355 () Bool)

(assert (=> start!17190 m!130355))

(declare-fun m!130357 () Bool)

(assert (=> b!83721 m!130357))

(declare-fun m!130359 () Bool)

(assert (=> b!83721 m!130359))

(check-sat (not b!83720) (not b!83723) (not start!17190) (not b!83724) (not b!83722) (not b!83725) (not b!83721))
(check-sat)
(get-model)

(declare-fun d!26842 () Bool)

(assert (=> d!26842 (= (remainingBits!0 ((_ sign_extend 32) (size!1758 (buf!2148 b2!98))) ((_ sign_extend 32) (currentByte!4269 b2!98)) ((_ sign_extend 32) (currentBit!4264 b2!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1758 (buf!2148 b2!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4269 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4264 b2!98)))))))

(assert (=> b!83721 d!26842))

(declare-fun d!26844 () Bool)

(declare-fun lt!133603 () (_ BitVec 64))

(declare-fun lt!133602 () (_ BitVec 64))

(assert (=> d!26844 (= (remainingBits!0 ((_ sign_extend 32) (size!1758 (buf!2148 b2!98))) ((_ sign_extend 32) (currentByte!4269 b2!98)) ((_ sign_extend 32) (currentBit!4264 b2!98))) (bvsub lt!133603 lt!133602))))

(assert (=> d!26844 (or (= (bvand lt!133603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133602 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133603 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133603 lt!133602) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26844 (= lt!133602 (bitIndex!0 (size!1758 (buf!2148 b2!98)) (currentByte!4269 b2!98) (currentBit!4264 b2!98)))))

(declare-fun lt!133601 () (_ BitVec 64))

(declare-fun lt!133600 () (_ BitVec 64))

(assert (=> d!26844 (= lt!133603 (bvmul lt!133601 lt!133600))))

(assert (=> d!26844 (or (= lt!133601 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133600 (bvsdiv (bvmul lt!133601 lt!133600) lt!133601)))))

(assert (=> d!26844 (= lt!133600 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26844 (= lt!133601 ((_ sign_extend 32) (size!1758 (buf!2148 b2!98))))))

(declare-fun lt!133604 () Unit!5619)

(declare-fun choose!23 (BitStream!3078) Unit!5619)

(assert (=> d!26844 (= lt!133604 (choose!23 b2!98))))

(assert (=> d!26844 (= (remainingBitsBitIndexLemma!0 b2!98) lt!133604)))

(declare-fun bs!6612 () Bool)

(assert (= bs!6612 d!26844))

(assert (=> bs!6612 m!130357))

(assert (=> bs!6612 m!130345))

(declare-fun m!130391 () Bool)

(assert (=> bs!6612 m!130391))

(assert (=> b!83721 d!26844))

(declare-fun d!26846 () Bool)

(assert (=> d!26846 (= (validate_offset_bits!1 ((_ sign_extend 32) (size!1758 (buf!2148 b1!98))) ((_ sign_extend 32) (currentByte!4269 b1!98)) ((_ sign_extend 32) (currentBit!4264 b1!98)) b1ValidateOffsetBits!11) (bvsge (remainingBits!0 ((_ sign_extend 32) (size!1758 (buf!2148 b1!98))) ((_ sign_extend 32) (currentByte!4269 b1!98)) ((_ sign_extend 32) (currentBit!4264 b1!98))) b1ValidateOffsetBits!11))))

(declare-fun bs!6613 () Bool)

(assert (= bs!6613 d!26846))

(assert (=> bs!6613 m!130339))

(assert (=> b!83723 d!26846))

(declare-fun d!26848 () Bool)

(assert (=> d!26848 (= (array_inv!1604 (buf!2148 b1!98)) (bvsge (size!1758 (buf!2148 b1!98)) #b00000000000000000000000000000000))))

(assert (=> b!83722 d!26848))

(declare-fun d!26850 () Bool)

(assert (=> d!26850 (= (array_inv!1604 (buf!2148 b2!98)) (bvsge (size!1758 (buf!2148 b2!98)) #b00000000000000000000000000000000))))

(assert (=> b!83724 d!26850))

(declare-fun d!26852 () Bool)

(declare-fun e!55798 () Bool)

(assert (=> d!26852 e!55798))

(declare-fun res!68853 () Bool)

(assert (=> d!26852 (=> (not res!68853) (not e!55798))))

(declare-fun lt!133622 () (_ BitVec 64))

(declare-fun lt!133618 () (_ BitVec 64))

(declare-fun lt!133621 () (_ BitVec 64))

(assert (=> d!26852 (= res!68853 (= lt!133622 (bvsub lt!133618 lt!133621)))))

(assert (=> d!26852 (or (= (bvand lt!133618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133621 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133618 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133618 lt!133621) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26852 (= lt!133621 (remainingBits!0 ((_ sign_extend 32) (size!1758 (buf!2148 b2!98))) ((_ sign_extend 32) (currentByte!4269 b2!98)) ((_ sign_extend 32) (currentBit!4264 b2!98))))))

(declare-fun lt!133619 () (_ BitVec 64))

(declare-fun lt!133620 () (_ BitVec 64))

(assert (=> d!26852 (= lt!133618 (bvmul lt!133619 lt!133620))))

(assert (=> d!26852 (or (= lt!133619 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133620 (bvsdiv (bvmul lt!133619 lt!133620) lt!133619)))))

(assert (=> d!26852 (= lt!133620 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26852 (= lt!133619 ((_ sign_extend 32) (size!1758 (buf!2148 b2!98))))))

(assert (=> d!26852 (= lt!133622 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4269 b2!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4264 b2!98))))))

(declare-fun invariant!0 ((_ BitVec 32) (_ BitVec 32) (_ BitVec 32)) Bool)

(assert (=> d!26852 (invariant!0 (currentBit!4264 b2!98) (currentByte!4269 b2!98) (size!1758 (buf!2148 b2!98)))))

(assert (=> d!26852 (= (bitIndex!0 (size!1758 (buf!2148 b2!98)) (currentByte!4269 b2!98) (currentBit!4264 b2!98)) lt!133622)))

(declare-fun b!83758 () Bool)

(declare-fun res!68852 () Bool)

(assert (=> b!83758 (=> (not res!68852) (not e!55798))))

(assert (=> b!83758 (= res!68852 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133622))))

(declare-fun b!83759 () Bool)

(declare-fun lt!133617 () (_ BitVec 64))

(assert (=> b!83759 (= e!55798 (bvsle lt!133622 (bvmul lt!133617 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83759 (or (= lt!133617 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133617 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133617)))))

(assert (=> b!83759 (= lt!133617 ((_ sign_extend 32) (size!1758 (buf!2148 b2!98))))))

(assert (= (and d!26852 res!68853) b!83758))

(assert (= (and b!83758 res!68852) b!83759))

(assert (=> d!26852 m!130357))

(declare-fun m!130393 () Bool)

(assert (=> d!26852 m!130393))

(assert (=> b!83720 d!26852))

(declare-fun d!26854 () Bool)

(declare-fun e!55799 () Bool)

(assert (=> d!26854 e!55799))

(declare-fun res!68855 () Bool)

(assert (=> d!26854 (=> (not res!68855) (not e!55799))))

(declare-fun lt!133624 () (_ BitVec 64))

(declare-fun lt!133628 () (_ BitVec 64))

(declare-fun lt!133627 () (_ BitVec 64))

(assert (=> d!26854 (= res!68855 (= lt!133628 (bvsub lt!133624 lt!133627)))))

(assert (=> d!26854 (or (= (bvand lt!133624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133627 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133624 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133624 lt!133627) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26854 (= lt!133627 (remainingBits!0 ((_ sign_extend 32) (size!1758 (buf!2148 b1!98))) ((_ sign_extend 32) (currentByte!4269 b1!98)) ((_ sign_extend 32) (currentBit!4264 b1!98))))))

(declare-fun lt!133625 () (_ BitVec 64))

(declare-fun lt!133626 () (_ BitVec 64))

(assert (=> d!26854 (= lt!133624 (bvmul lt!133625 lt!133626))))

(assert (=> d!26854 (or (= lt!133625 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133626 (bvsdiv (bvmul lt!133625 lt!133626) lt!133625)))))

(assert (=> d!26854 (= lt!133626 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26854 (= lt!133625 ((_ sign_extend 32) (size!1758 (buf!2148 b1!98))))))

(assert (=> d!26854 (= lt!133628 (bvadd (bvmul ((_ sign_extend 32) (currentByte!4269 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4264 b1!98))))))

(assert (=> d!26854 (invariant!0 (currentBit!4264 b1!98) (currentByte!4269 b1!98) (size!1758 (buf!2148 b1!98)))))

(assert (=> d!26854 (= (bitIndex!0 (size!1758 (buf!2148 b1!98)) (currentByte!4269 b1!98) (currentBit!4264 b1!98)) lt!133628)))

(declare-fun b!83760 () Bool)

(declare-fun res!68854 () Bool)

(assert (=> b!83760 (=> (not res!68854) (not e!55799))))

(assert (=> b!83760 (= res!68854 (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 lt!133628))))

(declare-fun b!83761 () Bool)

(declare-fun lt!133623 () (_ BitVec 64))

(assert (=> b!83761 (= e!55799 (bvsle lt!133628 (bvmul lt!133623 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!83761 (or (= lt!133623 #b0000000000000000000000000000000000000000000000000000000000000000) (= #b0000000000000000000000000000000000000000000000000000000000001000 (bvsdiv (bvmul lt!133623 #b0000000000000000000000000000000000000000000000000000000000001000) lt!133623)))))

(assert (=> b!83761 (= lt!133623 ((_ sign_extend 32) (size!1758 (buf!2148 b1!98))))))

(assert (= (and d!26854 res!68855) b!83760))

(assert (= (and b!83760 res!68854) b!83761))

(assert (=> d!26854 m!130339))

(declare-fun m!130395 () Bool)

(assert (=> d!26854 m!130395))

(assert (=> b!83720 d!26854))

(declare-fun d!26856 () Bool)

(assert (=> d!26856 (= (remainingBits!0 ((_ sign_extend 32) (size!1758 (buf!2148 b1!98))) ((_ sign_extend 32) (currentByte!4269 b1!98)) ((_ sign_extend 32) (currentBit!4264 b1!98))) (bvsub (bvmul ((_ sign_extend 32) (size!1758 (buf!2148 b1!98))) #b0000000000000000000000000000000000000000000000000000000000001000) (bvadd (bvmul ((_ sign_extend 32) (currentByte!4269 b1!98)) #b0000000000000000000000000000000000000000000000000000000000001000) ((_ sign_extend 32) (currentBit!4264 b1!98)))))))

(assert (=> b!83725 d!26856))

(declare-fun d!26858 () Bool)

(declare-fun lt!133632 () (_ BitVec 64))

(declare-fun lt!133631 () (_ BitVec 64))

(assert (=> d!26858 (= (remainingBits!0 ((_ sign_extend 32) (size!1758 (buf!2148 b1!98))) ((_ sign_extend 32) (currentByte!4269 b1!98)) ((_ sign_extend 32) (currentBit!4264 b1!98))) (bvsub lt!133632 lt!133631))))

(assert (=> d!26858 (or (= (bvand lt!133632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand lt!133631 #b1000000000000000000000000000000000000000000000000000000000000000)) (= (bvand lt!133632 #b1000000000000000000000000000000000000000000000000000000000000000) (bvand (bvsub lt!133632 lt!133631) #b1000000000000000000000000000000000000000000000000000000000000000)))))

(assert (=> d!26858 (= lt!133631 (bitIndex!0 (size!1758 (buf!2148 b1!98)) (currentByte!4269 b1!98) (currentBit!4264 b1!98)))))

(declare-fun lt!133630 () (_ BitVec 64))

(declare-fun lt!133629 () (_ BitVec 64))

(assert (=> d!26858 (= lt!133632 (bvmul lt!133630 lt!133629))))

(assert (=> d!26858 (or (= lt!133630 #b0000000000000000000000000000000000000000000000000000000000000000) (= lt!133629 (bvsdiv (bvmul lt!133630 lt!133629) lt!133630)))))

(assert (=> d!26858 (= lt!133629 #b0000000000000000000000000000000000000000000000000000000000001000)))

(assert (=> d!26858 (= lt!133630 ((_ sign_extend 32) (size!1758 (buf!2148 b1!98))))))

(declare-fun lt!133633 () Unit!5619)

(assert (=> d!26858 (= lt!133633 (choose!23 b1!98))))

(assert (=> d!26858 (= (remainingBitsBitIndexLemma!0 b1!98) lt!133633)))

(declare-fun bs!6614 () Bool)

(assert (= bs!6614 d!26858))

(assert (=> bs!6614 m!130339))

(assert (=> bs!6614 m!130347))

(declare-fun m!130397 () Bool)

(assert (=> bs!6614 m!130397))

(assert (=> b!83725 d!26858))

(declare-fun d!26860 () Bool)

(assert (=> d!26860 (= (inv!12 b1!98) (invariant!0 (currentBit!4264 b1!98) (currentByte!4269 b1!98) (size!1758 (buf!2148 b1!98))))))

(declare-fun bs!6615 () Bool)

(assert (= bs!6615 d!26860))

(assert (=> bs!6615 m!130395))

(assert (=> start!17190 d!26860))

(declare-fun d!26862 () Bool)

(assert (=> d!26862 (= (inv!12 b2!98) (invariant!0 (currentBit!4264 b2!98) (currentByte!4269 b2!98) (size!1758 (buf!2148 b2!98))))))

(declare-fun bs!6616 () Bool)

(assert (= bs!6616 d!26862))

(assert (=> bs!6616 m!130393))

(assert (=> start!17190 d!26862))

(check-sat (not d!26846) (not d!26852) (not d!26844) (not d!26854) (not d!26862) (not d!26858) (not d!26860))
