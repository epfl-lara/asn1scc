; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!66776 () Bool)

(assert start!66776)

(declare-fun res!246256 () Bool)

(declare-fun e!214059 () Bool)

(assert (=> start!66776 (=> (not res!246256) (not e!214059))))

(declare-fun at!281 () (_ BitVec 64))

(declare-datatypes ((array!18030 0))(
  ( (array!18031 (arr!8904 (Array (_ BitVec 32) (_ BitVec 8))) (size!7821 (_ BitVec 32))) )
))
(declare-fun a!429 () array!18030)

(assert (=> start!66776 (= res!246256 (and (bvsle #b0000000000000000000000000000000000000000000000000000000000000000 at!281) (bvslt at!281 (bvmul #b0000000000000000000000000000000000000000000000000000000000001000 ((_ sign_extend 32) (size!7821 a!429))))))))

(assert (=> start!66776 e!214059))

(assert (=> start!66776 true))

(declare-fun array_inv!7433 (array!18030) Bool)

(assert (=> start!66776 (array_inv!7433 a!429)))

(declare-fun b!298472 () Bool)

(declare-fun e!214058 () Bool)

(assert (=> b!298472 (= e!214059 e!214058)))

(declare-fun res!246257 () Bool)

(assert (=> b!298472 (=> (not res!246257) (not e!214058))))

(declare-fun lt!434589 () array!18030)

(declare-fun arrayBitRangesEq!0 (array!18030 array!18030 (_ BitVec 64) (_ BitVec 64)) Bool)

(assert (=> b!298472 (= res!246257 (arrayBitRangesEq!0 a!429 lt!434589 at!281 at!281))))

(declare-fun lt!434587 () (_ BitVec 32))

(declare-fun b!315 () Bool)

(declare-fun lt!434588 () (_ BitVec 32))

(assert (=> b!298472 (= lt!434589 (array!18031 (store (arr!8904 a!429) lt!434588 ((_ extract 7 0) (bvor (bvand ((_ sign_extend 24) (select (arr!8904 a!429) lt!434588)) (bvnot ((_ sign_extend 24) (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434587)))) ((_ sign_extend 24) (ite b!315 (select (store (store (store (store (store (store (store (store ((as const (Array (_ BitVec 32) (_ BitVec 8))) #b00000000) #b00000000000000000000000000000000 #b10000000) #b00000000000000000000000000000001 #b01000000) #b00000000000000000000000000000010 #b00100000) #b00000000000000000000000000000011 #b00010000) #b00000000000000000000000000000100 #b00001000) #b00000000000000000000000000000101 #b00000100) #b00000000000000000000000000000110 #b00000010) #b00000000000000000000000000000111 #b00000001) lt!434587) #b00000000))))) (size!7821 a!429)))))

(assert (=> b!298472 (= lt!434587 ((_ extract 31 0) (bvsrem at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(assert (=> b!298472 (= lt!434588 ((_ extract 31 0) (bvsdiv at!281 #b0000000000000000000000000000000000000000000000000000000000001000)))))

(declare-fun b!298473 () Bool)

(assert (=> b!298473 (= e!214058 (not (and (bvsge lt!434588 #b00000000000000000000000000000000) (bvslt lt!434588 (size!7821 a!429)))))))

(assert (=> b!298473 (arrayBitRangesEq!0 a!429 lt!434589 #b0000000000000000000000000000000000000000000000000000000000000000 at!281)))

(declare-datatypes ((Unit!20837 0))(
  ( (Unit!20838) )
))
(declare-fun lt!434586 () Unit!20837)

(declare-fun rec!19 (array!18030 (_ BitVec 64) Bool (_ BitVec 64)) Unit!20837)

(assert (=> b!298473 (= lt!434586 (rec!19 a!429 at!281 b!315 at!281))))

(assert (= (and start!66776 res!246256) b!298472))

(assert (= (and b!298472 res!246257) b!298473))

(declare-fun m!437603 () Bool)

(assert (=> start!66776 m!437603))

(declare-fun m!437605 () Bool)

(assert (=> b!298472 m!437605))

(declare-fun m!437607 () Bool)

(assert (=> b!298472 m!437607))

(declare-fun m!437609 () Bool)

(assert (=> b!298472 m!437609))

(declare-fun m!437611 () Bool)

(assert (=> b!298472 m!437611))

(declare-fun m!437613 () Bool)

(assert (=> b!298473 m!437613))

(declare-fun m!437615 () Bool)

(assert (=> b!298473 m!437615))

(push 1)

(assert (not b!298472))

(assert (not start!66776))

(assert (not b!298473))

(check-sat)

(pop 1)

(push 1)

(check-sat)

